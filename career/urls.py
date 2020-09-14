from django.urls import path, include
from rest_framework import routers
from .views import ServiceView, SMSAuthView

app_name = "service"

router = routers.DefaultRouter()
router.register(
    "/registration", ServiceView, basename="registration",
)

urlpatterns = [path("", include(router.urls)), path("/sms-auth", SMSAuthView.as_view())]
