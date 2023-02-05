from django.urls import path
from djjs.views import DjjsView  

urlpatterns = [
   path("", DjjsView.as_view(), name="djjs"),  
]

