#! /bin/sh

echo "Download Nginx Dependencies"
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz && tar -zxf pcre-8.42.tar.gz
wget http://zlib.net/zlib-1.2.11.tar.gz && tar -zxf zlib-1.2.11.tar.gz
wget http://www.openssl.org/source/openssl-1.0.2o.tar.gz && tar -zxf openssl-1.0.2o.tar.gz
wget https://nginx.org/download/nginx-1.14.0.tar.gz && tar zxf nginx-1.14.0.tar.gz
git clone https://github.com/jcu-eresearch/nginx-custom-build.git

echo "Install PCRE"
cd pcre-8.42/
./configure
make
make install
cd ..

echo "Install ZLIB"
cd zlib-1.2.11/
./configure
make
make install
cd ..

echo "Clear Installation"
rm -rf *.tar.gz

echo "Apply PATCH"
cd nginx-1.14.0/
patch -p1 < ../nginx-custom-build/nginx-xslt-html-parser.patch

echo "Configure"
./configure --with-pcre --with-http_xslt_module --with-http_ssl_module --with-openssl=../openssl-1.0.2o/
# echo "Make 1"
make
make install
echo "So Far So Good"
