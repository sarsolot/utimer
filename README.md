# µTimer (utimer)

µTimer (pronounced "micro-timer") is a command-line multifunction timer for Linux.  
It supports four modes: **timer**, **countdown**, **stopwatch**, and **clock** (with optional milliseconds), with flexible time input and scripting support.

Originally created by Arnaud Soyez, this project is now maintained and modernized by Artur Ladka to support modern Linux systems (GCC 14, GLib 2.84+, etc).

## 💡 Features

- Timer: count up to a specified time
- Countdown: count down from a time to zero
- Stopwatch: run indefinitely until stopped
- Clock: display current system time in HH:MM:SS format, optionally with milliseconds
- Flexible CLI time input (e.g. `1h30m45s300ms`)
- Quiet mode, test mode, and script-friendly
- Clean autotools build system with out-of-tree build support
- Modern GCC and GLib compatibility (GCC 14+, GLib 2.84+)

## 📦 Installation

### Ubuntu (via PPA)

You can install the latest release from the maintainer's Launchpad PPA:

```bash
sudo add-apt-repository ppa:sarsolot/utimer
sudo apt update
sudo apt install utimer
```

🔗 [PPA Homepage](https://launchpad.net/~sarsolot/+archive/ubuntu/utimer)

### Build from Source

Requirements:
- `glib-2.0` (with `gobject` and `gthread`)
- `gio-unix-2.0`
- `autoconf`
- `automake`
- `libtool`
- `intltool`
- `gettext`

#### For Ubuntu/Debian:
```bash
sudo apt install build-essential autoconf automake libtool intltool libglib2.0-dev gettext
```

#### For Arch Linux:
```bash
sudo pacman -S base-devel autoconf automake libtool intltool gettext glib2
```

#### Build instructions:

**Option 1: Quick build (recommended)**
```bash
# Prepare, configure, and build in one step
./build.sh

# The binary will be at: build/src/utimer
./build/src/utimer --version

# To install
cd build && sudo make install

# To clean
./build.sh clean
```

**Option 2: Manual build**
```bash
# Generate the build system
./autogen.sh

# Out-of-tree build (recommended)
mkdir build
cd build
../configure
make -j$(nproc)

# Or in-tree build
./configure
make -j$(nproc)

# Install
sudo make install
```

To run tests:

```bash
# After building with ./build.sh or make
make check

# Or run tests directly
cd build/src/tests && ./maintests
```

## 🛠️ Development

This project uses a **minimal source approach**:
- Only source files are tracked in git
- Generated files (configure, Makefile.in, etc.) are excluded via `.gitignore`
- Developers run `./autogen.sh` to generate the build system
- Release tarballs include all generated files for end users

### Development Workflow

```bash
# 1. Generate build system (first time only)
./autogen.sh

# 2. Build and test
./build.sh

# 3. Run tests
make check

# 4. Make changes to source files
# 5. Rebuild
make -C build

# 6. Test changes
cd build/src/tests && ./maintests
```

### Creating Release Tarballs

```bash
# Generate distribution tarball (includes all generated files)
./release.sh

# This runs:
# - ./autogen.sh
# - ./configure
# - make distcheck (builds, tests, and packages)
```

The release tarball can be distributed to end users who don't need autotools installed.

## 🚀 Usage

### Timer mode:

```bash
utimer --timer 10m30s
```

### Countdown mode:

```bash
utimer --countdown 2m15s
```

### Stopwatch mode:

```bash
utimer --stopwatch
```

### Clock mode:

```bash
utimer --clock              # Shows: 10:21:00
utimer --clock --milliseconds  # Shows: 10:21:09.405
# Or use short form:
utimer -k -m               # Shows: 10:21:09.405
```

Valid time suffixes:
- `ms`: milliseconds
- `s`: seconds
- `m`: minutes
- `h`: hours
- `d`: days

Use it in scripts:

```bash
utimer -t 10m && echo "Time's up!"
```

## 🐞 Bug Reports

Please report bugs or issues via GitHub:

🔗 [https://github.com/sarsolot/utimer/issues](https://github.com/sarsolot/utimer/issues)

## 👥 Authors and Maintainers

- **Arnaud Soyez** <weboide@codealpha.net>
  *Original author (2008–2009)*

- **Artur Ladka** <arturladka@gmail.com>
  *Maintainer (2025–present) — modernization and Ubuntu packaging*  
  GitHub: [@sarsolot](https://github.com/sarsolot)

## 🪪 License

This project is licensed under the terms of the [GNU General Public License v3 or later](LICENSE).  
This is free software: you are free to use, modify, and redistribute it under the same terms.

## 🔗 Links

- GitHub Repo: [https://github.com/sarsolot/utimer](https://github.com/sarsolot/utimer)
- PPA for Ubuntu: [https://launchpad.net/~sarsolot/+archive/ubuntu/utimer](https://launchpad.net/~sarsolot/+archive/ubuntu/utimer)
