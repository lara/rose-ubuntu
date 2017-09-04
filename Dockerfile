FROM ubuntu:xenial

####################################################################################################
# Folder structure
#
# /rose
#   /source
#   /build
#   /installation
#   /boost
####################################################################################################

ENV ROSE_BASE /rose
ENV ROSE_SOURCE $ROSE_BASE/source
ENV ROSE_BUILD $ROSE_BASE/build
ENV ROSE_INSTALLATION $ROSE_BASE/installation
ENV BOOST_ROOT $ROSE_BASE/boost

####################################################################################################
# Dependencies
####################################################################################################

ENV DEPS git wget build-essential libtool automake flex bison python3-dev unzip gcc-4.9 g++-4.9 ghostscript

RUN apt-get update \
 && apt-get -y upgrade \
 && apt-get -y install $DEPS \
 && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100 \
 && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100 \
 && apt-get clean

WORKDIR $ROSE_BASE

####################################################################################################
# Boost
####################################################################################################

ADD ./boost.sh ./boost.sh
RUN chmod +x ./boost.sh
RUN ./boost.sh

####################################################################################################
# Rose source
####################################################################################################

RUN git clone https://github.com/rose-compiler/rose-develop $ROSE_SOURCE --depth 1 \
 && cd $ROSE_SOURCE \
 && ./build

ENV CC /usr/bin/gcc-4.9
ENV CXX g++-4.9
ENV CXXFLAGS -g -rdynamic -Wall -Wno-unused-local-typedefs -Wno-attributes

RUN $ROSE_SOURCE/configure \
      --enable-assertion-behavior=abort \
      --prefix=$ROSE_INSTALLATION \
      --with-CFLAGS=-fPIC \
      --with-CXXFLAGS=-fPIC \
      --with-C_OPTIMIZE=-O0 \
      --with-CXX_OPTIMIZE=-O0 \
      --with-C_DEBUG='-g -rdynamic' \
      --with-CXX_DEBUG='-g -rdynamic' \
      --with-C_WARNINGS='-Wall -Wno-unused-local-typedefs -Wno-attributes' \
      --with-CXX_WARNINGS='-Wall -Wno-unused-local-typedefs -Wno-attributes' \
      --with-ROSE_LONG_MAKE_CHECK_RULE=yes \
      --with-boost=$BOOST_ROOT \
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
      --enable-edg_version=4.12 \
 && make install-rose-library

 ENV LD_LIBRARY_PATH $BOOST_ROOT/lib:$ROSE_INSTALLATION/lib:${LD_LIBRARY_PATH}

 ####################################################################################################
 # IdentityTranslator
 ####################################################################################################

 RUN git clone https://github.com/laraaydin/rose-project-templates.git
   && cd rose-project-templates
   && make
