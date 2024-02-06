# corehost

> A Fedora CoreOS image with some development packages built in

**about**

- automatically staged updates
- updates are applied on reboot
- image is signed

## Switching to the image

reset to a clean state
```shell
rpm-ostree reset
```

rebase to the image
```shell
rpm-ostree rebase ostree-unverified-registry:ghcr.io/ii/corehost/corehost:stable
```
(as root)
and reboot

then rebase to the signed version
```shell
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ii/corehost/corehost:stable
```

## Making changes

to add new files to the file system add them hierarchically in the [./files/](./files/) directory.

new packages are added in the [./Containerfile](./Containerfile) like so:

```dockerfile
RUN rpm-ostree override remove \
  PACKAGE_TO_REMOVE_1 \
  PACKAGE_TO_REMOVE_2 \
  PACKAGE_TO_REMOVE_3 \
  --install=PACKAGE_TO_INSTALL_1 \
  --install=PACKAGE_TO_INSTALL_2 \
  --install=PACKAGE_TO_INSTALL_3
```

services are enabled inline with `systemctl enable` and `systemctl disable`

## No-time iteration

given an image is built in CI and pushed

```shell
rpm-ostree upgrade
rpm-ostree apply-live
```

## Equinix Metal iPXE booting

read [this doc](./equinix-metal-ipxe-boot/README.md)
