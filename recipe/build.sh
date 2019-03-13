#!/bin/bash

export CPPFLAGS="-I${PREFIX}/include ${CPPFLAGS}"
export LDFLAGS="-L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib ${LDFLAGS}"

if [[ `uname` == 'Darwin' ]]; then
  EXTRA_CONFIGURE_ARGS="--without-tk"
fi

cd scilab
./configure --prefix=${PREFIX} \
            --without-javasci \
            --without-gui \
            --disable-build-help \
            --with-eigen-include=${PREFIX}/include/eigen3 \
            --without-modelica \
            --without-matio \
            ${EXTRA_CONFIGURE_ARGS}

make -j${CPU_COUNT}
make install
