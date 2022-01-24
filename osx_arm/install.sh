sudo mkdir -p /usr/local/lib
sudo cp libssl.1.1.dylib /usr/local/lib/libssl.1.1.dylib
sudo cp libcrypto.1.1.dylib /usr/local/lib/libcrypto.1.1.dylib
sudo chown `WHOAMI`:staff  /usr/local/lib/libssl.1.1.dylib
sudo chown `WHOAMI`:staff  /usr/local/lib/libcrypto.1.1.dylib