from rest_framework import serializers
from .models import Hello


class HelloSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Hello
        fields = ['content']


