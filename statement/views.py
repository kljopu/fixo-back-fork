import json

from django.shortcuts import render, get_object_or_404
from django.contrib.auth import get_user_model
from django.core.exceptions import PermissionDenied
from django.http import HttpResponse, JsonResponse

from rest_framework import viewsets
from rest_framework import permissions
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.request import Request
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication

from statement.models import (
    EssayInformation,
    Essay,
    EssayPayment
)
from accounts.models import (
    User,
    Applicant,
    Corrector
)
from statement.serializer import (
    EssayInformationSerializer,
    EssayInformationListSerializer
)


class EssayViewSet(viewsets.ModelViewSet):
    """View for writing and fixing essay"""

    queryset = EssayInformation.objects.all()
    serializer_class = EssayInformationSerializer

    permission_classes  =   (permissions.IsAuthenticated,)
    authentication_classes=[JSONWebTokenAuthentication]

    def create(self, request):
        received_user   = User.objects.get(username=request.user)

        user_input_data = json.loads(request.body)

        if Applicant.objects.filter(user=received_user).exists():
            applicant = Applicant.objects.get(user=received_user)

        else:
            applicant = Applicant.objects.create(user=received_user)

        states= user_input_data['essay']

        statement_info = EssayInformation.objects.create(
            applicant      = applicant, 
            apply_company  = user_input_data['apply_company'], 
            apply_position = user_input_data['apply_position'], 
            service_id     = user_input_data['service'],
            description    = user_input_data['description'],
            status         = 0
            )

        for state in states:
            Essay(resume = statement_info, **state).save()

        created_statement = EssayInformation.objects.get(id=statement_info.id)
        serializer = EssayInformationSerializer(created_statement)
        
        return Response(serializer.data)


class EssayListViewSet(viewsets.ModelViewSet):
    """View for written essay list"""

    permission_classes  =   (permissions.IsAuthenticated,)
    authentication_classes = [JSONWebTokenAuthentication]
    queryset = EssayInformation.objects.all()
    serializer_class = EssayInformationListSerializer

    def list(self, request):
        specified_user=User.objects.get(username=request.user)

        
        if specified_user.is_corrector==False:

            specified_applicant = Applicant.objects.get(user=specified_user)
            selected_essay = EssayInformation.objects.filter(applicant=specified_applicant)
            serializer = EssayInformationListSerializer(selected_essay, many=True)

            return Response(serializer.data)

        else:
            
            specified_corrector = Corrector.objects.get(user=specified_user)
            print(specified_corrector)
            selected_essay = EssayInformation.objects.filter(service__corrector=specified_corrector).exclude(status=0)
            serializer = EssayInformationListSerializer(selected_essay, many=True)

            return Response(serializer.data)


class EssayPaymentView(APIView):
    """View for saving essay payment information"""
    
    permission_classes  =   (permissions.IsAuthenticated,)
    authentication_classes = [JSONWebTokenAuthentication]

    def post(self, request):
        order_dict = json.loads(request.body)
        order_information = order_dict['id']
        if EssayPayment.objects.filter(resume_id=order_information['id']).exists():
            return Response(
                {"message": "already paid essay"}, status=status.HTTP_400_BAD_REQUEST
                )
        else:
            try:
                EssayPayment.objects.create(
                    resume_id           = order_information['id'],
                    payment_uid         = order_information['payment_uid'],
                    merchant_uid        = order_information['merchant_uid'],
                    paid_amount         = order_information['paid_amount'],
                    payment_auth_number = order_information['payment_auth_number']                
                    )

                paid_essay = EssayInformation.objects.get(id=order_information['id'])
                paid_essay.status = 1
                paid_essay.save()

                return Response({"message": "payment information is saved"}, status=200)
            except KeyError:
                return Response(
                    {"message": "Invalid key"}, status=status.HTTP_400_BAD_REQUEST
                )
