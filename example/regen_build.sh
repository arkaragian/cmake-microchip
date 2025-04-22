#!/bin/sh

if test -d build; then
    rm -rf build/
fi
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE="../microchip_toolchain.cmake"
