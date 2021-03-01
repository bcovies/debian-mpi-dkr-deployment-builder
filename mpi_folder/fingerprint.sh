#!/usr/bin/expect
spawn ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@master
expect  "Are you sure you want to continue connecting (yes/no)? \r"
send  -- "yes\r"
expect  "*password: \r"
send  -- "mpiuser\r"
expect