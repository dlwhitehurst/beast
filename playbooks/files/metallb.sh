#!/bin/bash
#
# metallb.sh - set strictARP 
#

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

# get yaml and apply manifests for metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml

# apply manifest for ipaddresspools 
kubectl apply -f metallb-pools.yaml

