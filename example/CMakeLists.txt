cmake_minimum_required(VERSION 3.20)
set(ProjectName MLT_XXX_FW)

get_filename_component(TOOLCHAIN_NAME "${CMAKE_TOOLCHAIN_FILE}" NAME)

if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
    message(FATAL_ERROR "A toolchain file was not defined.")
endif()

# set the default MCU model
set(MICROCHIP_MCU "dsPIC33EP512GM304")

message("-- Building for PIC target")

project(${ProjectName} C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Define your executable name and the source file(s)
add_executable(${ProjectName} main.c)

bin2hex(${ProjectName})
