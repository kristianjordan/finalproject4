project(SAMPLELLVMPASS)
cmake_minimum_required(VERSION 3.1)

set(ENV{LLVM_DIR} /home/kjord009/llvm-10.0.1.build/lib/cmake/llvm)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
find_package(LLVM REQUIRED CONFIG)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

add_library(solution1 MODULE
    solution1.cpp
)

set_target_properties(solution1 PROPERTIES
    COMPILE_FLAGS "-g -fno-rtti"
)

if(APPLE)
    set_target_properties(solution1 PROPERTIES
        LINK_FLAGS "-undefined dynamic_lookup"
    )
    set_target_properties(solution1 PROPERTIES
            LINK_FLAGS "-undefined dynamic_lookup"
            )
endif(APPLE)

