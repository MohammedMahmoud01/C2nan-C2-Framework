import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))


def HotFixes(request, agent=''):
    if request.method=='POST':
        task = 'echo "===============Hot Fixes===============";wmic qfe get Caption,Description,HotFixID,InstalledOn'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

    else:
        return render(request, 'blog/listeners.html')