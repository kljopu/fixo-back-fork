from django.db import models


class TimeStampModel(models.Model):
    """Model definition for TimeStampModel."""

    created_at = models.DateTimeField(auto_now_add=True, null =True)
    updated_at = models.DateTimeField(auto_now=True, null =True)

    class Meta:
        abstract = True
