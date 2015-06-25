#!/bin/bash
CWD=`pwd`

source ~/.topology
source hosts

read -p "VM Password: " -s SSHPASS ; echo
export SSHPASS

for s in "${ROUTER_HOST_PAIRS[@]}" 
do
  pair_info=(${s//:/ })
  ROUTER=${pair_info[0]}
  HOST=${pair_info[1]}
  PREFIX=${pair_info[2]}
  ADDRESS=${pair_info[3]}
  
  echo "Configuring IP routing table on $HOST"
  sshpass -e ssh -t ${!HOST} "echo $SSHPASS | sudo -S -p '' /sbin/route add -net 192.168.0.0/16 gw $ADDRESS" 
done