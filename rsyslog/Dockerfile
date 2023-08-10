FROM ghcr.io/linuxserver/baseimage-alpine:edge
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories &&\
           cd /etc/apk/keys &&\
           wget http://alpine.rsyslog.com//rsyslog@lists.adiscon.com-5a55e598.rsa.pub &&\
           echo 'http://alpine.rsyslog.com//3.7/stable' >> /etc/apk/repositories &&\
           apk add rsyslog tzdata rsyslog-mysql --no-cache &&\
           rm -fv /etc/localtime &&\
           cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
           echo '#!/bin/sh' > /docker_entrypoint.sh && \
           echo 'rm -fv /var/run/rsyslogd.pid' >> /docker_entrypoint.sh &&\
           echo 'if [ -f "/data/rsyslog.conf" ] ' >> /docker_entrypoint.sh &&\
           echo 'then' >> /docker_entrypoint.sh &&\
           echo ' rm -fv /etc/rsyslog.conf' >> /docker_entrypoint.sh &&\
           echo ' cp -f /data/rsyslog.conf /etc/rsyslog.conf' >> /docker_entrypoint.sh &&\
           echo 'fi' >> /docker_entrypoint.sh &&\
          # echo 'rsyslogd -nd' >> /docker_entrypoint.sh
           echo 'rsyslogd -n' >> /docker_entrypoint.sh
COPY rsyslog.conf /etc/rsyslog.conf
ENTRYPOINT [ "/bin/sh","/docker_entrypoint.sh" ]