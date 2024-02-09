ARG COREOS_VERSION="${COREOS_VERSION:-stable}"
FROM quay.io/fedora/fedora-coreos:${COREOS_VERSION}
RUN rpm-ostree override remove \
    nfs-utils-coreos \
    --install=libvirt \
    --install=qemu \
    --install=bootc \
    --install=osbuild-selinux
RUN rpm-ostree override replace https://bodhi.fedoraproject.org/updates/FEDORA-2024-a1ac5fb998
RUN systemctl enable \
      libvirtd.service \
      rpm-ostreed-automatic.timer \
      docker.service \
    && systemctl disable zincati.service
COPY cosign.pub /usr/etc/pki/containers/ii.pub
COPY files /
RUN rm -fr /tmp/* /var/* \
    && ostree container commit
