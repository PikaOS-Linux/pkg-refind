#! /bin/bash

DEBIAN_FRONTEND=noninteractive

# Clone Upstream
tar refind-0.14.0.2
tar -xf ./refind-src-0.14.0.2.tar.gz
cp -rvf ./debian ./refind-0.14.0.2/
cd ./refind-0.14.0.2/

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
