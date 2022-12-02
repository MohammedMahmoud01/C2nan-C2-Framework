#crackmapexec smb 172.16.5.5 -u htb-student -p Academy_student_AD! --users
import os
from blog.views import *
from blog.models import *

#crackmapexec smb 172.16.5.5 -u htb-student -p Academy_student_AD! --users

current_path= os.path.dirname(os.path.abspath(__file__))


def enum_withcreds(request, agent='' ,  protocol='', ip='' , username='', password='' ):
    if request.method=='POST':
        os.system("crackmapexec {} {} -u {} -p {} --users > valid_userslist".format(protocol,int(ip),username,password))
        out_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/valid_userslist".format(agent)
        print("Output is saved Here -->  "+out_path)
    else:
        return render(request, 'blog/listeners.html')

    
