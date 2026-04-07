#!/usr/bin/env bash

set -oue pipefail

#Enable the COPR repository
dnf -y copr enable ryanabx/cosmic-epoch

#Install Cosmic Nightly
dnf -y install cosmic-desktop --setopt=install_weak_deps=False

#Cleanup and remove COPR repo
dnf clean all
rm -f /etc/yum.repos.d/*copr*.repo
