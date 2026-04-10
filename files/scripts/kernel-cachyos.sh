#!/usr/bin/env bash

set -oue pipefail

#Remove Fedora kernel and cleanup files
dnf -y remove kernel "kernel-*"
rm -rf /usr/lib/modules/*

#Enable the COPR repository
dnf -y copr enable bieszczaders/kernel-cachyos

#Install the CachyOS kernel and bypass scripts
dnf -y install kernel-cachyos --setopt=tsflags=noscripts

#Build modules, run depmod & generate initramfs
VER=$(ls /lib/modules)
depmod -a "$VER"
dracut --kver "$VER" \
    --force \
    --add ostree \
    --no-hostonly \
    --reproducible \
    "/usr/lib/modules/$VER/initramfs.img"

#Remove the COPR repository
rm -f /etc/yum.repos.d/*copr*.repo
