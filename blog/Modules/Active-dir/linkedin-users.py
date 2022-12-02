import os
from blog.views import *
from blog.models import *

 # python linkedin2username.py -c uber-com -u kareem@test.com -p pass 

current_path= os.path.dirname(os.path.abspath(__file__))


def linked_users(request, agent='' , comp='', linkedin_mail='' , password='' , out_dir=''):
    if request.method=='POST':
        os.system("python ../general/linkedin2username/linkedin2username.py -c {} -u {} -p {} -o {}".format(comp,linkedin_mail,password, out_dir))
        out_path = os.path.normpath(current_path+os.sep+os.pardir)+"/general/linkedin2username/{}".format(out_dir)
        print("Output is saved Here -->  "+out_path)
    else:
        return render(request, 'blog/listeners.html')

    
