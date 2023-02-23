import os
from blog.views import *
from blog.models import *

current_path= os.path.dirname(os.path.abspath(__file__))
def hashcat(request):
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


 # nmap 172.16.5.12 
 # nmap -p- -T4 172.16.5.12

def nmap(request):
    if request.method=='POST':
        agent = request.POST['agent']
        agentId = request.POST['agentId']
        moduleId = request.POST['moduleId']
        agentTask = AgentTasks(agent_id = agentId , module_id = moduleId)
        agentTask.save()
        arg = request.POST['arg']
        result_path = "../data/listeners/agents/{}/results".format(agent)
        os.system("echo '===============NMAP O/P===============' >> {result_path};nmap {arg} >> {result_path} ".format(arg,result_path))
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
        os.system("echo '===============Python Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} python3 -m http.server --directory {directory} {serverport};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============SMB Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout} impacket-smbserver share -smb2support {directory} -port {port};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============Python Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============Python Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m uploadserver --port {serverport} --directory {directory};".format(timeout,result_path,directory,serverport))
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
        os.system("echo '===============FTP Upload Server===============\nFor {timeout} seconds' >> {result_path}; timeout {timeout}  python3 -m pyftpdlib --port {serverport} --directory {directory} --write;".format(timeout,result_path,directory,serverport))
        return JsonResponse({},status=200)
    else:
        return render(request, 'blog/listeners.html')
