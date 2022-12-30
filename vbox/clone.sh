#!/bin/bash

rm -rf bmaster
rm -rf bnode1
rm -rf bnode2
rm -rf bnode3
rm -rf bnode4

mkdir bmaster
mkdir bnode1
mkdir bnode2
mkdir bnode3
mkdir bnode4

VBoxManage export 2204-2P-8R --output bmaster/bmaster.ova
VBoxManage export 2204-2P-8R --output bnode1/bnode1.ova
VBoxManage export 2204-2P-8R --output bnode2/bnode2.ova
VBoxManage export 2204-2P-8R --output bnode3/bnode3.ova
VBoxManage export 2204-2P-8R --output bnode4/bnode4.ova


