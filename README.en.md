# Mullvad VPN CLI Toolkit

A minimalist Bash toolkit for controlling Mullvad OpenVPN connections via terminal. No GUI, no distractions – just clean control.

## 💡 Motivation

Starting OpenVPN from the CLI is tedious. This tool replaces long `sudo openvpn --config ...` calls with simple commands like `vpn on`, `vpn off`, or `vpn rotate -de`.

Built for power users, Linux tinkerers, hackers, CTFs, servers and everyone who prefers terminal over buttons.

## 🔧 Features

- `vpn on` – start your VPN using the default config
- `vpn off` – kill all OpenVPN processes and clean tun0
- `vpn status` – show exit IP, tunnel interface, and DNS state
- `vpn rotate` – randomly select a Mullvad server, or specify by country
- `vpn patch` – prepare and normalize your `.conf` files
- `vpn help` – show usage overview (`-v` for full guide)

## 🚀 Quick Start

```bash
sudo mv vpn /usr/local/bin/vpn
sudo chmod +x /usr/local/bin/vpn
vpn patch          # one-time setup, specify your config folder
vpn on             # connect to VPN
vpn status         # verify status
vpn off            # disconnect VPN
```

## 🌍 Requirements

- A modern Linux system (tested: Ubuntu 24.04 LTS)
- Installed: `bash`, `openvpn`, `curl`, `resolvectl`, `jq` (optional)
- OpenVPN `.conf` files from [mullvad.net](https://mullvad.net/en/account/#/downloads)

## 🧪 Examples

```bash
vpn rotate -de       # pick random German exit
vpn rotate -cs       # show available countries
vpn rotate -CF path  # set default .conf folder permanently
vpn help             # usage
vpn help -v          # verbose documentation
```

## 🔐 First time? Run:

```bash
vpn patch
```

This script modifies `.conf` files to include routing, MTU fix, script-security etc.

## 📝 License

MIT License — see `LICENSE`

---

Created by [Riswan Hassen](https://github.com/RiswanHassen), 2025  
*"Because Bash is beautiful."*