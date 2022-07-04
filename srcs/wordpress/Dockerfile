FROM alpine:latest

MAINTAINER jelarose

RUN apk update\
    && apk add vim unzip\
	php7 php7-openssl php7-cgi php7-xml php7-pdo php7-mcrypt php7-session php7-mysqli php7-zlib php7-json --no-cache

RUN wget https://fr.wordpress.org/latest-fr_FR.zip\ 
	&& unzip latest-fr_FR.zip

COPY srcs/script.sh /home
COPY srcs/wp-config.php /home

RUN chmod +x /home/script.sh
RUN mkdir -p /var/www/html
RUN chmod -R 777 /var/www/html

EXPOSE 5050

ENTRYPOINT sh /home/script.sh
