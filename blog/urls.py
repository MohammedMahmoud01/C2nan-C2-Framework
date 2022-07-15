from django.urls import path
from . import views 
urlpatterns = [
    path('', views.LoginPage , name='blog-login'),
    path('homePage/' , views.HomePage  , name='blog-home')
]
