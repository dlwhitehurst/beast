# playbooks

This is the Ansible area of administration and control of the 
prior vagrant-provisioned Kubernetes cluster.

These instructions are needed to provision the new Kubernetes cluster
in its bare-state. To clarify, the Kubernetes cluster in its bare-state
consists of a master and worker nodes of Ubuntu 22.04 with Kubernetes 
installed and a CNI chosen. In this current case, CNI is Calico. The nodes
are validated to all be ready.

```bash
kubectl get nodes

#output
NAME       STATUS   ROLES           AGE    VERSION
kmaster    Ready    control-plane   100m   v1.24.0
kworker1   Ready    <none>          97m    v1.24.0
kworker2   Ready    <none>          95m    v1.24.0
kworker3   Ready    <none>          92m    v1.24.0
kworker4   Ready    <none>          90m    v1.24.0
```

Ansible will be used to provision with Kubernetes cluster for production
hosting of applications or systems.


