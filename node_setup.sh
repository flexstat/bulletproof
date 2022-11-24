# /bin/bash
read -p "Enter quantity node (no more 30 node): " x2
if [ $x2 -ge 31 ]; then

echo "too many nodes"
return 1 2>/dev/null
exit 0
fi 

read -p "Do you want to start the node right away yes/no: " foo

i=1
while [ "$i" -le "$x2" ]
  do
    mkdir bulletproof$i
    cp docker-compose.yml bulletproof$i
    cp .env bulletproof$i
    cd bulletproof$i
    mkdir bw-data && \chown root:101 bw-data && \chmod 770 bw-data
    if [ "$foo" == "yes" ]; then
    docker-compose up -d
    fi
    cd ..
    i=$(($i + 1))
done

rm docker-compose.yml && rm .env

