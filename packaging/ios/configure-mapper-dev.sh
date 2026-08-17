#!/bin/zsh
# Configure Mapper for iOS device (arm64) with static Qt 6.11.1
set -e
ROOT=/Users/ac/Dev/aibox/app/open-orienteering-map
QT_IOS=$ROOT/qt-ios/6.11.1/ios
QT_HOST=/opt/homebrew/opt/qt
DEPS=$ROOT/ios-build/deps-dev
BUILD=$ROOT/ios-build/mapper-ipados-device

cmake -S "$ROOT/mapper-ipados" -B "$BUILD" -G Ninja \
  -DCMAKE_TOOLCHAIN_FILE="$QT_IOS/lib/cmake/Qt6/qt.toolchain.cmake" \
  -DQT_HOST_PATH="$QT_HOST" \
  -DCMAKE_OSX_SYSROOT=iphoneos \
  -DCMAKE_OSX_ARCHITECTURES=arm64 \
  -DCMAKE_OSX_DEPLOYMENT_TARGET=17.0 \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH="$DEPS" \
  -DCMAKE_FIND_ROOT_PATH="$DEPS" \
  -DPROJ_DIR="$DEPS/lib/cmake/proj" \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
  -DMapper_USE_GDAL=ON \
  -DMapper_WITH_COVE=OFF \
  -DMapper_MANUAL_QTHELP=OFF \
  -DMapper_PACKAGE_PROJ=OFF \
  -DMapper_PACKAGE_QT=OFF \
  -DMapper_PACKAGE_ASSISTANT=OFF \
  "$@"

