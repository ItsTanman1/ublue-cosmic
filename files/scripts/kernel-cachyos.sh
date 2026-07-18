#!/usr/bin/env bash

set -oue pipefail

#Remove Fedora kernel and cleanup files
dnf -y remove kernel "kernel-*"
rm -rf /usr/lib/modules/*

#Enable the COPR repositories
dnf -y copr enable bieszczaders/kernel-cachyos
dnf -y copr enable bieszczaders/kernel-cachyos-addons

#Install the CachyOS kernel and bypass scripts
dnf -y install kernel-cachyos-lts --setopt=tsflags=noscripts

#Build modules, run depmod & generate initramfs
VER=$(ls /lib/modules)
depmod -a "$VER"
dracut --kver "$VER" \
    --force \
    --add ostree \
    --no-hostonly \
    --reproducible \
    --compress zstd \
    "/usr/lib/modules/$VER/initramfs.img"

#Install the CachyOS addons
dnf -y install scx-scheds scx-tools

#Remove the COPR repository
rm -f /etc/yum.repos.d/*copr*.repo
