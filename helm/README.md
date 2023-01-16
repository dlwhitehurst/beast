# helm

Helm is used to install 95% of Beast applications wherever possible. After a load balancer,
certificate manager, and ingress choice is installed, the cluster is considered truly 
`READY` for hosting applications, services, and jobs.

## Bookstack
Bookstack is currently installed like so:

```bash
helm repo add dlwhitehurst https://dlwhitehurst.github.io/helm-charts/
helm repo update
helm install bookstack dlwhitehurst/bookstack -n bookstack -f values.yaml
```

## Wikijs (updated)
Wikijs was installed with a values file found in the `wikijs/` directory here. A secret was also created after the initial helm installation and then the broken pod deleted. The deployment then creates a new pod that picks up the external postgresql password and everything works. 

```bash
helm repo add requarks https://charts.js.wiki
helm repo update
helm install wikijs requarks/wiki -n wikijs -f wikijs-values.yaml
```
After the chart was installed, I created a secret for the external postgres password using the deployment YAML as a guide. Ingress was configured in the values file using my DNS.
