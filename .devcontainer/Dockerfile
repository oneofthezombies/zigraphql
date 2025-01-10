FROM mcr.microsoft.com/devcontainers/base:debian-12

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt update && \
    apt install -y curl && \
    echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_12/ /' | tee /etc/apt/sources.list.d/shells:fish:release:3.list && \
    curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:3/Debian_12/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/shells_fish_release_3.gpg > /dev/null && \
    apt update && \
    apt install -y \
        git \
        xdg-utils \
        fish && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN ARCH=$(uname -m) && \
    FILENAME=zig-linux-${ARCH}-0.13.0.tar.xz && \
    curl -fsSL https://ziglang.org/download/0.13.0/${FILENAME} -o ${FILENAME} && \
    tar -C /opt -xf ${FILENAME} && \
    rm ${FILENAME} && \
    ln -s /opt/zig-linux-${ARCH}-0.13.0/zig /usr/local/bin/zig && \
    FILENAME=zls-${ARCH}-linux.tar.xz && \
    curl -fsSL https://github.com/zigtools/zls/releases/download/0.13.0/${FILENAME} -o ${FILENAME} && \
    mkdir -p /opt/zls-${ARCH}-linux && \
    tar -C /opt/zls-${ARCH}-linux -xf ${FILENAME} && \
    rm ${FILENAME} && \
    ln -s /opt/zls-${ARCH}-linux/zls /usr/local/bin/zls

USER vscode
WORKDIR /work
RUN mkdir -p /home/vscode/.config/fish
ENV FISH_CONFIG_PATH=/home/vscode/.config/fish/config.fish

RUN curl -fsSL https://bun.sh/install | bash -s -- bun-v1.1.43 

RUN echo "alias ll='ls -alF'" >> ${FISH_CONFIG_PATH}
RUN echo "functions --erase fish_greeting" >> ${FISH_CONFIG_PATH}
