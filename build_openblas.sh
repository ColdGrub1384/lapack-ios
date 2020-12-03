#!/bin/bash

cd OpenBLAS
TOOLCHAIN_PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
SYSROOT_PATH="$(xcrun -sdk iphoneos -show-sdk-path)"
make TARGET=ARMV8 BINARY=64 HOSTCC=clang CC="$TOOLCHAIN_PATH/clang -isysroot $SYSROOT_PATH -arch arm64 -miphoneos-version-min=8.0 -O2" NOFORTRAN=1 libs

mkdir -p ../build
rm -rf ../build/openblas.framework
cp -r ../openblas.framework ../build
xcrun -sdk iphoneos clang -arch arm64 libopenblas_armv8*.a -all_load "-Wl,-install_name,@rpath/openblas.framework/openblas" -shared -o ../build/openblas.framework/openblas
