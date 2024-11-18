tar -xvf httpd-2.2.15.tar.gz
cd httpd-2.2.15
./configure --prefix=/usr/local/apache2
make
make install
cp httpd.service /etc/systemd/system/httpd.service
