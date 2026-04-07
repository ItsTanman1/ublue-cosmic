# ublue-cosmic &nbsp; [![bluebuild build badge](https://github.com/itstanman1/ublue-cosmic/actions/workflows/build.yml/badge.svg)](https://github.com/itstanman1/ublue-cosmic/actions/workflows/build.yml)

My personal Universal Blue based OS image. This build focuses on integrating the COSMIC desktop environment and the CachyOS kernel onto a stable atomic base.
Personal Configuration

- Kernel: Swapped to the CachyOS kernel for more performance in game.

- Desktop: Pre-configured with the COSMIC desktop environment.

## Installation

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/itstanman1/ublue-cosmic:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/itstanman1/ublue-cosmic:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/itstanman1/ublue-cosmic
```
