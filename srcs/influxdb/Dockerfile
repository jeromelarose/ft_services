FROM alpine:latest

RUN apk update && apk add influxdb\
	&& apk add --no-cache --upgrade bash

COPY srcs/script.sh /home
COPY srcs/start.sh /home
COPY srcs/influxdb.conf /home
COPY srcs/scriptdb /home
COPY srcs/telegraf.conf /home

RUN chmod +x /home/script.sh
RUN chmod +x /home/start.sh
RUN sh /home/script.sh

EXPOSE 8086

ENTRYPOINT sh /home/start.sh
