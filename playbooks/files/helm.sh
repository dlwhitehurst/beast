#!/bin/bash
#
# helm.sh - install helm using Helm(proper) script on Ubuntu 22.04
#

curl -O https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
bash ./get-helm-3

helm version
