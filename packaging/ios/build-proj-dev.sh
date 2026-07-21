#!/bin/zsh
# Cross-compile PROJ for iOS Simulator (arm64)
set -e
ROOT=/Users/ac/Dev/aibox/app/open-orienteering-map
SRC=$ROOT/proj-9.6.2
BUILD=$ROOT/ios-build/proj-dev
PREFIX=$ROOT/ios-build/deps-dev

cmake -S "$SRC" -B "$BUILD" -G Ninja \
  -DCMAKE_SYSTEM_NAME=iOS \
  -DCMAKE_OSX_SYSROOT=iphoneos \
  -DCMAKE_OSX_ARCHITECTURES=arm64 \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=17.0 \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_SHARED_LIBS=OFF \
  -DENABLE_CURL=OFF \
  -DENABLE_TIFF=OFF \
  -DBUILD_APPS=OFF \
  -DBUILD_TESTING=OFF \
  -DEXE_SQLITE3=/usr/bin/sqlite3 \
  -DCMAKE_INSTALL_PREFIX="$PREFIX"
cmake --build "$BUILD" -j8
cmake --install "$BUILD"
echo "PROJ for iOS simulator installed to $PREFIX"
