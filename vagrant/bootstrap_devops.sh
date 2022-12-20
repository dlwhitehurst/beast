#!/bin/bash

## !IMPORTANT ##
#
## This script is tested only in the generic/ubuntu2004 Vagrant box
## If you use a different version of Ubuntu or a different Ubuntu Vagrant box test this again
#

echo "[TASK 1] Update apt"
apt update

echo "[TASK 2] Add apt repo for kubernetes"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - >/dev/null 2>&1
apt-add-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main" >/dev/null 2>&1

echo "[TASK 3] Install kubectl"
apt install -qq -y kubectl=1.24.0-00 >/dev/null 2>&1

echo "[TASK 4] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "[TASK 5] Set root password"
echo -e "kubeadmin\nkubeadmin" | passwd root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bash.bashrc

echo "[TASK 6] Install Ansible"
echo "[TASK 7] Install Ansible"



echo "[TASK 10] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.56.10   kmaster.example.com     kmaster
192.168.56.11   kworker1.example.com     kworker1
192.168.56.12   kworker2.example.com     kworker2
192.168.56.13   kworker3.example.com     kworker3
192.168.56.14   kworker4.example.com     kworker4
EOF
