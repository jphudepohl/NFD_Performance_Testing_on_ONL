#!/bin/bash

source ../hosts

# ********************************************************
# *** This file isn't configured for the runAll script ***
# ********************************************************

rm configServers.sh
echo "#!/bin/bash" > ../configServers.sh
chmod 755 ../configServers.sh
echo "source ~/.topology" >> ../configServers.sh
echo "CWD=\`pwd\`" >> ../configServers.sh

echo "ssh \$h4x1 \"cd \$CWD/server ; ./config_server.sh udp4\" " >> ../configServers.sh

rm runTrafficServers.sh
echo "#!/bin/bash" > ../runTrafficServers.sh
chmod 755 ../runTrafficServers.sh
echo "source ~/.topology" >> ../runTrafficServers.sh
echo "CWD=\`pwd\`" >> ../runTrafficServers.sh

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


FILENAME="NDN_Traffic_Server_000"
#echo "Name=/example/ABCDE/FGHIJ/KLMNO/PQRST/UVWXY/Z/ABCDE/FGHIJ/KLMNO/PQRST/UVWXY/Z/ABCDE/FGHIJ/KLMNO/PQRST/UVWXY/Z/ABCDE/FGHIJ/KLMNO/PQRST/UVWXY/Z/$EXT" > $FILENAME
echo "Name=${NAME}${EXT}" >> $FILENAME
echo "ContentType=1" >> $FILENAME
echo "ContentBytes=800" >> $FILENAME
#echo "ContentBytes=4000" >> $FILENAME
#echo  "Content=AAAAAAAAAA" >> $FILENAME


#echo " ssh \$${HOST_LIST[$HOSTINDEX]}  \"cd \$CWD/server ; ndn-traffic-server -q $FILENAME >& server_$EXT.log &\"  " >> ../runTrafficServers.sh
echo " ssh \$h4x1  \"cd \$CWD/server ; ndn-traffic-server $FILENAME >& server_000.log &\"  " >> ../runTrafficServers.sh

#Name=/example/A
#ContentType=1
#ContentBytes=10

