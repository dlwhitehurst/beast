# beast

This repo builds a beast of a Kubernetes cluster.

## Overview

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
podman --version
buildah version
```
