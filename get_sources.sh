#!/bin/bash

if ! [ -f lapack.tgz ]; then
  curl -L https://github.com/Reference-LAPACK/lapack/archive/v3.9.0.tar.gz -o lapack.tgz
fi

if ! [ -f fortran-ios.zip ]; then
  curl -L https://github.com/ColdGrub1384/fortran-ios/releases/download/v1.0/fortran-ios-macos-x86_64.zip -o fortran-ios.zip
fi

tar xzf lapack.tgz
unzip fortran-ios.zip

rm -rf lapack
mv lapack-3.9.0 lapack
