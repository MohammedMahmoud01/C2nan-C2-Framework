import os
from blog.views import *
from blog.models import *
from rest_framework.views import APIView

current_path= os.path.dirname(os.path.abspath(__file__))

#we need to send request from GUI user with agent(hidden parm) and path(opt)
def DirectoryListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        path = request.POST['path']
        task = "ls {}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
    # ls c:\users

def Applocker(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============AppLocker Rules===============";Get-AppLockerPolicy -Effective | select -ExpandProperty RuleCollections;echo "===============AppLocker Policy Test===============";Get-AppLockerPolicy -Local | Test-AppLockerPolicy -path C:\Windows\System32\cmd.exe -User Everyone'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')