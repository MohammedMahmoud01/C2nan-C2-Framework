import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

def user_info(request, agent=''):
    if request.method=='POST':
        task = 'echo "===============Current user===============";whoami;echo "===============User Privileges===============";whoami /priv;echo "===============User group information===============";whoami /groups'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
