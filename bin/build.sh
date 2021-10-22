#!/bin/bash
# build.sh
#
# This script shells into the beast control container to provide a stable
# Linux environment from which to build and provision Beast.
 
podman run -it --rm -v $PWD:$PWD:Z -w $PWD localhost/beast-buildtools:latest
