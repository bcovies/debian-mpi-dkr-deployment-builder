#!/bin/bash
if [[ ! -f /home/mpiuser/.ssh/id_rsa.pub ]]; then
    echo  "mpiuser" | sudo -S service ssh start 
    sleep 2
    sudo echo "172.28.0.2    master" >> /etc/hosts
    sudo echo "172.28.0.3    slave1" >> /etc/hosts
    sudo echo "172.28.0.4    slave2" >> /etc/hosts
    sleep 2
    ./keygen.sh
    sleep 5
    ip=$(ifconfig | tr ' ' '\n' | grep 172 | head -1)
    sleep 5

    if [[ $ip == '172.28.0.2' ]]; then
        sleep 5
        echo -e "\n\nAdicionado chaves para SLAVE 1 && SLAVE2"
        ./fingerprint.sh slave1 slave2 
    fi


    if [[ $ip == '172.28.0.3' ]]; then
        sleep 5
        echo -e "\n\nAdicionado chaves para MASTER && SLAVE2"
        ./fingerprint.sh slave2 master
    fi

    sleep 5

    if [[ $ip == '172.28.0.4' ]]; then
        sleep 5
        echo -e "\n\nAdicionado chaves para SLAVE 1 && MASTER"
        ./fingerprint.sh slave1 master
    fi

    sleep 10

    sudo service ssh restart
fi
if [[ -f /home/mpiuser/.ssh/id_rsa.pub ]]; then
    
    sudo service ssh restart
fi


echo "\n\nFinalizada instalação inicial\n\n"
bash