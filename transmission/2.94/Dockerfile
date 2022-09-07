FROM ghcr.io/linuxserver/baseimage-alpine:3.11

RUN echo "**** install packages ****" && \
 set -eux && \
 sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
 apk add --no-cache \
	ca-certificates \
	curl \
	findutils \
	jq \
	openssl \
	p7zip \
	python3 \
	rsync \
	tar \
	unrar \
	unzip && \
 echo "**** install transmission ****" && \
 apk add \
	transmission-cli \
	transmission-daemon && \
 echo "**** install third party themes ****" && \
 mkdir -p /tmp/twctemp && \
 TWCVERSION=$(curl -sX GET "https://api.github.com/repos/ronggang/transmission-web-control/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]') && \
 curl -o \
	/tmp/twc.tar.gz -L \
	"https://github.com/ronggang/transmission-web-control/archive/${TWCVERSION}.tar.gz" && \
 tar xf \
	/tmp/twc.tar.gz -C \
	/tmp/twctemp --strip-components=1 && \
 mv /tmp/twctemp/src /transmission-web-control && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/*


# copy local files
COPY root/ /

# ports and volumes
EXPOSE 9091 51413
VOLUME /config /downloads /watch
