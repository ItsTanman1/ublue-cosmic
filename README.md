# ublue-cosmic &nbsp; [![bluebuild build badge](https://github.com/itstanman1/ublue-cosmic/actions/workflows/build.yml/badge.svg)](https://github.com/itstanman1/ublue-cosmic/actions/workflows/build.yml)

My personal Universal Blue based OS image. This build focuses on integrating the COSMIC desktop environment and the CachyOS kernel onto a stable atomic base.

## Personal Configuration

- Kernel: Swapped to the CachyOS kernel for more performance while gaming.

- Desktop: Pre-configured with the COSMIC desktop environment.

## Installation

To rebase an existing Fedora Bootc installation to the latest build:

- Switch to the new container image:
  ```
  sudo bootc switch ghcr.io/itstanman1/ublue-cosmic:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/itstanman1/ublue-cosmic
```
