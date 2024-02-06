ARG COREOS_VERSION="${COREOS_VERSION:-stable}"
FROM quay.io/fedora/fedora-coreos:${COREOS_VERSION}
RUN rpm-ostree override remove nfs-utils-coreos
RUN rpm-ostree install \
      libvirt \
    && systemctl enable libvirtd.service \
    && systemctl disable zincati.service
COPY cosign.pub /usr/etc/pki/containers/ii.pub
COPY files /
RUN rm -fr /tmp/* /var/* \
    && ostree container commit
