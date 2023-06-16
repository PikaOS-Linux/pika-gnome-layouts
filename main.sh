# Clone Upstream
mkdir -p ./pika-gnome-layouts
cp -rvf ./debian ./pika-gnome-layouts/
cp -rvf ./usr ./pika-gnome-layouts/
cd ./pika-gnome-layouts

# Get build deps
apt-get build-dep ./ -y

# Build package
dh_make --createorig
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
