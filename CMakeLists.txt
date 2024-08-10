cmake_minimum_required(VERSION 3.10)
project(MyEmbeddedProject C)

# Set the C standard
set(CMAKE_C_STANDARD 99)

# Include the src directory for headers
include_directories(${CMAKE_SOURCE_DIR}/inc)

# Enable coverage flags
if(CMAKE_C_COMPILER_ID MATCHES "GNU|Clang")
    add_compile_options(--coverage)
    add_link_options(--coverage)
endif()

# Add the source files
add_library(my_module src/my_module.c)

# Add the test directory
add_subdirectory(test)
