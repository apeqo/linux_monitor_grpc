#!/usr/bin/env bash

set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

CORE=$(nproc)
NAME="v1.59.4.tar.gz"

tar xzf "${NAME}"

pushd "v1.59.4"
    mkdir build && cd build
    cmake ..    -DgRPC_INSTALL=ON                \
                -DBUILD_SHARED_LIBS=ON           \
                -DCMAKE_BUILD_TYPE=Release       \
                -DgRPC_ABSL_PROVIDER=package     \
                -DgRPC_CARES_PROVIDER=package    \
                -DgRPC_PROTOBUF_PROVIDER=package \
                -DgRPC_RE2_PROVIDER=package      \
                -DgRPC_SSL_PROVIDER=package      \
                -DgRPC_ZLIB_PROVIDER=package     \
                -DCMAKE_INSTALL_PREFIX=/usr/local/
    make -j${CORE}
    make install
popd

ldconfig

rm -rf "$NAME" "v1.59.4"