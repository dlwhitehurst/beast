#!/bin/bash

rm -rf nfs 

mkdir nfs

VBoxManage export 2204-2P-8R --output nfs/nfs.ova


