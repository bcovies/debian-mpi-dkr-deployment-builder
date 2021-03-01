#!/bin/bash

echo "172.28.0.2    master" >> /etc/hosts
echo "172.28.0.3    slave1" >> /etc/hosts
echo "172.28.0.4    slave2" >> /etc/hosts

mkdir -p /home/mpiuser/.ssh/
ssh-keygen -b 2048 -t rsa -f /home/mpiuser/.ssh/id_rsa -q -N ""
chown -R mpiuser:mpiuser /home/mpiuser/.ssh/
ip=$(ifconfig | tr ' ' '\n'  | grep 172 | head -1)

if [[ $ip == '172.28.0.2' ]]; then

    echo -e "\n\nAdicionado chaves para SLAVE 1 && SLAVE2"
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@slave1
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@slave2
fi

if [[ $ip == '172.28.0.3' ]]; then

    echo -e "\n\nAdicionado chaves para MASTER && SLAVE2"
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@master
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@slave2
fi


if [[ $ip == '172.28.0.4' ]]; then

    echo -e "\n\nAdicionado chaves para SLAVE 1 && MASTER"
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@master
    ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@slave1
fi