import os
from blog.views import *
from blog.models import *
from django.http import HttpResponse , JsonResponse

current_path= os.path.dirname(os.path.abspath(__file__))

def Apache(request):
    if request.method=='POST':
        agent = request.POST['agent']
        f = open("{}".format(current_path+"/Apache-file"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Avail_sh(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = "echo '=========== Lists available shells: ===========';cat /etc/shells 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def Cronjobs(request):
    if request.method=='POST':
        agent = request.POST['agent']
        f = open("{}".format(current_path+"cronjobs-file"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return render(request, 'blog/listeners.html')
    else:
        return render(request, 'blog/listeners.html')



def Hidden_files(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "=========== Hidden Files: ==========="; find / -name ".*" -type f ! -path "/proc/*" ! -path "/usr/*" ! -path "/opt/*" ! -path "/sys/*" -exec ls -al {} \; 2>/dev/null || find /root -name ".*" -type f 2>/dev/null'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    

def lsof(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = "echo '=========== lsof-list open files ===========';lsof -i"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def OS_info(request):
    if request.method=='POST':
        agent = request.POST['agent']
        f = open("{}".format(current_path+"OS_info-file"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    


def ProcessesLinux(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = "echo '=========== Running Services ===========';ps aux"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
    
def selinux(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = "echo '=========== Check if selinux is enabled: ===========';sestatus 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    

def SpecialPermissions(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = "echo '=========== Special Permissions ==========='; find / -type f -perm  -04000  -ls 2>/dev/null   & find / -type f -perm  -02000  -ls 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def TCP_UDP(request):
    if request.method=='POST':
        agent = request.POST['agent']
        f = open("{}".format(current_path+"TCP_UDP-file"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')



def UserPermissions(request):
    if request.method=='POST':
        agent = request.POST['agent']
        f = open("{}".format(current_path+"usr_priv-file"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def usrs_info(request):
    if request.method=='POST':
        agent = request.POST['agent']
        f = open("{}".format(current_path+"usrs_info-file"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
    
    
def Whoami(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = "echo '==========whoami===========';whoami;echo '=========';echo 'Current user group:';id 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')