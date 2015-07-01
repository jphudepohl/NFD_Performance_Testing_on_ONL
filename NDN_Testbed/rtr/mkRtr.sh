#!/bin/bash

source ../hosts

echo "#!/bin/bash" > ./configRtr.sh
chmod 755 ./configRtr.sh

# We have to figure out what the first one will be... guess for now
# client face
echo "# client faces"
echo "nfdc create udp4://h8x1:6363 # FaceID: 4" >> ./configRtr.sh
echo " " >> ./configRtr.sh

# Record where first server face will be
echo "# server faces"
echo "nfdc create udp4://h2x2:6363 # FaceID: 36" >> ./configRtr.sh
echo " " >> ./configRtr.sh

echo "# Next Hops" >> ./configRtr.sh
echo "nfdc add-nexthop -c 1 / udp4://h2x2:6363" >> ./configRtr.sh
