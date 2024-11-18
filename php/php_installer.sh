php_root=$(grep "^php_root=" config.conf | cut -d'=' -f2)
tar -xvf php-5.3.3.tar.gz
cp txtbgxGXAvz4N.txt php-5.3.3
dnf install -y python2 gcc zlib-devel
ln -sf /usr/bin/python2 /usr/bin/python
dnf install -y libxml2-2.7.6-5.el6.rfx.x86_64.rpm --allowerasing
rpm -Uhv libxml2-devel-2.7.6-5.el6.rfx.x86_64.rpm --nodeps
tar -xzvf libevent-1.4.14b-stable.tar.gz
cd $php_root/libevent-1.4.14b-stable
./configure
make
make install
ldconfig
cd $php_root/php-5.3.3
./configure --prefix=/usr/local/php --enable-fpm
patch -p0 < txtbgxGXAvz4N.txt
make
make install
cd $php_root
cp php-fpm.service /etc/systemd/system
cp php-fpm.conf /usr/local/php/etc
sudo chown -R $(whoami):$(whoami) /usr/local/php/var/run
sudo systemctl daemon-reload
sleep 5
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
sudo systemctl status php-fpm
sudo ln -s /usr/local/php/bin/php /usr/local/bin/php
