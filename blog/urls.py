from django.urls import path
from . import views 
urlpatterns = [
    path('', views.LoginPage , name='blog-login'),
    path('homePage/' , views.HomePage  , name='blog-home'),
    path('listeners/' , views.ListenersPage  , name='blog-listener'),
    path('screenshot/' , views.ScreenShotMethod  , name='blog-screenshot'),
    path('directorylist/' , views.dirlist  , name='blog-directorylist'),
]
