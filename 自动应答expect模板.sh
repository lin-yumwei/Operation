#!/bin/bash
expect << EOF
spawn ssh -o StrictHostKeyChecking=no root@172.25.0.11
expect "password:" { send "redhat\r" }
expect "#" { send "touch /opt/tmp.txt\r" }
expect "#" { send "exit\r" }
EOF
