import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

def DirectoryListing(request, agent='',phrase=''):
    if request.method=='POST':
        task = 'echo "===============All files contain "{}"===============";findstr /SIM /C:"{}" *.txt *ini *.cfg *.config *.xml'.format(phrase , phrase)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
    # ls c:\users


