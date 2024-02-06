# corehost

> A Fedora CoreOS image with some development packages built in

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

then rebase to the signed version
```shell
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/ii/corehost/corehost:stable
```

## Equinix Metal iPXE booting

read [this doc](./equinix-metal-ipxe-boot/README.md)
