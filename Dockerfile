FROM quay.io/centos/centos:stream9

# Install basic tools
RUN dnf -y update && \
    dnf -y install sudo \
    make

# Install specific tools for xxx builds
RUN dnf -y install 'dnf-command(copr)' && \
    dnf -y copr enable @osbuild/osbuild && \
    dnf -y install osbuild osbuild-tools osbuild-ostree

# Copy host setup script to be run during installation
COPY hostsetup.sh /usr/local/bin/hostsetup.sh

# copy entry point
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /app

RUN groupadd -r --gid 1000 blduser && useradd --uid 1000 -g blduser blduser

# Temporary to speed up container development - add apt install
RUN echo "blduser ALL= NOPASSWD: /usr/bin/dnf" > /etc/sudoers.d/blduser && \
    chmod 0440 /etc/sudoers.d/blduser

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
