import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

def Hidden_files(request, agent=''):
    if request.method=='POST':
        task = 'echo "=========== Hidden Files: ==========="; find / -name ".*" -type f ! -path "/proc/*" ! -path "/usr/*" ! -path "/opt/*" ! -path "/sys/*" -exec ls -al {} \; 2>/dev/null || find /root -name ".*" -type f 2>/dev/null'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
