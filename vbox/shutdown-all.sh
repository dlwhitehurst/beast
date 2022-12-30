#!/bin/bash
#
# start.sh - start all cluster vms
#

VBoxManage controlvm f06ef8e6-fa7d-43e7-b927-f08718fc7be4 acpipowerbutton
VBoxManage controlvm 47164110-2741-4d7f-b3ce-b75f8bb321b8 acpipowerbutton
VBoxManage controlvm eef86fac-db9a-4b75-bb92-346cba8b4ab7 acpipowerbutton
VBoxManage controlvm 256221f8-99e4-4fd4-8bdd-6f6f54bc499f acpipowerbutton
VBoxManage controlvm ddc25b94-6e64-478d-baba-f366384b2fa8 acpipowerbutton
