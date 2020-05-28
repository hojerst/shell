ARG UBUNTU_VERSION=20.04

FROM ubuntu:${UBUNTU_VERSION}

# install additional software
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y man vim git zsh curl dnsutils iproute2 iputils-ping telnet && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /root/.ssh && \
    curl -L profile.redcube.de | sh

ENV SHELL /bin/zsh
WORKDIR /root

CMD [ "/bin/zsh", "--login" ]
