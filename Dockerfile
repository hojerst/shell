FROM ubuntu:15.04

MAINTAINER Stefan Hojer <stefan.hojer@gmail.com>

# update system
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y --purge && \
    apt-get autoclean -y

# install additional software
RUN apt-get install -y man vim git bash-completion most

ADD profile/ /root
ADD profile.d/ /etc/profile.d
ADD vim/ /etc/vim

CMD [ "/bin/bash", "--login" ]
