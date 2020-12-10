# lapack-ios

Lapack for iOS arm64 built with [fortran-ios](https://github.com/ColdGrub1384/fortran-ios).

Run `./build.sh` to build the framework. Then link `build/lapack.framework`, `build/ios_flang_runtime.framework` and `build/openblas.framework` to your project.
Docker is required to build the project.

Note: While building, the Fortran compiler will throw this error: `error: Invalid record`. But it builds successfully anyway.

[Download the pre-built binaries](https://github.com/ColdGrub1384/lapack-ios/releases/download/v1.3/lapack-ios.zip)
