set -e

#---------------------------

# Dlib.
# --with-dlib='$HOME/opt/dlib/18.18'
# Download tarball from http://dlib.net/
# or https://sourceforge.net/projects/dclib/files/dlib/v18.18/
# unpack into desired installation directory

cd ~/Downloads
wget http://dlib.net/files/dlib-18.18.tar.bz2
mkdir -p ~/opt/dlib
cd ~/opt/dlib
tar -xf ~/Downloads/dlib-18.18.tar.bz2
mv dlib-18.18 18.18
