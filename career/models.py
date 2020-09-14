from django.db import models
from utils.models import TimeStampModel


class Service(TimeStampModel):
    corrector = models.ForeignKey("accounts.Corrector", on_delete=models.CASCADE)
    name = models.CharField(max_length=2000)
    service_description = models.CharField(max_length=2000)
    image = models.URLField(max_length=2000)
    price = models.IntegerField()
    price_description = models.CharField(max_length=2000, null=True)
    career_detail = models.CharField(max_length=1000, null = True)

    class Meta:
        db_table = "services"
        managed = True
