# beast

This repo builds a beast of a Kubernetes cluster.

## Overview
To build a Kubernetes cluster consists of ready nodes (servers) and the installation of kubeadm, kubelet, and kubectl. 
Once the software is installed on all nodes, the master node is initialized and then a command is provided in the output to securely join the nodes. After this `kubectl get nodes` should show all nodes, including master as not-ready.

The cluster does nothing at this point in way of providing value. It has no container networking solution. The nodes aren't ready. The cluster has no certificate management. Ingress is not available. Security is basic. And, external components for enterprise hosting is obviously missing. The Kubernetes cluster is a platform. And, this platform is basically barren.

To fix this, enter `build-tools.sh`.

The build-tools script will build a docker image using podman and buildah that will be tagged `devops-term`. This container can be executed in a manner that includes a github repo containing declarative configuration for the Kubernetes cluster. The container also has all of the software needed to manage this huge undertaking of preparing the cluster for enterprise application deployment. Remember that the application development needs an enterprise-ready Kubernetes platform that has to be built first.

Currently, the built-tools script only creates the one tool, the `devops-term` container image. The image can be run in Docker but notice it was called a container image. Actually, this image is created by podman and not Docker. To learn more about podman visit https://podman.io/ .  

## Buildtools
This creates an Ubuntu 20.04 virtual machine to create the buildtools image using podman and buildah. Multipass on OS-X is used here to launch the VM.
```bash
multipass launch -d 10G -m 4G
```
 
This installs podman and buildah on a Multipass 4G RAM 10G Disk Ubuntu 20.04 virtual machine.
```bash
. /etc/os-release
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L "https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key" | sudo apt-key add -
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get install -y podman buildah

# verify
podman --version
buildah --version
```
