#!/bin/bash
CWD=pwd

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

  sshpass -e sftp ${!HOST} <<EOF
  	put ../../.ndn/client.conf
  	put ../../.topology
EOF

  echo "Configuring IP routing table on $HOST"
  sshpass -e ssh -t ${!HOST} "source ~/.topology
                              mkdir .ndn
                              mv client.conf .ndn/client.conf
                              echo $SSHPASS | sudo -S -p '' /sbin/route add -net 192.168.0.0/16 gw $ADDRESS
                              nfdc create udp4://$ROUTER:6363
                              nfdc add-nexthop -c 1 / udp4://$ROUTER:6363" 
done