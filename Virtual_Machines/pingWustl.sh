#!/bin/bash

source ~/.topology

# user can specify how many interests to send
# default is 1
COUNT=1
if [ $# -eq 1 ]
then COUNT=$1
fi

ssh $VMsmall2 "ndnping -c $COUNT /ndn/edu/wustl/ping"