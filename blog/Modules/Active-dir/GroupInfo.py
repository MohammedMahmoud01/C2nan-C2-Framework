import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))


def groupInfo(request, agent='', group=''):
    if request.method=='POST':
        task = 'echo "===============Get-ADGroup===============";Get-ADGroup -Identity "{group}";echo "===============Get-DomainGroupMember===============";import-module  c:\windows\temp\powerview.ps1;Get-DomainGroupMember -Identity "{}" -Recurse'.format(group)
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

    else:
        return render(request, 'blog/listeners.html')
