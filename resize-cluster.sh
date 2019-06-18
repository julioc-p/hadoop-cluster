#!/bin/bash

# N es el numero de nodos del cluster
N=$1

if [ $# = 0 ]
then
	echo "Por favor especificar el numero de nodos!"
	exit 1
fi

# change slaves file
i=1
rm config/slaves
while [ $i -lt $N ]
do
	echo "hadoop-slave$i" >> config/slaves
	((i++))
done 

echo ""

echo -e "\nconstruir imagen docker hadoop\n"

# reconstruir imagen juliop1980/hadoop-cluster
sudo docker build -t kiwenlau/hadoop-cluster .

echo ""