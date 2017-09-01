set -e

mkdir build-rose
cd build-rose

CC=/usr/bin/gcc-4.9
CXX=g++-4.9
CXXFLAGS='-g -rdynamic -Wall -Wno-unused-local-typedefs -Wno-attributes'

$HOME/rose-develop/configure \
  --enable-assertion-behavior=abort \
  --prefix=$HOME/rose-installation \
  --with-CFLAGS=-fPIC \
  --with-CXXFLAGS=-fPIC \
  --with-C_OPTIMIZE=-O0 \
  --with-CXX_OPTIMIZE=-O0 \
  --with-C_DEBUG='-g -rdynamic' \
  --with-CXX_DEBUG='-g -rdynamic' \
  --with-C_WARNINGS='-Wall -Wno-unused-local-typedefs -Wno-attributes' \
  --with-CXX_WARNINGS='-Wall -Wno-unused-local-typedefs -Wno-attributes' \
  --with-ROSE_LONG_MAKE_CHECK_RULE=yes \
  --with-boost=$HOME/opt/boost/1.61.0/gcc-4.9.3-default \
  --without-gfortran \
  --with-python='/usr/bin/python3' \
  --without-java \
  --enable-languages=c,c++ \
  --enable-projects-directory \
  --without-doxygen \
  --without-sqlite3 \
  --without-libreadline \
  --without-magic \
  --without-yaml \
  --without-wt \
  --without-yices \
  --without-pch \
  --enable-rosehpct \
  --with-gomp_omp_runtime_library=/usr/lib/gcc/x86_64-linux-gnu/4.9/ \
  --without-haskell \
  --enable-edg_version=4.12

make install-rose-library

# make core
# make install-core
#
# cd ~/
# echo -e "ROSE_INS=$HOME/opt/rose_inst\nPATH=\$PATH:\$ROSE_INS/bin\nLD_LIBRARY_PATH=\$LD_LIBRARY_PATH:$ROSE_INS/lib\nexport PATH LD_LIBRARY_PATH"  > set.rose
