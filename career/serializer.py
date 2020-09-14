import requests
from rest_framework import serializers

from drf_writable_nested.serializers import WritableNestedModelSerializer
from .models import Service
from accounts.models import Corrector
from accounts.serializer import UserThumbnailSerializer

class CorrectorBaseSerializer(WritableNestedModelSerializer):
    """Corrector Base Information Serializer"""
    user = UserThumbnailSerializer()

    class Meta:
        model = Corrector
        fields = [
            "id",
            "user",
            "current_company",
            "current_task",
            "certificate",
        ]
        depth = 1


class ServiceSerializer(
    serializers.HyperlinkedModelSerializer, WritableNestedModelSerializer
):
    """Service Information Serializer"""

    corrector = CorrectorBaseSerializer()

    class Meta:
        model = Service
        # exclude = ["created_at", "updated_at"]
        fields = ["id", "corrector", "url", "name", "service_description", "image", "price", "price_description", "career_detail"]
        extra_kwargs = {"url": {"view_name": "service:registration-detail"}}


class ServiceDetailSerializer(serializers.ModelSerializer):
    """Service Detail Serializer for update"""

    class Meta:
        model = Service
        exclude = ["created_at", "updated_at"]
        extra_kwargs = {"url": {"view_name": "service:registration-detail"}}
        depth = 1

