#!/bin/bash
# beast.sh
# 
# This script runs the Ansible playbook containing Ansible
# roles that build and provision Beast as a runtime hosting platform on 
# a Kubernetes cluster of your choosing.

# This needs to be modified for your domain's inventory.
ansible-playbook playbooks/provision_playbook.yaml --inventory /tmp/beast.dlwhitehurst.com_vars.yaml --tags all
