# corehost

> A Fedora CoreOS image with some development packages built in

## Switching to the image

```shell
rpm-ostree reset
rpm-ostree rebase ostree-unverified-registry:ghcr.io/ii/corehost/corehost:stable
```
(as root)
