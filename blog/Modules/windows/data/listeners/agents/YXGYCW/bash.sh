#!/bin/bash

$regl = "http://192.168.207.88:8000/reg/";

declare -A data=( [eth]='eth0' [hname]=hostname);

$name  = curl -d data $regl;
echo $name;
