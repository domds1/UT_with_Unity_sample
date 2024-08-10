#!/bin/bash

# Set default build type to Debug if not provided
BUILD_DIR="build"

# Function to display usage
usage() {
    echo "Usage: $0 [command] [target] [build_type]"
    echo "Commands:"
    echo "  configure       - Configure the CMake build"
    echo "  build           - Build the project (specify target as argument)"
    echo "  clean           - Clean the build directory"
    echo "  rebuild         - Clean and rebuild the project"
    echo ""
    echo "Targets:"
    echo "  Specify the target you want to build:"
    echo "    all[default]  - Build the project"
    echo "    tests         - Run Unit tests"
    echo "    coverage      - Collect coverage infos and generate report"
    echo "    show_report   - Open coverage report in html"
    echo ""
    exit 1
}

configure(){
    if [ ! -d ${BUILD_DIR} ]; then
        echo "Configuring build in ${BUILD_DIR}..."
        mkdir -p ${BUILD_DIR}
    fi
    cmake -S . -B ${BUILD_DIR}
}

build(){
    if [ -z "$1" ]; then
        echo "Building default target in ${BUILD_DIR}..."
        cmake --build ${BUILD_DIR}
    else
        echo "Building target '$2' in ${BUILD_DIR}..."
        cmake --build ${BUILD_DIR} --target "$1"
    fi
}

clean(){
    echo "Cleaning build directory ${BUILD_DIR}..."
    rm -rf ${BUILD_DIR}
}
# Ensure a command is provided
if [ -z "$1" ]; then
    usage
fi

# Ensure cmake is installed
if ! command -v cmake &> /dev/null
then
    echo "CMake not found, please install it first."
    exit 1
fi

# Handle commands
case $1 in
    configure)
        configure
        ;;
    build)
        build $2
        ;;
    clean)
        clean
        ;;
    rebuild)
        echo "Rebuilding target '$2'..."
        clean
        configure
        build $2
        ;;
    show_report)
        echo "Opening coverage report..."
        xdg-open ${BUILD_DIR}/coverage_report/index.html
        ;;
    *)
        usage
        ;;
esac

