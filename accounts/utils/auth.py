import datetime
import time
import requests
from django.http import JsonResponse
import jwt


def tokenVerificationCheckDecorator(self, request):
    token           =   request.headers.get('Authorization')
    decoded         =   jwt.decode(token, verify = False, algorithm = 'HS256')
    exp             =   int(decoded['exp'])
    exp_to_date     =   datetime.datetime.fromtimestamp(exp)

    if (exp_to_date - datetime.datetime.now()) < datetime.timedelta(hours=4):
        data            =   {'access_token' : token}  
        accept          =   requests.post(
        f"http://localhost:8000/api-jwt-auth/refresh/", data = data
        )
        refreshed_token     =   accept.json().get('token')

        return JsonResponse({'access_token' : refreshed_token})

    else:
        return JsonResponse({'access_token' : token})