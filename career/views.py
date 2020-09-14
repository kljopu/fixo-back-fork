from datetime import datetime
from urllib import parse
import boto3
import json

from django.http import HttpResponse, JsonResponse
from django.contrib.auth import get_user_model
from django.core.exceptions import PermissionDenied

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, filters, viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.decorators import (
    api_view,
    permission_classes,
    authentication_classes,
)

from .models import Service
from .serializer import ServiceSerializer, ServiceDetailSerializer

from accounts.models import User, Corrector, PhoneAuth
from my_settings import S3, DEFAULT_IMAGE_URL


class ImageProcess:
    """이미지 업로드, 삭제 처리"""

    s3_client = boto3.client(
        "s3",
        aws_access_key_id=S3["aws_access_key_id"],
        aws_secret_access_key=S3["aws_secret_access_key"],
    )

    def upload_image(self, user, file):
        file_name = (
            "service/"
            + str(datetime.now().date())
            + "_"
            + str(user.kakao_id)
            + "_"
            + str(Service.objects.count() + 1)
            + "."
            + file.content_type.split("/")[1]
        )
        self.s3_client.upload_fileobj(
            file,
            S3["bucket_name"],
            file_name,
            ExtraArgs={"ContentType": file.content_type},
        )
        image_url = S3["s3_url"] + file_name
        return image_url

    def delete_image(self, service_id):
        old_image_filename = Service.objects.get(id=service_id).image.split("/")[-1]
        self.s3_client.delete_object(
            Bucket=S3["bucket_name"], Key=f"service/{old_image_filename}"
        )
        return


User = get_user_model()


class ServiceView(viewsets.ModelViewSet):
    """Service Registration View"""

    queryset = Service.objects.all()
    serializer_class = ServiceSerializer
    search_fields = [
        "career_detail",
        "name",
        "corrector__current_company",
        "corrector__current_task",
    ]
    filter_backends = (filters.SearchFilter,)

    @permission_classes((IsAuthenticated,))
    @authentication_classes((JSONWebTokenAuthentication,))
    def create(self, request, *args, **kwargs):
        try:
            user = request.user
            # 이메일 인증 여부
            if not user.is_corrector:
                return JsonResponse(
                    {"MESSAGE": "NEED EMAIL AHTHENTICATION"}, status=401
                )
            # 휴대폰 인증 여부
            if not user.is_phone_auth:
                return JsonResponse({"MESSAGE": "NEED PHONE ATHENTICATION"}, status=401)
            # 전처리가 필요한 항목만 따로 저장
            corrector_keys = [
                "current_company",
                "current_task",
                "certificate",
            ]
            corrector_data = {i: request.data[i] for i in corrector_keys}
            certificates = corrector_data["certificate"]
            corrector_data["certificate"] = "$".join(
                i["description"] for i in json.loads(certificates)
            )
            defaults = {"defaults": corrector_data}
            corrector, created = Corrector.objects.update_or_create(
                user=user, **defaults
            )
            service_keys = [
                "name",
                "service_description",
                "price",
                "price_description",
                "career_detail",
            ]
            service_related_data = {i: request.data[i] for i in service_keys}
            career_info = json.loads(service_related_data["career_detail"])
            career_info[0]["date_end"] = (
                "재직중"
                if career_info[0]["date_end"] is None
                else career_info[0]["date_end"]
            )
            details = [
                i["date_start"].split("T")[0]
                + "_"
                + i["date_end"].split("T")[0]
                + "_"
                + i["description"]
                for i in career_info
            ]
            details.sort(reverse=True)
            career_detail = "$".join(i for i in details)
            service_related_data["career_detail"] = career_detail
            service_id = kwargs.get("pk", None)
            image_process = ImageProcess()
            if service_id:
                # s3 기존 이미지 삭제
                image_process.delete_image(service_id)
                if request.FILES:
                    # s3 새 이미지 업데이트
                    image_url = image_process.upload_image(user, request.FILES["file"])
                else:
                    image_url = request.data.get("revise_url_image", DEFAULT_IMAGE_URL)
                service_related_data["image"] = image_url
                Service.objects.filter(pk=service_id).update(**service_related_data,)
            else:
                if request.FILES:
                    image_url = image_process.upload_image(user, request.FILES["file"])
                else:
                    image_url = DEFAULT_IMAGE_URL
                service_related_data["image"] = image_url
                Service.objects.create(
                    corrector=corrector, **service_related_data,
                )
                return HttpResponse(status=200)
        except KeyError as e:
            return JsonResponse({"MESSAGE": f"{e} ERROR"}, status=400)

    def retrieve(self, request, pk):
        queryset = Service.objects.filter(pk=pk)
        serializer = ServiceDetailSerializer(
            queryset, many=True, context={"request": request}
        )

        return Response(serializer.data)


class SMSAuthView(APIView):
    """APIView for authenticating correctors to registrate service"""

    authentication_classes = [JSONWebTokenAuthentication]

    def post(self, request):
        try:
            user = request.user
            p_num = request.data["phone_number"]
            PhoneAuth.objects.update_or_create(phone_number=p_num, user=user)
            return Response({"message": "MSG SENT"}, status=200)
        except KeyError:
            return Response(
                {"message": "INVALID INPUT"}, status=status.HTTP_400_BAD_REQUEST
            )

    def put(self, request):
        try:
            user = request.user
            p_num = request.data["phone_number"]
            a_num = request.data["auth_number"]

        except KeyError:
            return Response(
                {"message": "Bad Request"}, status=status.HTTP_400_BAD_REQUEST
            )

        else:
            result = PhoneAuth.check_number(p_num, a_num)
            if result:
                User.objects.filter(id=user.id).update(is_phone_auth=True)
            return Response({"message": "OK", "result": result})

    @classmethod
    def get_extra_actions(cls):
        return []
