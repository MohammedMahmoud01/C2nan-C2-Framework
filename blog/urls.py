from urllib import request
from django.urls import path
from . import views
from .Modules.windows import windowsModules
from .Modules.Linux import linuxModules
from .Modules.ActiveDirectory import ActiveDirectory
# from views import views.Listener

#ddasdx
#/sc/ddasdx
#/sc/
urlpatterns = [
    path('homePage/' , views.HomePage  , name='blog-home'),
    path('listeners/' , views.ListenersPage  , name='blog-listener'),
    path('start-listener/' , views.TestPage , name='blog-test'),
    path('postlistener/' , views.Listener.PostListener.as_view() , name='blog-listener'),
    path('payload-Gen/' , views.Listener.payloadGen.as_view() , name='blog-payload'),
    path('lin_payload-Gen/' , views.Listener.lin_payloadGen.as_view() , name='blog-lin_payload'),
    path('reg/' , views.registerAgent , name='blog-register'),
    path('tsks/' , views.Tasks  , name='blog-tasks'),
    path('sc/<eth>/',views.Listener.agent.sendScript,name='blog-sendScript'),
    path('download/<eth>/',views.Listener.agent.sendFile,name='blog-sendFile'),
    path('tasks/<name>/',views.Listener.agent.serveTasks,name='blog-serveTasks'),
    path('results/<name>/', views.Listener.agent.receiveResults , name='blog-result'),
    path('hackeruser/createuser/', views.HackerUser , name='blog-createuser'),
    path('launcher/', views.Launcher , name='blog-Launcher'),
    path('Lin-results/<name>/', views.Listener.agent.LinreceiveResults , name='blog-Linresult'),
    path('upload/', views.upload_file , name='blog-upload'),
    ##################################### Windows Start
    path('tasksApi/<int:type>/', views.TasksApi.as_view()),
    path('directorylist/' , windowsModules.DirectoryListing), # 1
    path('applocker/' , windowsModules.Applocker), # 2
    path('download/' , windowsModules.Download), # 3
    path('envvar/' , windowsModules.env_var), # 4
    path('phrasefinder/' , windowsModules.Phrase_finder), # 5
    path('ipswindows/' , windowsModules.IPsWindows), # 6
    path('loggedusers/' , windowsModules.logged_users), # 7
    path('netconnections/' , windowsModules.Net_Connections), # 8
    path('programs/' , windowsModules.Programs), # 9
    path('processeswindows/' , windowsModules.processes), # 10
    path('screenshot/' , windowsModules.ScreenShot), # 11
    path('userinfo/' , windowsModules.user_info), # 12
    path('systeminfo/' , windowsModules.Systeminfo), # 13
    path('updateswindows/' , windowsModules.UpdatesWindows), # 14
    path('uploads/' , windowsModules.UploadFileWindows), # 15
    path('windefstat/' , windowsModules.WinDefStat), # 16
    path('namedpipes/' , windowsModules.Named_pipes), # 17
    path('juicypotato/' , windowsModules.juicypotato), # 18
    ############################### windows Ends
    ############################### linux Starts
    path('apache/' , linuxModules.Apache), # 19
    path('availableshell/' , linuxModules.Avail_sh), # 20
    path('cronjobs/' , linuxModules.Cronjobs), # 21
    path('hiddenfiles/' , linuxModules.Hidden_files), # 22
    path('lsof/' , linuxModules.lsof), # 23
    path('osinfo/' , linuxModules.OS_info), # 24
    path('processeslinux/' , linuxModules.ProcessesLinux), # 25
    path('selinux/' , linuxModules.selinux), # 26
    path('specialpermissions/' , linuxModules.SpecialPermissions), # 27
    path('tcpudp/' , linuxModules.TCP_UDP), # 28
    path('userpermissions/' , linuxModules.UserPermissions), # 29
    path('userinfo/' , linuxModules.usrs_info), # 30
    path('whoami/' , linuxModules.Whoami), # 31
    ############################### linux Ends
    ############################### ActiveDirectory Starts
    path('accsforkerb/' , ActiveDirectory.ACCsforKerb), # 32
    path('acclisting/' , ActiveDirectory.ACC_listing), # 33
    path('adapter/' , ActiveDirectory.Adapter), # 34
    path('arptable/' , ActiveDirectory.ArpTable), # 35
    path('defensecheck/' , ActiveDirectory.DefenseCheck), # 36
    path('domaininfo/' , ActiveDirectory.DomainInfo), # 37
    path('domainusers/' , ActiveDirectory.DomainUsers), # 38
    path('downloadwindows/' , ActiveDirectory.DownloadWindows), # 39
    path('envactivedirectoryvalue/' , ActiveDirectory.EnvActiveDirectoryValue), # 40
    path('groupslisting/' , ActiveDirectory.GroupsListing), # 41
    path('groups/' , ActiveDirectory.Groups), # 42
    path('hotfixes/' , ActiveDirectory.HotFixes), # 43
    path('ip4route/' , ActiveDirectory.Ip4Route), # 44
    path('listexecpolicies/' , ActiveDirectory.ListExecPolicies), # 45
    path('listingmodules/' , ActiveDirectory.ListingModules), # 46
    path('defensecheck/' , ActiveDirectory.DefenseCheck), # 47
    path('sysacclisting/' , ActiveDirectory.SysaccListing), # 48
    path('trustmap/' , ActiveDirectory.TrustMap), # 49
    path('trustrelation/' , ActiveDirectory.TrustRelation), # 50
    
    ############################### ActiveDirectory Ends
    # path('results/{}'.format(Listener.name) , views.receiveResults , name='blog-result'),
]

