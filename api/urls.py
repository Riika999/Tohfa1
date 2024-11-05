from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import UserViewSet, GiftViewSet, OccasionViewSet  # Include all necessary viewsets

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'gifts', GiftViewSet)
router.register(r'occasions', OccasionViewSet)
# Register remaining viewsets similarly

urlpatterns = [
    path('', include(router.urls)),
]