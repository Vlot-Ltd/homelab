#!/bin/sh

# Use parted to extend root partition to available /dev/vda space
END=$(parted /dev/vda print free  | grep Free | tail -1 | awk "{print \$2}")
parted /dev/vda resizepart 2 $END
pvresize /dev/vda2
VGROUP=$(mount | grep root | awk "{ print \$1 }")
lvextend -l +100%FREE -r $VGROUP