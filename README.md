# CMake for the Microchip Toolchain

This project provides toolchains and other support modules to enable
using `CMake` with the Microchip compilers.


## Usage

First, you need to somehow get a copy of this project as a subdirectory of your
project named `external/cmake-microchip`. If you use git, the easiest way is to
add a submodule:

```bash
git submodule add https://github.com/arkaragian/cmake-microchip.git external/cmake-microchip
```

Then add this snippet at the very top of your `CMakeLists.txt`:

```cmake
# set up the Microchip cross toolchain
set(CMAKE_TOOLCHAIN_FILE external/cmake-microchip/toolchain.cmake)

# set the default MCU model
set(MICROCHIP_MCU "dsPIC33EP512GM304")
```

The target MCU is set by the `MICROCHIP_MCU` variable. It can be set
in `CMakeLists.txt` as above or on the CMake command line like so:

```bash
cmake .. -DMICROCHIP_MCU=PIC24FJ256GB004
```


## Building the Example

Create a `build` directory go there and issue the following command:
```
cmake .. -DCMAKE_TOOLCHAIN_FILE="../../toolchain.cmake"
```
