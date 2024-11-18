tar -zxvf node-v0.10.26-linux-x64.tar.gz 
cd node-v0.10.26-linux-x64/
sudo cp bin/* /usr/local/bin
sudo cp -R lib/* /usr/local/lib
sudo cp -R share/* /usr/local/share
node -v
