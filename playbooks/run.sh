#!/bin/bash

ansible-playbook -i ./hosts metallb.yaml
ansible-playbook -i ./hosts helm.yaml
ansible-playbook -i ./hosts nginx-ingress.yaml
ansible-playbook -i ./hosts cert-mgr.yaml
