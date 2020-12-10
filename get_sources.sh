#!/bin/bash

git submodule update --init --recursive

if ! [ -f lapack.tgz ]; then
  curl -L https://github.com/Reference-LAPACK/lapack/archive/v3.9.0.tar.gz -o lapack.tgz
fi

if ! [ -f fortran-ios.zip ]; then
  curl -L https://github.com/ColdGrub1384/fortran-ios/releases/download/v1.1/fortran-ios-macos-x86_64.zip -o fortran-ios.zip
fi

if ! [ -d lapack ] && ! [ -d fortran-ios ]; then
rm -rf lapack
rm -rf fortran-ios
tar xzf lapack.tgz
unzip fortran-ios.zip
rm -rf __MACOSX

mv lapack-3.9.0 lapack
fi
