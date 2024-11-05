from rest_framework import viewsets
from .models import User, Gift, Occasion, Keyword, GiftOccasion, GiftKeyword, Order, OrderItem, Review
from .serializers import UserSerializer, GiftSerializer, OccasionSerializer, KeywordSerializer, GiftOccasionSerializer, GiftKeywordSerializer, OrderSerializer, OrderItemSerializer, ReviewSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer

class GiftViewSet(viewsets.ModelViewSet):
    queryset = Gift.objects.all()
    serializer_class = GiftSerializer

class OccasionViewSet(viewsets.ModelViewSet):
    queryset = Occasion.objects.all()
    serializer_class = OccasionSerializer

# Similar for Keyword, GiftOccasion, GiftKeyword, Order, OrderItem, Review
# Repeat for each viewset