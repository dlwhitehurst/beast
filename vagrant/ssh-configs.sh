#!/bin/bash
#
# ssh-configs.sh - creates config files for ansible
#

rm *-ssh-config

vagrant ssh-config bmaster > bmaster-ssh-config
vagrant ssh-config bnode1 > bnode1-ssh-config
vagrant ssh-config bnode2 > bnode2-ssh-config
vagrant ssh-config bnode3 > bnode3-ssh-config
vagrant ssh-config bnode4 > bnode4-ssh-config
