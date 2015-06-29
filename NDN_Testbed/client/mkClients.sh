#!/bin/bash

source ../hosts

# ********************************************************
# *** This file isn't configured for the runAll script ***
# ********************************************************

rm configClients.sh
echo "#!/bin/bash" > ../configClients.sh
chmod 755 ../configClients.sh
echo "source ~/.topology" >> ../configClients.sh
echo "CWD=\`pwd\`" >> ../configClients.sh

echo " ssh \$h8x2 \"cd \$CWD/client ; ./config_client.sh udp4\"" >> ../configClients.sh

rm runTrafficClients.sh
echo "#!/bin/bash" > ../runTrafficClients.sh
chmod 755 ../runTrafficClients.sh
echo "source ~/.topology" >> ../runTrafficClients.sh
echo "CWD=\`pwd\`" >> ../runTrafficClients.sh
echo "INTERVAL=10"   >> ../runTrafficClients.sh

## This creates an array consisting of lower case letters, indexed
## from 0
#A=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
#
## Index through the array
#for (( i=0 ; $((i<=25)) ; $((i++)) ))
#do
#        echo "A[$i] = ${A[$i]} "
#
#done

ALPHA_LIST=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
k=0
i=0
NAME="/"
while [ $i -lt 3 ]
do
  j=0
  while [ $j -lt 5 ]
  do
    NAME="$NAME""${ALPHA_LIST[$k]}"
    j=$(($j+1))
    k=$(($k+1))
    if [ $k -ge 26 ]
    then
      k=0
    fi
  done
  i=$(($i+1))
  NAME="$NAME""/"
done

echo "NAME: $NAME"

FILENAME="NDN_Traffic_Client_000"
echo "TrafficPercentage=100" >  $FILENAME
#echo "Name=/example/$EXT" >> $FILENAME
echo "Name=${NAME}${EXT}" >> $FILENAME
echo "MustBeFresh=1" >> $FILENAME
echo "NameAppendSequenceNumber=1" >> $FILENAME
echo " ssh \$h8x2 \"cd \$CWD/client ; ndn-traffic -i 10 $FILENAME >& client_000.log &\"  " >> ../runTrafficClients.sh


#TrafficPercentage=100
#Name=/example/A
#MustBeFresh=1
#NameAppendSequenceNumber=1

