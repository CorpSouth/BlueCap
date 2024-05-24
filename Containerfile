FROM quay.io/toolbx-images/fedora-toolbox:latest

COPY ./configurations/etc/profile.d /etc

RUN dnf -y upgrade

RUN dnf -y install \
           android-tools \
           btop \
           cmake \
           dnf-plugins-core \
           fzf \
           make \
           mc \
           ncdu \
           neovim \
           ninja-build \
           pipx \
           rogue \
           shellcheck \
           yt-dlp

RUN dnf clean all

RUN echo 'Cloning Liquid Prompt Repository...' \ 
    git clone --branch stable https://github.com/liquidprompt/liquidprompt.git /etc/liquidprompt \
    echo "[[ $- = *i* ]] && source /etc/liquidprompt/liquidprompt" >> /etc/profile.d/liquidprompt-interactive-only.sh

RUN ln -fs /bin/sh /usr/bin/sh && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak && \ 
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/git && \ 
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/podman && \
    ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
     
