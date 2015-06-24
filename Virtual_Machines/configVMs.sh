#!/bin/bash
CWD=`pwd`

source ~/.topology
source hosts

read -p "VM Password: " -s SSHPASS
export SSHPASS

for s in "${ROUTER_HOST_PAIRS[@]}" 
do
  pair_info=(${s//:/ })
  ROUTER=${pair_info[0]}
  HOST=${pair_info[1]}
  PREFIX=${pair_info[2]}
  ADDRESS=${pair_info[3]}
  
  sshpass -e ssh ${!HOST} "sudo /sbin/route add -net 192.168.0.0/16 gw $ADDRESS" 
done