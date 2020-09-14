import time, requests, datetime, sys, os, hashlib, hmac, base64, json
from random import randint

from django.utils import timezone
from django.db import models
from django.contrib.auth.models import AbstractUser
from utils.models import TimeStampModel

from my_settings import NAVER_CLOUD


class User(AbstractUser):
    kakao_id = models.CharField(max_length=100)
    name = models.CharField(max_length=45)
    email = models.EmailField(max_length=45, null=True)
    is_corrector = models.BooleanField(default=False)
    email_auth_token = models.CharField(max_length=500, null=True)
    is_phone_auth = models.BooleanField(default=False)
    updated_at = models.DateTimeField(auto_now=True)
    thumbnail_image = models.URLField(max_length=2000)

    class Meta:
        db_table = "users"


class Corrector(TimeStampModel):
    user = models.ForeignKey("User", related_name="corrector", on_delete=models.CASCADE)
    current_company = models.CharField(max_length=1000, null=True)
    current_task = models.CharField(max_length=1000, null=True)
    company_email = models.EmailField(max_length=200, null=True)
    certificate = models.CharField(max_length=1000, null=True)

    class Meta:
        db_table = "correctors"


class Applicant(TimeStampModel):
    user = models.ForeignKey("User", on_delete=models.CASCADE, related_name="user")

    class Meta:
        db_table = "applicants"


class PhoneAuth(TimeStampModel):
    user = models.ForeignKey(User, on_delete=models.PROTECT)
    phone_number = models.CharField(primary_key=True, max_length=11)
    auth_number = models.IntegerField()

    class Meta:
        db_table = "phone_auth"

    def save(self, *args, **kwargs):
        self.auth_number = randint(10000, 100000)
        super().save(*args, **kwargs)
        self.send_sms()

    def send_sms(self, *args, **kwargs):
        timestamp = int(time.time() * 1000)
        timestamp = str(timestamp)
        access_key = NAVER_CLOUD["ACCESSKEY"]
        secret_key = NAVER_CLOUD["SECRETKEY"]
        secret_key = bytes(secret_key, "UTF-8")
        method = "POST"
        uri = "/sms/v2/services/{}/messages".format(NAVER_CLOUD["SERVICEKEY"])
        message = method + " " + uri + "\n" + timestamp + "\n" + access_key
        message = bytes(message, "UTF-8")
        signingKey = base64.b64encode(
            hmac.new(secret_key, message, digestmod=hashlib.sha256).digest()
        )
        url = "https://sens.apigw.ntruss.com/sms/v2/services/{}/messages".format(
            NAVER_CLOUD["SERVICEKEY"]
        )
        messages = {"to": self.phone_number}
        data = json.dumps(
            {
                "type": "SMS",
                "contentType": "COMM",
                "from": "01079198319",
                # "to"            :   [self.phone_number],
                "messages": [messages],
                "content": "[Fixo] 첨삭 서비스를 위해 본인 인증 번호 [{}]를 입력해주세요.".format(
                    self.auth_number
                ),
            }
        )
        headers = {
            "Content-Type": "application/json; charset=utf-8",
            "x-ncp-apigw-timestamp": timestamp,
            "x-ncp-iam-access-key": NAVER_CLOUD["ACCESSKEY"],
            "x-ncp-apigw-signature-v2": signingKey,
        }

        requests.post(url, data=data, headers=headers)
        return

    @classmethod
    def check_number(cls, p_numb, c_num):
        time_limit = timezone.now() - datetime.timedelta(minutes=5)
        result = cls.objects.filter(
            phone_number=p_numb, auth_number=c_num, updated_at__gte=time_limit
        )
        if result:
            return True
        return False
