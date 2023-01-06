#!/bin/bash

rm -rf ceph-admin 
rm -rf ceph-mon 
rm -rf ceph-osd1 
rm -rf ceph-osd2 
rm -rf ceph-osd3 

mkdir ceph-admin 
mkdir ceph-mon 
mkdir ceph-osd1 
mkdir ceph-osd2 
mkdir ceph-osd3 

VBoxManage export 2204-2P-8R --output ceph-admin/ceph-admin.ova
VBoxManage export 2204-2P-8R --output ceph-mon/ceph-mon.ova
VBoxManage export 2204-2P-8R --output ceph-osd1/ceph-osd1.ova
VBoxManage export 2204-2P-8R --output ceph-osd2/ceph-osd2.ova
VBoxManage export 2204-2P-8R --output ceph-osd3/ceph-osd3.ova


