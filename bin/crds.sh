#!/bin/bash
# crds.sh
#
# This script calls for a delete of all CRDs for Tavros with a no-wait policy. The resources may or may not
# delete. Finalizers may have to be set to null.
#
#
#

kubectl delete crd alerts.notification.toolkit.fluxcd.io --wait=false
kubectl delete crd buckets.source.toolkit.fluxcd.io --wait=false
kubectl delete crd certificaterequests.cert-manager.io --wait=false
kubectl delete crd certificates.cert-manager.io --wait=false
kubectl delete crd challenges.acme.cert-manager.io --wait=false
kubectl delete crd circuitbreakers.kuma.io --wait=false
kubectl delete crd clusterissuers.cert-manager.io --wait=false
kubectl delete crd dataplaneinsights.kuma.io --wait=false
kubectl delete crd dataplanes.kuma.io --wait=false
kubectl delete crd externalservices.kuma.io --wait=false
kubectl delete crd faultinjections.kuma.io --wait=false
kubectl delete crd gitrepositories.source.toolkit.fluxcd.io --wait=false
kubectl delete crd healthchecks.kuma.io --wait=false
kubectl delete crd helmcharts.source.toolkit.fluxcd.io --wait=false
kubectl delete crd helmreleases.helm.toolkit.fluxcd.io --wait=false
kubectl delete crd helmrepositories.source.toolkit.fluxcd.io --wait=false
kubectl delete crd issuers.cert-manager.io --wait=false
kubectl delete crd keycloakbackups.keycloak.org --wait=false
kubectl delete crd keycloakclients.keycloak.org --wait=false
kubectl delete crd keycloakrealms.keycloak.org --wait=false
kubectl delete crd keycloaks.keycloak.org --wait=false
kubectl delete crd keycloakusers.keycloak.org --wait=false
kubectl delete crd kongclusterplugins.configuration.konghq.com --wait=false
kubectl delete crd kongconsumers.configuration.konghq.com --wait=false
kubectl delete crd kongingresses.configuration.konghq.com --wait=false
kubectl delete crd kongplugins.configuration.konghq.com --wait=false
kubectl delete crd kustomizations.kustomize.toolkit.fluxcd.io --wait=false
kubectl delete crd meshes.kuma.io --wait=false
kubectl delete crd meshinsights.kuma.io --wait=false
kubectl delete crd orders.acme.cert-manager.io --wait=false
kubectl delete crd providers.notification.toolkit.fluxcd.io --wait=false
kubectl delete crd proxytemplates.kuma.io --wait=false
kubectl delete crd ratelimits.kuma.io --wait=false
kubectl delete crd receivers.notification.toolkit.fluxcd.io --wait=false
kubectl delete crd retries.kuma.io --wait=false
kubectl delete crd sealedsecrets.bitnami.com --wait=false
kubectl delete crd serviceinsights.kuma.io --wait=false
kubectl delete crd tcpingresses.configuration.konghq.com --wait=false
kubectl delete crd timeouts.kuma.io --wait=false
kubectl delete crd trafficlogs.kuma.io --wait=false
kubectl delete crd trafficpermissions.kuma.io --wait=false
kubectl delete crd trafficroutes.kuma.io --wait=false
kubectl delete crd traffictraces.kuma.io --wait=false
kubectl delete crd udpingresses.configuration.konghq.com --wait=false
kubectl delete crd zoneingresses.kuma.io --wait=false
kubectl delete crd zoneinsights.kuma.io --wait=false
kubectl delete crd zones.kuma.io --wait=false

# finalizers in case ...

kubectl patch crd alerts.notification.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd buckets.source.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd certificaterequests.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd certificates.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd challenges.acme.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd circuitbreakers.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd clusterissuers.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd dataplaneinsights.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd dataplanes.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd externalservices.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd faultinjections.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd gitrepositories.source.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd healthchecks.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd helmcharts.source.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd helmreleases.helm.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd helmrepositories.source.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd issuers.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd keycloakbackups.keycloak.org -p '{"metadata":{"finalizers":null}}'
kubectl patch crd keycloakclients.keycloak.org -p '{"metadata":{"finalizers":null}}'
kubectl patch crd keycloakrealms.keycloak.org -p '{"metadata":{"finalizers":null}}'
kubectl patch crd keycloaks.keycloak.org -p '{"metadata":{"finalizers":null}}'
kubectl patch crd keycloakusers.keycloak.org -p '{"metadata":{"finalizers":null}}'
kubectl patch crd kongclusterplugins.configuration.konghq.com -p '{"metadata":{"finalizers":null}}'
kubectl patch crd kongconsumers.configuration.konghq.com -p '{"metadata":{"finalizers":null}}'
kubectl patch crd kongingresses.configuration.konghq.com -p '{"metadata":{"finalizers":null}}'
kubectl patch crd kongplugins.configuration.konghq.com -p '{"metadata":{"finalizers":null}}'
kubectl patch crd kustomizations.kustomize.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd meshes.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd meshinsights.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd orders.acme.cert-manager.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd providers.notification.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd proxytemplates.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd ratelimits.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd receivers.notification.toolkit.fluxcd.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd retries.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd sealedsecrets.bitnami.com -p '{"metadata":{"finalizers":null}}'
kubectl patch crd serviceinsights.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd tcpingresses.configuration.konghq.com -p '{"metadata":{"finalizers":null}}'
kubectl patch crd timeouts.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd trafficlogs.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd trafficpermissions.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd trafficroutes.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd traffictraces.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd udpingresses.configuration.konghq.com -p '{"metadata":{"finalizers":null}}'
kubectl patch crd zoneingresses.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd zoneinsights.kuma.io -p '{"metadata":{"finalizers":null}}'
kubectl patch crd zones.kuma.io -p '{"metadata":{"finalizers":null}}'
