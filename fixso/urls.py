from django.urls import path, include
from django.contrib import admin
from django.conf.urls import url

# from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from rest_framework_jwt.views import (
    obtain_jwt_token,
    refresh_jwt_token,
    verify_jwt_token,
)

urlpatterns = [
    path("accounts", include("accounts.urls")),
    path('statement', include('statement.urls')),
    path("service", include("career.urls")),
    url(r"^rest-auth/", include("rest_auth.urls")),
    url(r"api-jwt-auth/$", obtain_jwt_token),  # 토큰 획득
    url(r"^api-jwt-auth/refresh/$", refresh_jwt_token),  # 토큰 갱신
    url(r"^api-jwt-auth/verify/$", verify_jwt_token),  # 토큰 확인
    path(r"^rest-auth/registration/", include("rest_auth.registration.urls")),
    path("admin/", admin.site.urls),

]

