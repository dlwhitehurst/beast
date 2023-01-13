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

## Wikijs
Wikijs was installed with default values and a Postgresql sub-chart. Here's the command that was used.

```bash
helm repo add requarks https://charts.js.wiki
helm repo update
helm install wikijs requarks/wiki -n wikijs
```
After the chart was installed, I created an ingress for the hosting. Two things need to change.
This is:

1. externalize Postgres and use the database for any need of Postgres for this and any other hostings
that may require a Postgresql database.

2. Use a values file and set up a proper ingress at time of the Helm chart install.
