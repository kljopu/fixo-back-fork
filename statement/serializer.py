from rest_framework import serializers
from statement.models import *
from career.models import *
from accounts.models import *
from accounts.serializer import *
from drf_writable_nested.serializers import WritableNestedModelSerializer


class EssaySerializer(serializers.ModelSerializer):

    class Meta:
        model = Essay
        fields = '__all__'

class EssayInformationSerializer(WritableNestedModelSerializer):

    essay = EssaySerializer(many=True)

    class Meta:
        model = EssayInformation
        fields = ['id', 'applicant','service','essay','apply_company','apply_position','description','status']

class UserListSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ['id', 'thumbnail_image','username']

class ServiceListSerializer(serializers.ModelSerializer):

    user = UserListSerializer()

    class Meta:
        model = Corrector
        fields = ['id', 'user', 'current_company','current_task']

class ServiceEssaySerializer(serializers.ModelSerializer):

    corrector = ServiceListSerializer()

    class Meta:
        model = Service
        fields = ['id', 'corrector','name','service_description','image','price']

class ApplicantInformationSerializer(serializers.ModelSerializer):

    user = UserListSerializer()

    class Meta:
        model = Applicant
        fields = ['id', 'user']

class EssayInformationListSerializer(serializers.ModelSerializer):
    applicant = ApplicantInformationSerializer()
    service = ServiceEssaySerializer()

    class Meta:
        model = EssayInformation
        fields = ['id','applicant','service','apply_company','apply_position','status','created_at','updated_at']


