import os
from blog.views import *
from blog.models import *

 # kerbrute userenum -d INLANEFREIGHT.LOCAL --dc 172.16.5.5 jsmith.txt -o valid_ad_users

def fbing(request, agent='' , domain='', dc_ip='', users_list='' , output=''):
    if request.method=='POST':
        result_path = "../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============kerbrute O/P===============';kerbrute userenum -d {} --dc {} {} | cut -d ':' -f 4 | sed 's/ //g' >> {} ".format(domain,dc_ip,users_list,result_path))

    else:
        return render(request, 'blog/listeners.html')

    
