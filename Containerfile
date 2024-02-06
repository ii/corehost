ARG COREOS_VERSION="${COREOS_VERSION:-stable}"
FROM quay.io/fedora/fedora-coreos:${COREOS_VERSION}
RUN rpm-ostree override remove nfs-utils-coreos && \
    rpm-ostree install \
      libvirt \
    && rm -fr /tmp/* /var/* \
    && ostree container commit \
