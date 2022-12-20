# vagrant

This readme describes how to prepare and provision a Kubernetes cluster of
VirtualBox Ubuntu 22.04 machines. Other VMs will probably be integrated into
this repository but for now, we stick to Ubuntu.

Before you can run the Vagrant file, you need to be sure that the following
prerequisites are satisfied:

1. VirtualBox
2. Vagrant

Once installed, you can run `vagrant up` and provision a Kubernetes cluster 
of Ubuntu machines on Bare-Metal.

## Prerequisites
Be sure to install VirtualBox and Vagrant

### VirtualBox 
text ...


### Vagrant
text ...

## Provision Nodes of a Kubernetes Cluster
To provision new nodes and form a Kubernetes cluster, run the following
command.

```bash
vagrant up
```

When the provisioning is complete, `ssh` into `kmaster` and issue the 
following `kubectl` command to validate.

```bash
kubectl get nodes

# expected output

NAME       STATUS   ROLES           AGE    VERSION
kmaster    Ready    control-plane   100m   v1.24.0
kworker1   Ready    <none>          97m    v1.24.0
kworker2   Ready    <none>          95m    v1.24.0
kworker3   Ready    <none>          92m    v1.24.0
kworker4   Ready    <none>          90m    v1.24.0
```

