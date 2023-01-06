#!/bin/bash
#
# test.sh - Test script fo Ceph machines and vbox.sh
#
#

./vbox.sh --set-hostname 2204-ceph-admin ceph-admin
./vbox.sh --set-hostname 2204-ceph-mon ceph-mon
./vbox.sh --set-hostname 2204-ceph-osd1 ceph-osd1
./vbox.sh --set-hostname 2204-ceph-osd2 ceph-osd2
./vbox.sh --set-hostname 2204-ceph-osd3 ceph-osd3
