# µTimer (utimer)

µTimer (pronounced "micro-timer") is a command-line multifunction timer for Linux.  
It supports three modes: **timer**, **countdown**, and **stopwatch**, with flexible time input and scripting support.

Originally created by Arnaud Soyez, this project is now maintained and modernized by Artur Ladka to support modern Linux systems (GCC 14, GLib 2.84+, etc).

## 💡 Features

- Timer: count up to a specified time
- Countdown: count down from a time to zero
- Stopwatch: run indefinitely until stopped
- Flexible CLI time input (e.g. `1h30m45s300ms`)
- Quiet mode, test mode, and script-friendly

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
- `glib-2.0`
- `autotools`
- `intltool`

To compile:

```bash
./configure
make
sudo make install
```

If `./configure` fails, try:

```bash
./autogen.sh
./configure && make
```

To run tests:

```bash
make test
```

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
