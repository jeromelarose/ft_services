FROM alpine

RUN apk update && apk add mysql mysql-client openrc

COPY srcs/mariadb-server.cnf /home
COPY srcs/script.sh /home
COPY srcs/scriptbase.sql /home
COPY srcs/wordpress-mysql.sql /home

RUN chmod +x /home/script.sh
RUN chmod -R 755 /var/lib/mysql

EXPOSE 3306
ENTRYPOINT sh /home/script.sh
