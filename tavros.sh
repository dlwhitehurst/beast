#!/bin/bash
# tavros.sh
# 
# This script runs the Ansible playbook containing Ansible
# roles that build and provision Tavros as a platform on 
# a Kubernetes cluster of your choosing.

# This needs to be modified to your domain's inventory.
ansible-playbook playbooks/provision_playbook.yaml --inventory /tmp/tavros.dlwhitehurst.com_vars.yaml --tags all
