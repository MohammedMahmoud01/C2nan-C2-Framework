import os
from blog.views import *
from blog.models import *

 # nmap 172.16.5.12 
 # nmap -p- -T4 172.16.5.12

def fbing(request, agent='' , arg=''):
    if request.method=='POST':
        result_path = "../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============NMAP O/P===============';nmap {} >> {} ".format(arg,result_path))
    else:
        return render(request, 'blog/listeners.html')

    
