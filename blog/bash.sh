$ip   = "REPLACE_IP";
$port = "REPLACE_PORT";
$interface = "REPLACE_INTERFACE";
$n = 3;

$regl = "http://${ip}:${port}/reg/";

declare -A data=( [$eth]=$interface [$hname]=hostname);

$name  = curl -d data $regl 

$taskl   = "http://${ip}:${port}/tasks/${name}";
$resultl = "http://${ip}:${port}/results/${name}";