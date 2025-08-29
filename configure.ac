AC_INIT([utimer], [0.5-2], [<https://github.com/sarsolot/utimer/issues>])
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

# Create m4 directory for macros
AC_CONFIG_MACRO_DIR([m4])

# Add libtool support
LT_INIT

AC_PROG_CC
AC_CONFIG_HEADERS([config.h])

PKG_CHECK_MODULES([GLIB],[glib-2.0 >= 2.16.6 gobject-2.0])
PKG_CHECK_MODULES([GIO], [gio-unix-2.0])
AC_CHECK_LIB(gthread-2.0, g_thread_init)
AC_CHECK_LIB(gobject-2.0, main)

# -- i18n --

# Replace obsolete AC_PROG_INTLTOOL with modern alternative
IT_PROG_INTLTOOL([0.37.1])
GETTEXT_PACKAGE=utimer
AC_SUBST(GETTEXT_PACKAGE)
AC_DEFINE_UNQUOTED(GETTEXT_PACKAGE,"$GETTEXT_PACKAGE", [Gettext package.])
if test "x${prefix}" = "xNONE"; then
  AC_DEFINE_UNQUOTED(LOCALEDIR, "${ac_default_prefix}/${DATADIRNAME}/locale", [Locale dir])
else
  AC_DEFINE_UNQUOTED(LOCALEDIR, "${prefix}/${DATADIRNAME}/locale", [Locale dir])
fi

# Replace AM_GLIB_GNU_GETTEXT with standard gettext macros
AM_GNU_GETTEXT([external])
AM_GNU_GETTEXT_VERSION([0.21])

# -- debug level --
AC_ARG_ENABLE(debug, [  --enable-debug=[no/minimal/yes]  turn on debugging (default=no)],,enable_debug=no)

AC_MSG_CHECKING([debug level])
if test "x$enable_debug" = "xyes"; then
  UT_DEBUG_FLAGS="-DG_ENABLE_DEBUG"
else
  if test "x$enable_debug" = "xno"; then
    UT_DEBUG_FLAGS="-DG_DISABLE_ASSERT -DG_DISABLE_CHECKS"
  fi
fi
AC_SUBST(UT_DEBUG_FLAGS)
AC_MSG_RESULT($enable_debug)

# -- -- --

AC_CONFIG_FILES([Makefile src/Makefile po/Makefile.in data/Makefile src/tests/Makefile])

AC_OUTPUT
