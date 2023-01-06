#!/bin/bash
PASS="Patty4Me2Cherish"
COMMAND="hostnamectl set-hostname ceph-admin"
USER="david"
HOST="192.168.1.33"
sshpass -p $PASS ssh -t $USER@$HOST "echo \"$PASS\" |sudo -S $COMMAND"
