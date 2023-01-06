#!/bin/bash
# 
# vbox.sh - Clone, Import, Deploy, Manage, and Identify VirtualBox hosts 
#
# When new machines are cloned on VirtualBox, they are ready to be started
# and have not been given a hostname. These new machines will pick up an IP
# on the local network because they are defined with a bridged adapter or 
# NIC. This script can be used to start the virtual machine by name and also
# get the new DHCP ip. This script can also be used to give the newly deployed
# server a hostname.
#
# written by: David L Whitehurst
# date: Dec 30 2022
# version: 0.1.0
#
################################################################################
if [[ "$1" == "--help" ]]; then
    cat <<'ENDHELP'
Usage:
  vbox.sh [options] <vm-name> <hostname>

Notes: If strings contain spaces use double quotes for namespaces.

Options:
    -a, --add-user              Add user
    -c, --copy-id               Copy public ssh key
    --details			Details
    -d, --down 			Send ACPI Shutdown
    -i, --ip                    Get IPv4
    -m, --mac			Show MAC address
    -n, --no-pass-sudo          Make user no password sudo
    -r, --refreshARP            Refresh ARP
    -sh, --set-hostname 	Set Hostname
    -u, --up			Normal Start
    -uh, --up-headless		Headless Start		
ENDHELP
    exit
fi
################################################################################

function getmac() {
    # vboxmanage showvminfo "${VM}" --details
    MAC=$(vboxmanage showvminfo "$VM" --details 2>&1 | grep 'NIC 1:' | sed -re 's/.*MAC: (.+), Attachment.*/\1/' -e 's/(\w{2})/\1:/g' -e 's/:$//')
  echo $MAC
}

function getdetails() {
  vboxmanage showvminfo "${VM}" --details
}

function sethostname() {
  # echo "${VM}" 
  # echo "${HOSTNAME}"
  
  getmac
  MAC=$(echo $MAC | tr '[:upper:]' '[:lower:]')
  ARP_LINE=$(arp -a | awk '{print $2, $4}' | grep $MAC)
  TOKEN=$(echo $ARP_LINE | awk '{print $1}') 
  IP=$(echo "${TOKEN:1:${#TOKEN}-2}")
  # echo $IP

  # ssh and set hostname 
  connectAndIdentify
  echo Done, hostname changed to ${HOSTNAME} for ${IP}, now go set reserved IP with router. 
}

function refreshARP() {
  # refresh ARP cache
  fping -a -g 192.168.1.0/24 >/dev/null 2>&1
  echo All of 192.168.1.0/24 CIDR ICMP requested and ARP cache updated.
}

function getIpv4() {
  getmac
  MAC=$(echo $MAC | tr '[:upper:]' '[:lower:]')
  ARP_LINE=$(arp -a | awk '{print $2, $4}' | grep $MAC)
  TOKEN=$(echo $ARP_LINE | awk '{print $1}')
  IP=$(echo "${TOKEN:1:${#TOKEN}-2}")
  echo $IP
}

function adduser() {
  read -p 'Enter new user: ' NEWUSER
  getIpv4
  PASS=$(cat ~/.love)
  COMMAND="useradd -m -s /bin/bash $NEWUSER"
  USER="david"
  HOST=${IP}

  # create user (useradd) 
  sshpass -p $PASS ssh -o StrictHostKeyChecking=no -t $USER@$HOST "echo \"$PASS\" |sudo -S $COMMAND" #>/dev/null
  
  # MUST visit and set password
  echo "New user created. Please visit and set a password (Sorry!)"
}

function nopassSudo() {
  read -p 'Enter user to get no-pass sudo: ' NEWUSER
  getIpv4
  PASS=$(cat ~/.love)
  COMMAND="echo '$NEWUSER ALL=(ALL) NOPASSWD:ALL' | sudo EDITOR='tee -a' visudo"
  USER="david"
  HOST=${IP}
  sshpass -p $PASS ssh -o StrictHostKeyChecking=no -t $USER@$HOST "echo \"$PASS\" |sudo -S $COMMAND" #>/dev/null

}

function sshCopyId() {
  getIpv4
  PASS=$(cat ~/.love)
  USER="david"
  HOST=${IP}
  ssh-copy-id -i ~/.ssh/ansible_rsa.pub ${USER}@${HOST}
}

function vmDown() {
  VBoxManage controlvm "${VM}" acpipowerbutton
}

function vmUp() {
  VBoxManage startvm "${VM}"
}

function vmUpHeadless() {
  echo "${VM}"
  VBoxManage startvm "${VM}" --type headless
}

function connectAndIdentify() {
  PASS=$(cat ~/.love)
  COMMAND="hostnamectl set-hostname ${HOSTNAME}"
  USER="david"
  HOST=${IP}
  sshpass -p $PASS ssh -t $USER@$HOST "echo \"$PASS\" |sudo -S $COMMAND" >/dev/null
}

FUNC=0

VM="${2}"
HOSTNAME=${3}

MAC=
ARP_LINE=
TOKEN=
IP=

# parse off optional flags
while [[ $# > 0 && "$1" =~ ^[-+] ]]; do
    case "$1" in
     --add-user|-a)		adduser;		shift 1 ;;
     --copy-id|-c)		sshCopyId;		shift 1 ;;
     --details) 		getdetails;            	shift 1 ;;
     --down|-d) 		vmDown;   		shift 1 ;;
     --ip|-i) 			getIpv4;   		shift 1 ;;
     --mac|-m) 			getmac;   		shift 1 ;;
     --no-pass-sudo|-n) 	nopassSudo;  		shift 1 ;;
     --refreshARP|-r) 		refreshARP; 		shift 1 ;;
     --set-hostname|-sh) 	sethostname;   		shift 1 ;;
     --up|-u) 			vmUp;   		shift 1 ;;
     --up-headless|-uh) 	vmUpHeadless;   	shift 1 ;;
     *) 			echo "Unrecognized option: ${1}" >&2;  exit 1 ;;
    esac
done

exit
