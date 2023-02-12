import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))
def hashcat(request, agent='' , comp='', linkedin_mail='' , linkedin_password=''):
    if request.method=='POST':
        hashtype = request.POST['hashtype']
        hashfile = request.POST['hashfile']
        passwordslist = request.POST['passwordslist']
        outputfile = request.POST['outputfile']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============HASHCAT===============\nOutPut in the following path:\n{result_dir}' >> {result_path};hashcat -m {hashtype} {hashfile} {passwordslist} -o {result_dir}/outputfile".format(result_dir,result_path,hashtype,hashfile,passwordslist,outputfile))
    else:
        return render(request, 'blog/listeners.html')
