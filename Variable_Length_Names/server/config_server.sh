#!/bin/bash
source ../hosts
source ~/.topology

PROTO="udp4"

# ********************************************************
# *** This file isn't configured for the runAll script ***
# ********************************************************

echo "$h4x1"
echo "nfdc create ${PROTO}://\$${SERVER_HOSTS}:6363"
echo "nfdc add-nexthop -c 1 / ${PROTO}://\$${SERVER_HOSTS}:6363"

nfdc create ${PROTO}://$h4x1:6363
#nfdc add-nexthop -c 1 / 4 
nfdc add-nexthop -c 1 / ${PROTO}://$h4x1:6363

