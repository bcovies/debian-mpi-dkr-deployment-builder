#!/usr/bin/expect
set HOST1 [lindex $argv 0];
set HOST2 [lindex $argv 1];


spawn ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@$HOST1
expect  "Are you sure you want to continue connecting (yes/no)? \r"
send  -- "yes\r"
expect  "*password: \r"
send  -- "mpiuser\r"
expect

spawn ssh-copy-id -i /home/mpiuser/.ssh/id_rsa.pub mpiuser@$HOST2
expect  "Are you sure you want to continue connecting (yes/no)? \r"
send  -- "yes\r"
expect  "*password: \r"
send  -- "mpiuser\r"
expect