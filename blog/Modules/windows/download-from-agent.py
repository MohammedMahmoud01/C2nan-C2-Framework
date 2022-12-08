#I want the Agent also to upload his file to the upload path using a full POST request to the file upload funtion just as if we uploaded it in GUI 
#and we can later download it 

import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))
#Filename to be downloaded from Agent
def Dwnload(request, agent='', url='', outpath=''):
    if request.method=='POST':
        task = 'iwr -Uri {} -OutFile {}'.format(url, outpath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

    else:
        return render(request, 'blog/listeners.html')
