#!/bin/sh
apt-get update \
 && apt-get install -y --no-install-recommends $DEPENDENCIES
# curl https://github.com/shadowsocks/shadowsocks-libev/archive/$VERSION.tar.gz

# Get the latest code, build and install
git clone https://github.com/shadowsocks/shadowsocks-libev.git $BASED
cd $BASEDIR
git checkout $VERSION \
 && ./configure \
 && make \
 && make install

# Tear down building environment and delete git repository
cd \
rm -rf $BASEDIR/shadowsocks-libev \
 && apt-get --purge autoremove -y $DEV_DEPENDENCIES