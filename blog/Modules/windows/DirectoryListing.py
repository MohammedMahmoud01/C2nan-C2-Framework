import os
# from django import views
# from blog.models import agent
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

#we need to send request from GUI user with agent(hidden parm) and path(opt)
def DirectoryListing(request, agent='YXGYCW',path=' '):
    if request.method=='POST':
        task = "ls {}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
    # ls c:\users


