FROM ubuntu:14.04

MAINTAINER Stefan Hojer <stefan.hojer@gmail.com>

# install additional software
RUN apt-get install -y man vim git bash-completion most

ADD profile/ /root
ADD profile.d/ /etc/profile.d
ADD vim/ /etc/vim

CMD [ "/bin/bash", "--login" ]
