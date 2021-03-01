#!/bin/bash

echo "172.28.0.2    master" >> /etc/hosts
echo "172.28.0.3    slave1" >> /etc/hosts
echo "172.28.0.4    slave2" >> /etc/hosts

ssh-keygen -f id_rsa -t rsa -N ''


