#!/bin/bash
# stage-prod.sh
#
# Revised existing clusterissuer to point to production letsencrypt. Then
# deleted all ingresses but new certs were not created.
# 
# Next attempt, here, is to delete all the custom resources that are 
# cert-related, then all ingresses again.
#
#


kubectl delete crd certificaterequests.cert-manager.io --wait=false
kubectl delete crd certificates.cert-manager.io --wait=false
kubectl delete crd challenges.acme.cert-manager.io --wait=false
kubectl delete crd clusterissuers.cert-manager.io --wait=false
kubectl delete crd issuers.cert-manager.io --wait=false
kubectl delete crd orders.acme.cert-manager.io --wait=false

kubectl delete ingress tavros -n elastic-system --wait=false
kubectl delete ingress tavros -n gitea --wait=false
kubectl delete ingress tavros -n jaeger --wait=false
kubectl delete ingress tavros -n jenkins --wait=false
kubectl delete ingress tavros -n keycloak --wait=false
kubectl delete ingress tavros -n nexus --wait=false
kubectl delete ingress tavros-buildtools -n nexus --wait=false
kubectl delete ingress cm-acme-http-solver-xfv89 -n kong --wait=false
kubectl delete ingress tavros-prod-kong -n kong --wait=false
kubectl delete ingress tavros-sandbox-kong -n kong --wait=false

# finalizers in case ...

kubectl patch crd certificaterequests.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd certificates.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd challenges.acme.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd clusterissuers.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd issuers.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd orders.acme.cert-manager.io -p '{"metadata":{"finalizers":null}}'
