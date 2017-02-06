FROM ubuntu:16.10

MAINTAINER Stefan Hojer <stefan.hojer@gmail.com>

# install additional software
RUN apt-get update && \
    apt-get install -y man vim git bash-completion most

ADD profile/ /root
ADD profile.d/ /etc/profile.d
ADD vim/ /etc/vim

WORKDIR /root

CMD [ "/bin/bash", "--login" ]
