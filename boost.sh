set -e

wget -O boost-1.61.0.tar.bz2 http://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.bz2/download

tar xf boost-1.61.0.tar.bz2

cd boost_1_61_0

./bootstrap.sh --prefix=$BOOST_ROOT --with-libraries=atomic,chrono,date_time,filesystem,iostreams,program_options,random,regex,serialization,signals,system,thread,wave
./b2 -sNO_BZIP2=1 install

export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATH

cd ..
rm -rf boost_1_61_0
