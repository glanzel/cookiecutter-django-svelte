from rest_framework import viewsets
from .serializers import HelloSerializer
from .models import Hello

# REST Views.

class HelloViewSet(viewsets.ModelViewSet):
    queryset = Hello.objects.all()
    serializer_class = HelloSerializer
    permission_classes = []

