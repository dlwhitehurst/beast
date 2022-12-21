#!/bin/bash
#
# ssh-configs.sh - creates config files for ansible
#

rm *-ssh-config

vagrant ssh-config kmaster > kmaster-ssh-config
vagrant ssh-config kworker1 > kworker1-ssh-config
vagrant ssh-config kworker2 > kworker2-ssh-config
vagrant ssh-config kworker3 > kworker3-ssh-config
vagrant ssh-config kworker4 > kworker4-ssh-config
