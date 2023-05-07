from urllib import request
from django.urls import path
from . import views
from .Modules.windows import windowsModules
from .Modules.Linux import linuxModules
from .Modules.ActiveDirectory import ActiveDirectory

urlpatterns = [
    path('homePage/'                    , views.HomePage                            , name='blog-home'),
    path('listeners/'                   , views.ListenersPage                       , name='blog-listener'),
    path('postlistener/'                , views.Listener.PostListener.as_view()     , name='blog-listener'),
    path('payload-Gen/'                 , views.Listener.payloadGen.as_view()       , name='blog-payload'),
    path('lin_payload-Gen/'             , views.Listener.lin_payloadGen.as_view()   , name='blog-lin_payload'),
    path('reg/'                         , views.registerAgent                       , name='blog-register'),
    path('agent/'                       , views.AgentPage                           , name='blog-agent'),
    path('tasksHandling/<name>/'        , views.Tasks                               , name='blog-tasks'),
    path('agentTask/<id>/'              , views.AgentTask                           , name='blog-agentTask'),
    path('getFileResult/<name>/'        , views.GetFileResult.as_view()             , name='blog-getFileResult') ,
    path('sc/<eth>/'                    , views.Listener.agent.sendScript           , name='blog-sendScript'),    #Redirection link from /sc to /win-downloads
    path('win_download/<eth>/'          , views.Listener.agent.win_sendFile         , name='blog-sendFile'),            
    path('lin_download/<eth>/'          , views.Listener.agent.lin_sendFile         , name='blog-sendFile'),
    path('tasks/<name>/'                , views.Listener.agent.serveTasks           , name='blog-serveTasks'),
    path('getAgentTasks/<name>/'        , views.GetAgentsTasks.as_view()            , name='blog-getAgentTasks'),
    path('results/<name>/'              , views.Listener.agent.receiveResults       , name='blog-result'),
    path('hackeruser/createuser/'       , views.HackerUser                          , name='blog-createuser'),
    path('launcher/'                    , views.Launcher                            , name='blog-Launcher'),
    path('Lin-results/<name>/'          , views.Listener.agent.LinreceiveResults    , name='blog-Linresult'),
    
    ##################################### id = Windows #####################################
    path('tasksApi/<int:type>/'         , views.TasksApi.as_view()),
    path('directorylist/'               , windowsModules.DirectoryListing),                 # id = 1
    path('applocker/'                   , windowsModules.Applocker),                        # id = 2
    path('download/'                    , windowsModules.Download_IWR),                     # id = 3
    path('envvar/'                      , windowsModules.env_var),                          # id = 4
    path('phrasefinder/'                , windowsModules.Phrase_finder),                    # id = 5
    path('ipswindows/'                  , windowsModules.IPsWindows),                       # id = 6
    path('loggedusers/'                 , windowsModules.logged_users),                     # id = 7
    path('netconnections/'              , windowsModules.Net_Connections),                  # id = 8
    path('programs/'                    , windowsModules.Programs),                         # id = 9
    path('processeswindows/'            , windowsModules.processes),                        # id = 10
    path('screenshot/'                  , windowsModules.ScreenShot),                       # id = 11
    path('winuserinfo/'                 , windowsModules.winuser_info),                     # id = 12
    path('systeminfo/'                  , windowsModules.Systeminfo),                       # id = 13
    path('updateswindows/'              , windowsModules.UpdatesWindows),                   # id = 14
    path('uploads/'                     , windowsModules.UploadFileWindows),                # id = 15
    path('windefstat/'                  , windowsModules.WinDefStat),                       # id = 16
    path('namedpipes/'                  , windowsModules.Named_pipes),                      # id = 17
    path('juicypotato/'                 , windowsModules.juicypotato),                      # id = 18
    
    ################################# NO ADDED YET ########################################
    path('DownloadFileAsync/'           , windowsModules.DownloadFileAsync),                # id = 69 
    path('DownloadString/'              , windowsModules.DownloadString),                   # id = 70  
    path('Download_SMB/'                , windowsModules.Download_SMB),                     # id = 71
    path('Download_FTP/'                , windowsModules.Download_FTP),                     # id = 72
    path('Invoke_fileUpload/'           , windowsModules.Invoke_fileUpload),                # id = 73
    path('FTP_fileUpload/'              , windowsModules.FTP_fileUpload),                   # id = 74
    path('open_pythonserver/'           , windowsModules.open_pythonserver),                # id = 75
    path('open_SMBserver/'              , windowsModules.open_SMBserver),                   # id = 76
    path('open_FTPserver/'              , windowsModules.open_FTPserver),                   # id = 77
    path('open_PY_UploadServer/'        , windowsModules.open_PY_UploadServer),             # id = 78
    path('open_FTP_UploadServer/'       , windowsModules.open_FTP_UploadServer),            # id = 79
    path('Perm_pip/'                    , windowsModules.Perm_pip),                         # id = 80
    path('printspoofer/'                , windowsModules.printspoofer),                     # id = 81
    path('procdump/'                    , windowsModules.procdump),                         # id = 82
    path('tasklist/'                    , windowsModules.tasklist),                         # id = 83 
    path('SeDebugPrivilege/'            , windowsModules.SeDebugPrivilege),                 # id = 84
    path('Auto_SeDebugPrivilege/'       , windowsModules.Auto_SeDebugPrivilege),            # id = 91
    path('Import_Module/'               , windowsModules.Import_Module),                    # id = 85
    path('Exec_Module/'                 , windowsModules.Exec_Module),                      # id = 86
    path('Chk_File_Owner/'              , windowsModules.Chk_File_Owner),                   # id = 87 
    path('Take_Own/'                    , windowsModules.Take_Own),                         # id = 88
    path('ACL_modify/'                  , windowsModules.ACL_modify),                       # id = 89
    path('SeBackUpPrivelege/'           , windowsModules.SeBackUpPrivelege),                # id = 90

    ############################### id = linux ###############################
    path('apache/'                      , linuxModules.Apache),                         # id = 19
    path('availableshell/'              , linuxModules.Avail_sh),                       # id = 20
    path('cronjobs/'                    , linuxModules.Cronjobs),                       # id = 21
    path('hiddenfiles/'                 , linuxModules.Hidden_files),                   # id = 22
    path('lsof/'                        , linuxModules.lsof),                           # id = 23
    path('osinfo/'                      , linuxModules.OS_info),                        # id = 24
    path('processeslinux/'              , linuxModules.ProcessesLinux),                 # id = 25
    path('selinux/'                     , linuxModules.selinux),                        # id = 26
    path('specialpermissions/'          , linuxModules.SpecialPermissions),             # id = 27
    path('tcpudp/'                      , linuxModules.TCP_UDP),                        # id = 28
    path('userpermissions/'             , linuxModules.UserPermissions),                # id = 29
    path('linuserinfo/'                 , linuxModules.linusrs_info),                   # id = 30
    path('whoami/'                      , linuxModules.Whoami),                         # id = 31
    path('linuxChangeDirectory/'        , linuxModules.LinuxChangeDirectory), 
    path('linuxChmod/'                  , linuxModules.LinuxChmod), 
    path('linuxcp/'                     , linuxModules.Linuxcp), 
    path('linuxgcc/'                    , linuxModules.Linuxgcc), 
    path('linuxDirectoryListingDetails/', linuxModules.LinuxDirectoryListing_Details), 
    path('linuxDirectoryListing/'       , linuxModules.LinuxDirectoryListing), 
    path('linuxMakeDirectory/'          , linuxModules.LinuxMakeDirectory), 
    path('linuxNetdiscover/'            , linuxModules.LinuxNetdiscover), 
    path('linuxTouch/'                  , linuxModules.LinuxTouch), 
    path('linuxBash/'                   , linuxModules.LinuxBash), 
    path('linuxWfuzz/'                  , linuxModules.ffuf), 
    path('linuxdownload/'               , linuxModules.Linuxdownload),
    path('executeCommandWithSpecUser/'  , linuxModules.ExecuteCommandWithSpecUser), 
 
    ############################### id = ActiveDirectory ###############################
    path('SPNUsersforKerb/'             , ActiveDirectory.SPNUsersforKerb),     # id = 32
    path('acclisting/'                  , ActiveDirectory.ACC_listing),         # id = 33
    path('adapter/'                     , ActiveDirectory.Adapter),             # id = 34
    path('arptable/'                    , ActiveDirectory.ArpTable),            # id = 35
    path('defensecheck/'                , ActiveDirectory.DefenseCheck),        # id = 36
    path('domaininfo/'                  , ActiveDirectory.DomainInfo),          # id = 37
    path('domainusers/'                 , ActiveDirectory.DomainUsers),         # id = 38
    path('DownloadonWindows/'           , ActiveDirectory.Download_IWR),        # id = 39
    path('EnvValue/'                    , ActiveDirectory.EnvValue),            # id = 40
    path('groupslisting/'               , ActiveDirectory.GroupsListing),       # id = 41    
    path('groups/'                      , ActiveDirectory.Groups),              # id = 42
    path('hotfixes/'                    , ActiveDirectory.HotFixes),            # id = 43
    path('ip4route/'                    , ActiveDirectory.Ip4Route),            # id = 44
    path('listexecpolicies/'            , ActiveDirectory.ListExecPolicies),    # id = 45
    path('listingmodules/'              , ActiveDirectory.ListingModules),      # id = 46
    path('LocalAccListing/'             , ActiveDirectory.LocalAccListing),     # id = 48
    path('trustmap/'                    , ActiveDirectory.TrustMap),            # id = 49
    path('TrustRelations/'              , ActiveDirectory.TrustRelations),      # id = 50
    path('activedirSystemInfo/'         , ActiveDirectory.systeminfo),          # id = 65
    path('activedirDomainUsers/'        , ActiveDirectory.DomainUsers),         # id = 67
    path('linkedinusers/'               , ActiveDirectory.linkedin_users),      # id = 92
    path('EnumSMBShares/'               , ActiveDirectory.EnumSMBShares),       # id = 93
    path('TestingCredsonDC/'            , ActiveDirectory.TestingCreds_onDC),   # id = 94
    path('userenumwithcreds/'           , ActiveDirectory.userenum_withcreds),  # id = 95
    path('fbing/'                       , ActiveDirectory.fbing),               # id = 96
    path('DomainControllers/'           , ActiveDirectory.DomainControllers),   # id = 97
    path('UserEnumwithKerbrute/'        , ActiveDirectory.UserEnumwithKerbrute),   # id = 111
    path('CMEpassspray/'                , ActiveDirectory.CME_pass_spray),      # id = 112
    path('LateralMovRDP/'               , ActiveDirectory.LateralMov_RDP),      # id = 113
    path('TGSticketsGetSPNusers/'       , ActiveDirectory.TGStickets_GetSPNusers), # id = 114
    path('sharp/'                       , ActiveDirectory.sharp),               # id = 115
    path('UserGeneralInfo/'             , ActiveDirectory.UserGeneralInfo),     # id = 116
    path('forceChangePassDomainUserPassword/' , ActiveDirectory.forceChangePass_DomainUserPassword),     # id = 117
    path('LateralMovWinRM/'             , ActiveDirectory.LateralMov_WinRM),    # id = 118
    path('gppautologin/'             , ActiveDirectory.gpp_autologin),    # id = 119
]

