import os
from blog.views import *
from blog.models import *

 # fping -asgq 172.16.5.0/23 

def fbing(request, agent='' , iprange=''):
    if request.method=='POST':
        result_path = "../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============FPING O/P===============';fping -asgq {} >> {} ".format(iprange,result_path))
    else:
        return render(request, 'blog/listeners.html')

    
