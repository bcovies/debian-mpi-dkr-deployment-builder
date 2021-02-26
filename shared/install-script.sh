#!/bin/bash

echo "172.28.0.2     master" >> /etc/hosts
echo "172.28.0.3     worker1" >> /etc/hosts
echo "172.28.0.4     worker2" >> /etc/hosts


adduser --quiet --disabled-password --shell /bin/bash --home /home/mpiuser --gecos "mpiuser" mpiuser
echo "mpiuser:mpiuser" | chpasswd
