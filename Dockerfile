FROM centos:centos6

MAINTAINER Prophet Yang <prophet0321@gmail.com>

RUN yum install -y squid patch vim httpd-tools

ADD squid.passwd /etc/squid/squid.passwd
ADD squid.conf.patch /etc/squid/squid.conf.patch

RUN cd /etc/squid && \
	patch -i squid.conf.patch && \
	rm -f /etc/squid/squid.conf.patch

ENTRYPOINT service squid start && \
	/bin/bash

CMD [ "/bin/bash" ]
