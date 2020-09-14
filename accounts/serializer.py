from rest_framework import serializers
from .models import Applicant, User, Corrector


class ApplicantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Applicant
        fields = ["id", "user", "url"]


class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = "__all__"
        lookup_field = "id"


class UserThumbnailSerializer(serializers.ModelSerializer):
    """User kakao thumbnail Serializer"""

    class Meta:
        model = User
        fields = ["id", "thumbnail_image"]


class CorrectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Corrector
        fields = "__all__"

class UserThumbnailSerializer(serializers.ModelSerializer):
    """User kakao thumbnail Serializer"""
    class Meta:
        model = User
        fields = ["id", "thumbnail_image"]

