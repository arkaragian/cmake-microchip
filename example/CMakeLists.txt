cmake_minimum_required(VERSION 3.20)
set(ProjectName MLT_XXX_FW)

if(NOT DEFINED TARGET_PLATFORM) 
    message(FATAL_ERROR "TARGET_PLATFORM is not defined. This is a firmware project that requires cross compilation")
endif()


get_filename_component(TOOLCHAIN_NAME "${CMAKE_TOOLCHAIN_FILE}" NAME)

message("Toolchain: ${TOOLCHAIN_NAME}")

string(TOLOWER "${TARGET_PLATFORM}" TARGET_PLATFORM_LOWER)
if (TARGET_PLATFORM_LOWER STREQUAL "pic")

    # set the default MCU model
    set(MICROCHIP_MCU "dsPIC33EP512GM304")
    #set(MCU_MODEL "33EP512GM304")

    #set(CMAKE_C_FLAGS "-mcpu=${MCU_MODEL}" CACHE STRING "C compiler flags" FORCE)

    # use cache variable in order to be passed to the subdirectories
    set(TARGET_PLATFORM "pic" CACHE STRING "Target platform (e.g., PIC, WINDOWS)")

    message("-- Building for PIC target")
else()
    message(FATAL_ERROR "TARGET_PLATFORM must be pic")
endif()

project(${ProjectName} C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Define your executable name and the source file(s)
add_executable(${ProjectName} main.c)


#bin2hex(${ProjectName})
