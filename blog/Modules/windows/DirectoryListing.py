import os

from django import views
# from blog.models import agent
from blog.views import *
from blog.models import *


#we need to send request from GUI user with agent(hidden parm) and path(opt)
def DirectoryListing(agent,path=' '):
    task = "ls {}".format(path)
    with open(listen_path+"agents/{}/tasks".format(agent), "w") as f:
        f.write(task)
        f.close()
    # ls c:\users


