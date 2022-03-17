sudo mkdir -p /usr/local/lib
sudo cp libssl.1.1.dylib /usr/local/lib/libssl.1.1.dylib
sudo cp libcrypto.1.1.dylib /usr/local/lib/libcrypto.1.1.dylib
sudo chown `whoami`:staff  /usr/local/lib/libssl.1.1.dylib
sudo chown `whoami`:staff  /usr/local/lib/libcrypto.1.1.dylib
mkdir -p ~/fftools/
cp publishtools ~/fftools/fftools
cp redis-server ~/fftools/

sed '/fftools/d' ~/.zprofile > /tmp/1 && mv /tmp/1 ~/.zprofile

cat << EOF >> ~/.zprofile
export PATH="\$PATH:\$HOME/fftools"
EOF