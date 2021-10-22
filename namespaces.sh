#!/bin/bash
# namespaces.sh
#
# This script deletes Tavros namespaces with a no-wait policty.
# The namespaces may or may not all delete. In that case the 
# finalizer may need to be set to null.
#
#

kubectl delete ns cert-manager --wait=false
kubectl delete ns flux-system --wait=false
kubectl delete ns keycloak --wait=false
kubectl delete ns kong --wait=false
kubectl delete ns kuma-system --wait=false
kubectl delete ns metallb-system --wait=false
kubectl delete ns nexus --wait=false
kubectl delete ns postgresql --wait=false
kubectl delete ns elastic-system --wait=false
kubectl delete ns gitea --wait=false
kubectl delete ns jaeger --wait=false
kubectl delete ns jenkins --wait=false

kubectl delete ns dev --wait=false
kubectl delete ns prod --wait=false
kubectl delete ns test --wait=false

./finalizer.sh cert-manager
./finalizer.sh elastic-system
./finalizer.sh flux-system
./finalizer.sh gitea
./finalizer.sh jaeger
./finalizer.sh jenkins
./finalizer.sh keycloak
./finalizer.sh kong
./finalizer.sh kuma-system
./finalizer.sh metallb-system
./finalizer.sh nexus
./finalizer.sh postgresql

./finalizer.sh dev
./finalizer.sh prod
./finalizer.sh test
