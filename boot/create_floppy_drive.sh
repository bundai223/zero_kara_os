#!/bin/bash

dd if=/dev/zero of=fd_image.img bs=1KiB count=1440
mkdosfs fd_image.img

mkdir -p mnt/vfd
sudo mount -o loop fd_image.img mnt/vfd
