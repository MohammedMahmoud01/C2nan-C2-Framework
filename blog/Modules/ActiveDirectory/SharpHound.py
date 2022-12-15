import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

#### we need to download ../general/SharpHound.exe on the windows machine


def sharp(request, agent='', out_file=''):
    if request.method=='POST':
        task = 'echo "===============SharpHound===============";.\windows\temp\SharpHound.exe -c All --OutputPrefix {}'.format(out_file)       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
#### we need to get our_file*.zip on our machine

    else:
        return render(request, 'blog/listeners.html')
