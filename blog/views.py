from unicodedata import name
from django.shortcuts import render

def LoginPage(request):
    return render(request  , 'blog/login.html' )

def HomePage(request):
    return render(request  , 'blog/HomePage.html' )