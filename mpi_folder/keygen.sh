#!/usr/bin/expect

spawn ssh-keygen -t rsa
expect "Enter file in which to save the key (/root/.ssh/id_rsa): "
send  "/home/mpiuser/.ssh/id_rsa\r"
expect "Enter passphrase (empty for no passphrase): "
send  "\r"
expect "Enter same passphrase again: "
send  "\r"
expect