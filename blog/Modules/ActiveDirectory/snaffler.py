import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

#### we need to download ../general/Snaffler.exe on the windows machine


def snaffler(request, agent='', domain=''):
    if request.method=='POST':
        task = 'echo "===============Snaffler===============";.\windows\temp\Snaffler.exe -d {} -o snaffler.log -v data'.format(domain)       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
#### we need to get snaffler.log on our machine

    else:
        return render(request, 'blog/listeners.html')
