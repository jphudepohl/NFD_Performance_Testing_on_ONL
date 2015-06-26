#!/bin/bash
CWD=pwd

source ~/.topology
source hosts

for s in "${ROUTER_HOST_PAIRS[@]}" 
do
  pair_info=(${s//:/ })
  ROUTER=${pair_info[0]}
  HOST=${pair_info[1]}
  PREFIX=${pair_info[2]}

  sshpass -e ssh -t ${!HOST} "source ~/.topology
                              nfdc create udp4://$ROUTER:6363
                              nfdc add-nexthop -c 1 / udp4://$ROUTER:6363" 
done