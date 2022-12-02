import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))


def test_localAdmin(request, agent='', compName='', user='', password='', domain=''):
    if request.method=='POST':
        if user == '':
            task = 'echo "===============Test-AdminAccess===============";import-module powerview;Test-AdminAccess -ComputerName {}'.format(compName)    
            task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
            with open(task_path, "w") as f:
                f.write(task)
                f.close()
        else:
            task = 'echo "===============Test-AdminAccess===============";import-module powerview;$SecPassword = ConvertTo-SecureString "{password}" -AsPlainText -ForceGet-DomainTrustMapping;$Cred =New-Object System.Management.Automation.PSCredential("{domain}\{user}", $SecPassword);Test-AdminAccess -ComputerName {compName} -Credential $Cred'.format(password,domain,user,compName)    
            task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
            with open(task_path, "w") as f:
                f.write(task)
                f.close()

    else:
        return render(request, 'blog/listeners.html')
