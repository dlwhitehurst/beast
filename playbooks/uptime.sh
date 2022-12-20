#!/bin/bash
#
# uptime.sh - This script shows uptime of all beast servers.
#

ansible kmaster  -m command -a uptime
ansible kworker1 -m command -a uptime
ansible kworker2 -m command -a uptime
ansible kworker3 -m command -a uptime
ansible kworker4 -m command -a uptime
