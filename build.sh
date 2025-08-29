#!/bin/bash
set -e

echo "µTimer Build Script"
echo "=================="

# Check if we should clean first
if [[ "$1" == "clean" ]]; then
    echo "Cleaning build directory..."
    rm -rf build/
    echo "Cleaned."
    exit 0
fi

# Make sure autogen has been run
if [[ ! -f configure ]]; then
    echo "Running autogen.sh to prepare build system..."
    ./autogen.sh
fi

# Create build directory if it doesn't exist
mkdir -p build

echo "Configuring out-of-tree build in build/ directory..."
cd build
../configure

echo "Building with parallel jobs..."
make -j$(nproc)

echo ""
echo "Build completed successfully!"
echo "Binary is at: build/src/utimer"
echo ""
echo "To test: ./build/src/utimer --version"
echo "To install: cd build && sudo make install"
echo "To clean: $0 clean"
