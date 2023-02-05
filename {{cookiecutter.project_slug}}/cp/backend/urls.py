"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from backend.hello.views import HelloViewSet 
from rest_framework import routers
 

router = routers.DefaultRouter()
router.register(r'hello', HelloViewSet)


urlpatterns = [
    path("djadmin/", admin.site.urls),
    path('api/dj/', include(router.urls)),
]

try:
    from tail.urls import urlpatterns as up2
    urlpatterns += up2
    print(" **** Imported tail urls sucesfully ***")
except ImportError or ModuleNotFoundError as error:
    print(error)

try:
    from djjs.urls import urlpatterns as up1
    urlpatterns += up1
    print(" **** Imported djjs urls sucesfully ***")
except ImportError or ModuleNotFoundError as error:
    print(error)
    



