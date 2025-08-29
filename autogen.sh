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
echo "You can now type these commands:"
echo "$ ./configure"
echo "$ make"
echo "$ sudo make install"
echo "And then uTimer should be installed!"
echo "=============== EOF ================="

if [ ! -f ChangeLog ]; then
  echo "Creating empty ChangeLog..."
  echo "IMPORTANT: ChangeLog is only generated for dist packages (.tar.gz) from the bzr log."
  touch ChangeLog
fi