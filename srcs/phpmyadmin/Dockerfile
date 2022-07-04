FROM alpine:latest

RUN apk update && apk upgrade && apk add bash \
    && apk add vim unzip \
	&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip \
&& unzip phpMyAdmin-5.0.2-all-languages.zip \
&& mv phpMyAdmin-5.0.2-all-languages /www \
&& rm -rf /var/cache/apk/*

COPY srcs/phpmyadmin.inc.php /www/config.inc.php
COPY srcs/start.sh /home

RUN chmod +x /home/start.sh

EXPOSE 5000

ENTRYPOINT sh /home/start.sh
