import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

### $env:UserName
#   $env:UserDomain
#   $env:ComputerName


def usercommand_history(request, agent='', user=''):
    if request.method=='POST':
        if user=='':  #user field is optional
            task = 'echo "===============Specified user history===============";Get-Content C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Powershell\PSReadline\ConsoleHost_history.txt' 
        else:
            task = 'echo "===============Specified user history===============";Get-Content C:\Users\{}\AppData\Roaming\Microsoft\Windows\Powershell\PSReadline\ConsoleHost_history.txt'.format(user)      
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

    else:
        return render(request, 'blog/listeners.html')
