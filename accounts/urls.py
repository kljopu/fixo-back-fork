from django.urls import path, include
from .views import (
    ApplicantView,
    UserView,
    KakaoLoginView,
    kakaoSignup,
    EmailAuthenticationView,
    EmailAuthSuccView,
)
from rest_framework import routers

router = routers.DefaultRouter()
router.register("applicant", ApplicantView, basename="applicant")
router.register("user", UserView, basename="user")
router.register("auth", EmailAuthenticationView, basename="auth")
router.register(
    r"auth-success/(?P<auth_token>.+)", EmailAuthSuccView, basename="auth-succss"
)


urlpatterns = [
    path("/", include(router.urls)),
    path("/login/kakao/callback/", kakaoSignup, name="kakao_callback"),
    path("/rest-auth/kakao/", KakaoLoginView.as_view(), name="kakao_login"),
]
