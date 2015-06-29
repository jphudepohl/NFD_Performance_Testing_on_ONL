#!/bin/bash

source ~/.topology
CWD='pwd'

# add forwarding entry from gateway router to host that runs ndnping server
ssh $h10x2 "source ~/.topology
            nfdc add-nexthop -c 1 /ndn/edu/wustl/ping udp4://$h9x2:6363"

# run server on wustl host
ssh $VMsmall5 "ndnpingserver /ndn/edu/wustl/ping"

