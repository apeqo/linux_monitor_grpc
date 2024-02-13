#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

CORE=$(nproc)
NAME="protobuf-25.2.tar.gz"

tar zxvf "${NAME}"
pushd "protobuf-25.2"

    cmake . \
        -DCMAKE_CXX_STANDARD=14 \
        -DBUILD_SHARED_LIBS=ON \
        -Dprotobuf_BUILD_TESTS=OFF \
        -DCMAKE_INSTALL_PREFIX:PATH="/usr/local" \
        -DCMAKE_BUILD_TYPE=Release
    make -j${CORE}
    make install
    ldconfig
    
popd

rm -rf "$NAME" "protobuf-25.2"