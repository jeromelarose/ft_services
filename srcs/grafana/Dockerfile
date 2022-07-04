FROM alpine:latest

RUN wget  https://dl.grafana.com/oss/release/grafana-7.1.1.linux-amd64.tar.gz \
	&& tar -zxvf grafana-7.1.1.linux-amd64.tar.gz \
	&& rm /grafana-7.1.1/conf/defaults.ini\
	&& rm -rf /var/cache/apk/*
RUN  apk update && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

COPY srcs/defaults.ini /home
COPY srcs/grafana.db /home
COPY srcs/script.sh /home
COPY srcs/start.sh /home

RUN chmod +x /home/script.sh
RUN chmod +x /home/start.sh
RUN chmod +x /grafana-7.1.1
RUN sh /home/script.sh

EXPOSE 3000

ENTRYPOINT sh /home/start.sh
