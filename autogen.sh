#!/bin/sh
echo "========= Preparing uTimer ============"
# Add libtoolize first
echo "======== Running libtoolize ==========="
libtoolize --force --copy || exit 1

echo "======== Running autoreconf ==========="
autoreconf --force --install --verbose || exit 1

echo "======== Running intltoolize =========="
echo "(there may be no output, it's fine)"
intltoolize --copy --force --automake || exit 1

echo "=============== DONE ================="
echo "You can now build uTimer in two ways:"
echo ""
echo "In-tree build:"
echo "$ ./configure"
echo "$ make"
echo ""
echo "Out-of-tree build (recommended):"
echo "$ ./build.sh"
echo ""
echo "Then to install:"
echo "$ sudo make install"
echo "=============== EOF ================="

if [ ! -f ChangeLog ]; then
  echo "Creating empty ChangeLog..."
  echo "IMPORTANT: ChangeLog is only generated for dist packages (.tar.gz) from the bzr log."
  touch ChangeLog
fi