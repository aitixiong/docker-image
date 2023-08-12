FROM ghcr.io/linuxserver/baseimage-alpine:edge

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
            apk update && \
            apk add php-apache2 php-mysqli php-pdo  php-mbstring php-gd php-dom  php-pear php-session php-simplexml php-gmp  php-sockets php-json php-gettext  php-iconv php-ctype php-curl && \
            sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/g' /etc/apache2/httpd.conf && \
            rm -rf /var/www/localhost/htdocs/* && \
            touch /var/www/localhost/htdocs/config.php && \
            chmod  666 /var/www/localhost/htdocs/config.php          

COPY loganalyzer-4.1.13-src/ /var/www/localhost/htdocs

EXPOSE 80
 
CMD ["httpd","-DFOREGROUND"]
