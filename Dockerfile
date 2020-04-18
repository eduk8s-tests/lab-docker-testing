FROM quay.io/eduk8s/workshop-dashboard:master

USER root

RUN dnf remove -y podman-docker && \
    dnf install -y dnf-plugins-core && \
    dnf config-manager --add-repo \
      https://download.docker.com/linux/fedora/docker-ce.repo && \
    dnf install -y docker-ce docker-ce-cli containerd.io && \
    dnf clean -y --enablerepo='*' all

USER 1001

COPY --chown=1001:0 . /home/eduk8s/
