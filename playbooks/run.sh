#!/bin/bash
#
# run.sh - call on all playbooks
#

ansible-playbook -i hosts helm.yaml
ansible-playbook -i hosts metallb.yaml
ansible-playbook -i hosts nginx-ingress.yaml
ansible-playbook -i hosts cert-mgr.yaml




