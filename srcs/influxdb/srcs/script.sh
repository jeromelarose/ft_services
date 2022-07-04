mkdir /etc/telegraf
wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz 
tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz 
chmod +x telegraf/* 
cp telegraf/telegraf /usr/bin/
cp -r telegraf etc/
rm /etc/telegraf/telegraf.conf
cp /home/telegraf.conf /etc/telegraf/
rm /etc/influxdb.conf
cp /home/influxdb.conf /etc/influxdb.conf
