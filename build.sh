#!/bin/bash

./get_sources.sh

yes | cp -rf make.inc lapack

export PATH="$PWD/fortran-ios/bin:$PATH"

docker ps --format '{{.Names}}' | grep "flang" &> /dev/null

if [ $? != 0 ]; then
  docker stop flang
  docker rm flang
fi

cd lapack
make lib

mkdir -p ../build
yes | cp -rf *.a ../build
yes | cp -rf ../lapack.framework ../build
xcrun -sdk iphoneos clang -arch arm64 ../build/*.a -shared -o ../build/lapack.framework/lapack
yes | cp -rf ../fortran-ios/share/ios_flang_runtime.framework ../build/

docker stop flang
docker rm flang
