set -e

#---------- installing Boost ----------

# download boost from
# https://sourceforge.net/projects/boost/files/boost/1.61.0/

cd ~/Downloads
wget -O boost-1.61.0.tar.bz2 http://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.bz2/download
tar xf boost-1.61.0.tar.bz2
cd boost_1_61_0
./bootstrap.sh --prefix=$HOME/opt/boost/1.61.0/gcc-4.9.3-default --with-libraries=atomic,chrono,date_time,filesystem,iostreams,program_options,random,regex,serialization,signals,system,thread,wave
./b2 -sNO_BZIP2=1 install

export LD_LIBRARY_PATH=$HOME/opt/boost/1.61.0/gcc-4.9.3-default/lib:$LD_LIBRARY_PATH
# add to .bashrc
sed -i '$ a export LD_LIBRARY_PATH=$HOME/opt/boost/1.61.0/gcc-4.9.3-default/lib:$LD_LIBRARY_PATH\n' $HOME/.bashrc
