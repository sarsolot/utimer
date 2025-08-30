#!/bin/bash
set -e

echo "µTimer Release Build Script"
echo "=========================="

# Check if we're in a clean git state (skip with --force)
if [[ "$1" != "--force" ]] && ! git diff-index --quiet HEAD --; then
    echo "WARNING: Git working directory is not clean."
    echo "Run with --force to proceed anyway, or commit changes first."
    exit 1
fi

# Make sure autogen has been run
if [[ ! -f configure ]]; then
    echo "Running autogen.sh to prepare build system..."
    ./autogen.sh
fi

# Create build directory if it doesn't exist
mkdir -p build

echo "Configuring for release build..."
cd build
../configure

echo "Running make distcheck (this will take a while)..."
make distcheck

echo ""
echo "Release build completed successfully!"
echo ""
echo "Distribution tarball created:"
ls -la *.tar.gz
echo ""
echo "This tarball can be uploaded to GitHub releases."
echo "Users can extract it and run: ./configure && make"
echo ""
echo "To test the tarball yourself:"
echo "  tar xf utimer-*.tar.gz"
echo "  cd utimer-*/"
echo "  ./configure && make"
