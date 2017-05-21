FROM ubuntu:16.04

# install additional software
RUN apt-get update && \
    apt-get install -y man vim git bash-completion curl dnsutils iproute2 && \
    rm -rf /var/lib/apt/lists/*

ADD profile/ /root
ADD profile.d/ /etc/profile.d
ADD vim/ /etc/vim

WORKDIR /root

CMD [ "/bin/bash", "--login" ]
