FROM registry.fedoraproject.org/fedora-toolbox:latest

LABEL com.github.containers.toolbox="true" \
      usage="Customized container based on the latest Fedora release. Intended for use with CorpSouth-Atomic images." \
      summary="Customized Fedora Distrobox container, the default for CorpSouth-Atomic workstations." \
      maintainer="nixontech91@hotmail.com"

COPY etc /etc
COPY extra-packages /

RUN dnf -y upgrade && \
    dnf -y install $(<extra-packages) && \
    dnf clean all

RUN rm /extra-packages 

RUN git clone --branch stable https://github.com/liquidprompt/liquidprompt.git /etc/liquidprompt

RUN ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/dconf && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/git && \ 
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/gsettings && \ 
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
     
