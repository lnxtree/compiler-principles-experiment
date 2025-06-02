project(SysYCompiler)

cmake_minimum_required(VERSION 3.5)

set(CMAKE_CXX_STANDARD 17)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -Wall -g -pedantic")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_definitions(-w)

include_directories(${CMAKE_CURRENT_BINARY_DIR})

include_directories(${CMAKE_CURRENT_SOURCE_DIR})
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/AST)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/IR)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/AST)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/IR)

add_executable(
        compiler
        main.cpp
)

target_link_libraries(
        compiler
        IRLIB
        ASTLIB
)
