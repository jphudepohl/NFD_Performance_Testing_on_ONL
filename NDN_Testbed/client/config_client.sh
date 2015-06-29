#!/bin/bash
source ../hosts
source ~/.topology

PROTO="udp4"

# ********************************************************
# *** This file isn't configured for the runAll script ***
# ********************************************************

nfdc create ${PROTO}://$h8x2:6363
nfdc add-nexthop -c 1 / ${PROTO}://$h8x2:6363
