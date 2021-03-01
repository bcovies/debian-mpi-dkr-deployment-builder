#!/bin/bash

service ssh start

sleep 2

mkdir -p /home/mpiuser/.ssh/

chown -R mpiuser:mpiuser /home/mpiuser/.ssh/

./keygen.sh

sleep 5

echo "172.28.0.2    master" >>/etc/hosts
echo "172.28.0.3    slave1" >>/etc/hosts
echo "172.28.0.4    slave2" >>/etc/hosts

sleep 5

chown -R mpiuser:mpiuser /home/mpiuser/.ssh/

sleep 5

ip=$(ifconfig | tr ' ' '\n' | grep 172 | head -1)
sleep 5

if [[ $ip == '172.28.0.2' ]]; then
    sleep 5
    echo -e "\n\nAdicionado chaves para SLAVE 1 && SLAVE2"
   ./fingerprint.sh
fi
sleep 5

if [[ $ip == '172.28.0.3' ]]; then
    sleep 5
    echo -e "\n\nAdicionado chaves para MASTER && SLAVE2"
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@master
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@slave2
fi

sleep 5

if [[ $ip == '172.28.0.4' ]]; then
    sleep 5
    echo -e "\n\nAdicionado chaves para SLAVE 1 && MASTER"
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@master
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@slave1
fi