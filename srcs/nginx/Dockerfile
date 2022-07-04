FROM alpine:latest

MAINTAINER jelarose

RUN apk update && apk add nginx vim openssh openrc --no-cache 
RUN rm /etc/ssh/sshd_config 

COPY srcs/script.sh /home
COPY srcs/start.sh /home
COPY srcs/default.conf /home
COPY srcs/index.html /home
COPY srcs/localhost.key /home
COPY srcs/localhost.crt /home
COPY srcs/sshd_config /etc/ssh

RUN chmod +x /home/script.sh
RUN chmod +x /home/start.sh
RUN sh /home/script.sh

EXPOSE 80
EXPOSE 443
EXPOSE 22

ENTRYPOINT sh /home/start.sh
