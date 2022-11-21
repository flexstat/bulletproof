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
    cd bulletproof$i
    wget https://github.com/flexstat/bulletproof/blob/main/docker-compose.yml?raw=true #need to change to your repository
    mv docker-compose.yml?raw=true docker-compose.yml
    mkdir bw-data && \chown root:101 bw-data && \chmod 770 bw-data
    if [ "$foo" == "yes" ]; then
    docker-compose up -d
    fi
    cd ..
    i=$(($i + 1))
done
