#!/bin/bash
#
# start.sh - start all cluster vms
#

VBoxManage startvm 611c2516-cfa4-49e7-b10b-dca2d47343cb --type headless
VBoxManage startvm aabf08ff-ad87-4828-8065-6787e294ab37 --type headless
VBoxManage startvm 107c3c13-9cf3-46b3-9613-9675a2159913 --type headless
VBoxManage startvm 3b3f83bb-ea2d-4d0f-939b-c48835a753d9 --type headless
VBoxManage startvm c77c202b-7dc8-4725-ab67-c800316911f6 --type headless
