#!/bin/bash

./get_sources.sh

yes | cp -rf make.inc lapack

export PATH="$PWD/fortran-ios/bin:$PATH"
cd lapack
make lib

mkdir -p ../build
yes | cp -rf *.a ../build
yes | cp -rf ../lapack.framework ../build
xcrun -sdk iphoneos clang -arch arm64 ../build/*.a -shared -o ../build/lapack.framework/lapack
yes | cp -rf ../fortran-ios/share/ios_flang_runtime.framework ../build/
