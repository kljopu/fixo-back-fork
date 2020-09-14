from django.db import models
from utils.models import TimeStampModel


class EssayInformation(TimeStampModel):
    applicant = models.ForeignKey("accounts.Applicant", on_delete=models.CASCADE)
    service = models.ForeignKey("career.Service", on_delete=models.CASCADE, null=True, related_name="essayinformation")
    apply_company = models.CharField(max_length=200)
    apply_position = models.CharField(max_length=200)
    description = models.CharField(max_length=2000, null=True)
    status = models.IntegerField(max_length=1)

    class Meta:
        db_table = "essay_information"


class Essay(TimeStampModel):
    resume = models.ForeignKey(
        "EssayInformation", on_delete=models.CASCADE, related_name="essay"
    )
    question = models.CharField(max_length=5000, null=True)
    answer = models.CharField(max_length=5000, null=True)
    correction = models.CharField(max_length=5000, null=True)
    comment = models.TextField(max_length=5000, null=True)
    order = models.IntegerField(max_length=1)

    class Meta:
        db_table = "essays"

class EssayPayment(TimeStampModel):
    resume = models.ForeignKey(
        "EssayInformation", on_delete=models.CASCADE, related_name="essaypayment"
    )
    payment_uid = models.CharField(max_length=100, null=True)
    merchant_uid = models.CharField(max_length=100, null=True)
    paid_amount = models.IntegerField(null=True)
    payment_auth_number = models.CharField(max_length=100, null=True)

    class Meta:
        db_table = "essaypayments"
