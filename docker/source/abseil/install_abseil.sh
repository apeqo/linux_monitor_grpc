#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

CORE=$(nproc)
NAME="abseil-cpp-20240116.0.tar.gz"

tar zxvf "${NAME}"
pushd "abseil-cpp-20240116.0"
    mkdir build && cd build
    cmake .. \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_CXX_STANDARD=14 \
        -DCMAKE_INSTALL_PREFIX=/usr/local
    make -j${CORE}
    make install
popd

ldconfig

rm -rf "${NAME}" "abseil-cpp-20240116.0"