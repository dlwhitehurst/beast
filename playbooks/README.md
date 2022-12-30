# playbooks

This is the Ansible area of administration and control of the 
newly VirtualBox-created machine group and Kubernetes foundation.

These instructions are needed to provision the new Kubernetes cluster
in its bare-state. To clarify, the Kubernetes cluster in its bare-state
consists of a master and worker nodes of Ubuntu 22.04 with Kubernetes 
installed and a CNI chosen. In this current case, CNI is Flannel. The 
nodes are all validated to be Ready.

```bash
kubectl get nodes

#output
NAME       STATUS   ROLES           AGE    VERSION
bmaster    Ready    control-plane   100m   v1.26.0
bnode1     Ready    <none>          97m    v1.26.0
bnode2     Ready    <none>          95m    v1.26.0
bnode3     Ready    <none>          92m    v1.26.0
bnode4     Ready    <none>          90m    v1.26.0
```

Ansible will be used to provision the Kubernetes cluster to be ready 
for production hosting of applications or systems. This provisioning
will be Helm, Metallb, NGINX Ingress, and Cert Manager.

The persistent storage solution will probably be an external Ceph Block
cluster (other machines) and then a Rook operator will be installed
on the Kubernetes cluster to manage block storage for auto-provisioned
PVCs.



