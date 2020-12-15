FROM quay.io/skopeo/stable:v1.2.0@sha256:1143edac7c251ff3cd756d94bfd4d2e83a1353dd05cf4dcf73e2f5100b391d44 AS skopeo
FROM ubuntu:20.04 AS downloads

WORKDIR /work

RUN apt-get update
RUN apt-get install --no-install-recommends -y curl ca-certificates
RUN curl -L -o kubectl https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl
RUN chmod 0755 kubectl

FROM ubuntu:20.04

# install additional software
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -y \
        man \
        vim \
        git \
        zsh \
        curl \
        dnsutils \
        iproute2 \
        iputils-ping \
        telnet \
        httpie \
        fzf \
        ripgrep \
        swaks \
        netcat \
        yadm \
        locales \
        openssh-client \
        libgpgme11 \
        libdevmapper1.02.1 \
        ca-certificates && \
    yadm clone https://gitlab.com/hojerst/dotfiles.git -f --bootstrap && \
    /bin/zsh -c "SSH_AUTH_SOCK=/dev/null source /root/.zshrc" && \
    locale-gen en_GB.UTF-8 && \
    ln -sf libdevmapper.so.1.02.1 /lib/x86_64-linux-gnu/libdevmapper.so.1.02 && \
    rm -rf /var/lib/apt/lists/*

COPY --from=downloads /work/kubectl /usr/local/bin/
COPY --from=skopeo /etc/containers /etc
COPY --from=skopeo /usr/bin/skopeo /usr/local/bin

ENV SHELL /bin/zsh
WORKDIR /root

CMD [ "/bin/zsh", "--login" ]
