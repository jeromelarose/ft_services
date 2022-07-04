FROM alpine:latest

RUN apk update && apk add vsftpd vim openrc

COPY srcs/script.sh /home
COPY srcs/start.sh /home
COPY srcs/vsftpd.conf /home
COPY srcs/vsftpd.chroot_list /home
COPY srcs/vsftpd.key /home
COPY srcs/vsftpd.crt /home

RUN chmod +x /home/script.sh
RUN chmod +x /home/start.sh
RUN sh /home/script.sh

EXPOSE 21 30020 30021
ENTRYPOINT sh /home/start.sh
