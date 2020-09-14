from django.urls import path, include

from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework.routers import DefaultRouter

from statement.views import (
    EssayViewSet, 
    EssayPaymentView, 
    EssayListViewSet
)

router = DefaultRouter()
router.register('/list', EssayListViewSet, basename='list')
router.register('/modification', EssayViewSet, basename='modification')

urlpatterns = [
    path('/lists/<int:pk>', include(router.urls)),
    path("/payment", EssayPaymentView.as_view())
]

urlpatterns += router.urls