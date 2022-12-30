#!/bin/bash
#
# uptime.sh - This script shows uptime of all beast servers.
#

ansible bmaster  -m command -a uptime
ansible bnode1 -m command -a uptime
ansible bnode2 -m command -a uptime
ansible bnode3 -m command -a uptime
ansible bnode4 -m command -a uptime
