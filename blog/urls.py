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
    path('postlistener/' , views.Listener.PostListener.as_view() , name='blog-listener'),
    path('payload-Gen/' , views.Listener.payloadGen.as_view() , name='blog-payload'),
    path('lin_payload-Gen/' , views.Listener.lin_payloadGen.as_view() , name='blog-lin_payload'),
    path('reg/' , views.registerAgent , name='blog-register'),
    path('agent/' , views.AgentPage , name='blog-agent'),
    path('tasksHandling/<name>/' , views.Tasks  , name='blog-tasks'),
    path('agentTask/<id>/' , views.AgentTask  , name='blog-agentTask'),
    path('getFileResult/<name>/' , views.GetFileResult.as_view() ),
    path('sc/<eth>/',views.Listener.agent.sendScript,name='blog-sendScript'),
    path('download/<eth>/',views.Listener.agent.sendFile,name='blog-sendFile'),
    path('tasks/<name>/',views.Listener.agent.serveTasks,name='blog-serveTasks'),
    path('getAgentTasks/<name>/',views.GetAgentsTasks.as_view(),name='blog-getAgentTasks'),
    path('results/<name>/', views.Listener.agent.receiveResults , name='blog-result'),
    path('hackeruser/createuser/', views.HackerUser , name='blog-createuser'),
    path('launcher/', views.Launcher , name='blog-Launcher'),
    path('Lin-results/<name>/', views.Listener.agent.LinreceiveResults , name='blog-Linresult'),
    #path('upload/', views.upload_file , name='blog-upload'),
    ##################################### Windows Start
    path('tasksApi/<int:type>/', views.TasksApi.as_view()),
    path('directorylist/' , windowsModules.DirectoryListing), # 1
    path('applocker/' , windowsModules.Applocker), # 2
    path('download/' , windowsModules.Download_IWR), # 3
    path('envvar/' , windowsModules.env_var), # 4
    path('phrasefinder/' , windowsModules.Phrase_finder), # 5
    path('ipswindows/' , windowsModules.IPsWindows), # 6
    path('loggedusers/' , windowsModules.logged_users), # 7
    path('netconnections/' , windowsModules.Net_Connections), # 8
    path('programs/' , windowsModules.Programs), # 9
    path('processeswindows/' , windowsModules.processes), # 10
    path('screenshot/' , windowsModules.ScreenShot), # 11
    path('winuserinfo/' , windowsModules.winuser_info), # 12
    path('systeminfo/' , windowsModules.Systeminfo), # 13
    path('updateswindows/' , windowsModules.UpdatesWindows), # 14
    path('uploads/' , windowsModules.UploadFileWindows), # 15
    path('windefstat/' , windowsModules.WinDefStat), # 16
    path('namedpipes/' , windowsModules.Named_pipes), # 17
    path('juicypotato/' , windowsModules.juicypotato), # 18
    #path('Download_IWR/' , windowsModules.Download_IWR), # 68
    #################################NO ADDED YET########################################
    path('DownloadFileAsync/' , windowsModules.DownloadFileAsync), # 69 DONE
    path('DownloadString/' , windowsModules.DownloadString), # 70  DONE
    path('Download_SMB/' , windowsModules.Download_SMB), # 71
    path('Download_FTP/' , windowsModules.Download_FTP), # 72
    path('Invoke_fileUpload/' , windowsModules.Invoke_fileUpload), # 73
    path('FTP_fileUpload/' , windowsModules.FTP_fileUpload), # 74
    path('open_pythonserver/' , windowsModules.open_pythonserver), # 75
    path('open_SMBserver/' , windowsModules.open_SMBserver), # 76
    path('open_FTPserver/' , windowsModules.open_FTPserver), # 77
    path('open_PY_UploadServer/' , windowsModules.open_PY_UploadServer), # 78
    path('open_FTP_UploadServer/' , windowsModules.open_FTP_UploadServer), # 79
    path('Perm_pip/' , windowsModules.Perm_pip), # 80
    path('printspoofer/' , windowsModules.printspoofer), # 81
    path('procdump/' , windowsModules.procdump), # 82
    path('tasklist/' , windowsModules.tasklist), # 83 DONE
    path('SeDebugPrivilege/' , windowsModules.SeDebugPrivilege), # 84
    path('Auto_SeDebugPrivilege/' , windowsModules.Auto_SeDebugPrivilege), # 91
    path('Import_Module/' , windowsModules.Import_Module), # 85
    path('Exec_Module/' , windowsModules.Exec_Module), # 86
    path('Chk_File_Owner/' , windowsModules.Chk_File_Owner), # 87############# ADDED SUCCSSFULY
    path('Take_Own/' , windowsModules.Take_Own), # 88
    path('ACL_modify/' , windowsModules.ACL_modify), # 89
    path('SeBackUpPrivelege/' , windowsModules.SeBackUpPrivelege), # 90

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
    path('linuserinfo/' , linuxModules.linusrs_info), # 30
    path('whoami/' , linuxModules.Whoami), # 31
    path('linuxChangeDirectory/' , linuxModules.LinuxChangeDirectory), 
    path('linuxChmod/' , linuxModules.LinuxChmod), 
    path('linuxcp/' , linuxModules.Linuxcp), 
    path('linuxgcc/' , linuxModules.Linuxgcc), 
    path('linuxDirectoryListingDetails/' , linuxModules.LinuxDirectoryListing_Details), 
    path('linuxDirectoryListing/' , linuxModules.LinuxDirectoryListing), 
    path('linuxMakeDirectory/' , linuxModules.LinuxMakeDirectory), 
    path('linuxNetdiscover/' , linuxModules.LinuxNetdiscover), 
    path('linuxTouch/' , linuxModules.LinuxTouch), 
    path('linuxBash/' , linuxModules.LinuxBash), 
    path('linuxWfuzz/' , linuxModules.ffuf), 
    path('linuxdownload/' , linuxModules.Linuxdownload),
    path('executeCommandWithSpecUser/' , linuxModules.ExecuteCommandWithSpecUser), 
    ############################### linux Ends
    ############################### ActiveDirectory Starts
    path('SPNUsersforKerb/' , ActiveDirectory.SPNUsersforKerb), # 32
    path('acclisting/' , ActiveDirectory.ACC_listing), # 33
    path('adapter/' , ActiveDirectory.Adapter), # 34
    path('arptable/' , ActiveDirectory.ArpTable), # 35
    path('defensecheck/' , ActiveDirectory.DefenseCheck), # 36
    path('domaininfo/' , ActiveDirectory.DomainInfo), # 37
    path('domainusers/' , ActiveDirectory.DomainUsers), # 38
    path('DownloadonWindows/' , ActiveDirectory.Download_IWR), # 39
    path('EnvValue/' , ActiveDirectory.EnvValue), # 40
    path('groupslisting/' , ActiveDirectory.GroupsListing), # 41
    path('groups/' , ActiveDirectory.Groups), # 42
    path('hotfixes/' , ActiveDirectory.HotFixes), # 43
    path('ip4route/' , ActiveDirectory.Ip4Route), # 44
    path('listexecpolicies/' , ActiveDirectory.ListExecPolicies), # 45
    path('listingmodules/' , ActiveDirectory.ListingModules), # 46
    path('defensecheck/' , ActiveDirectory.DefenseCheck), # 47
    path('LocalAccListing/' , ActiveDirectory.LocalAccListing), # 48
    path('trustmap/' , ActiveDirectory.TrustMap), # 49
    path('TrustRelations/' , ActiveDirectory.TrustRelations), # 50
    path('activedirSystemInfo/' , ActiveDirectory.systeminfo), # 65
    path('activedirDomainInfo/' , ActiveDirectory.DomainInfo), # 66
    path('activedirDomainUsers/' , ActiveDirectory.DomainUsers), # 67
    ############################### ActiveDirectory Ends
    # path('results/{}'.format(Listener.name) , views.receiveResults , name='blog-result'),
]

