#!/bin/bash
ansible-playbook -i ./hosts k8s.yaml -e firewall_enabled=false -u david --ask-become-pass
