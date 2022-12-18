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
        task = "echo '=========== Lists_available_shells: ===========';cat /etc/shells 2>/dev/null"
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
        f = open("{}".format(current_path+"/cronjobs-file"), "rt")
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
        task = 'echo "===========Hidden_Files:==========="; find / -name ".*" -type f ! -path "/proc/*" ! -path "/usr/*" ! -path "/opt/*" ! -path "/sys/*" -exec ls -al {} \; 2>/dev/null || find /root -name ".*" -type f 2>/dev/null'
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
        task = "echo '===========lsofList_open_files===========';lsof -i"
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
        f = open("{}".format(current_path+"/OS_info-file"), "rt")
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
        task = "echo '===========_Running_Services===========';ps aux"
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
        task = "echo '===========Check_if_selinux_is_enabled:===========';sestatus 2>/dev/null"
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
        task = "echo '===========Special_Permissions==========='; find / -type f -perm  -04000  -ls 2>/dev/null   & find / -type f -perm  -02000  -ls 2>/dev/null"
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
        f = open("{}".format(current_path+"/TCP_UDP-file"), "rt")
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
        f = open("{}".format(current_path+"/usr_priv-file"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def linusrs_info(request):
    if request.method=='POST':
        agent = request.POST['agent']
        f = open("{}".format(current_path+"/usrs_info-file"), "rt")
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
    
    
    
def LinuxChangeDirectory(request):
    if request.method=='POST':
        agent = request.POST['agent']
        path = request.POST['path']
        task = "cd {}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def LinuxChmod(request):
    if request.method=='POST':
        agent = request.POST['agent']
        mode = request.POST['mode']
        filePath= request.POST['filePath']
        task = "chmod {} {}".format(mode,filePath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
   
def Linuxcp(request):
    if request.method=='POST':
        agent = request.POST['agent']
        path1 = request.POST['path1']
        path2= request.POST['path2']
        task = "cp {} {}".format(path1,path2)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    

def Linuxgcc(request):
    if request.method=='POST':
        agent = request.POST['agent']
        cfile = request.POST['cfile']
        option= request.POST['option']
        bfile= request.POST['bfile']
        task = "gcc {} {} {}".format(cfile, option, bfile)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def LinuxDirectoryListing_Details(request):
    if request.method=='POST':
        agent = request.POST['agent']
        path = request.POST['path']
        task = "ll {}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def LinuxDirectoryListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        path = request.POST['path']
        task = "ls {}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
def LinuxMakeDirectory(request):
    if request.method=='POST':
        agent = request.POST['agent']
        dirName = request.POST['dirName']
        task = "mkdir {}".format(dirName)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def LinuxNetdiscover(request):
    if request.method=='POST':
        agent = request.POST['agent']
        option = request.POST['option']
        atr = request.POST['atr']
        task = "netdiscover {} {}".format(option, atr)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def LinuxTouch(request):
    if request.method=='POST':
        agent = request.POST['agent']
        fileName = request.POST['fileName']
        task = "touch {}".format(fileName)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def LinuxBash(request):
    if request.method=='POST':
        agent = request.POST['agent']
        command = request.POST['command']
        task = "bash {}".format(command)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def LinuxWfuzz(request):
    if request.method=='POST':
        agent = request.POST['agent']
        arg = request.POST['arg']
        task = "wfuzz {}".format(arg)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
    
def ExecuteCommandWithSpecUser(request):
    if request.method=='POST':
        agent = request.POST['agent']
        username = request.POST['username']
        password = request.POST['password']
        command = request.POST['command']
        task='echo "su - {} <<! >/dev/null 2>&1\n{}\n{}\n\!" > test;chmod +x test;bash test'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')