openrc
touch /run/openrc/softlevel
adduser jelarose -D
echo "jelarose:pass" | chpasswd
rm /etc/vsftpd/vsftpd.conf
cp /home/vsftpd.conf /etc/vsftpd
cp /home/vsftpd.chroot_list /etc/vsftpd
cp /home/vsftpd.key /etc/ssl/private
cp /home/vsftpd.crt /etc/ssl/certs
