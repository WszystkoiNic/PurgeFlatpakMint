# 🧹 PurgeFlatpak for Linux Mint
> Remove Flatpak completely without breaking the Software Manager

![MIT](https://img.shields.io/badge/license-GPLv3-blue.svg) ![Made with Bash](https://img.shields.io/badge/made%20with-bash-1f425f.svg)

## 🔥 What is this?

**PurgeFlatpak for Mint** is a simple shell script that removes Flatpak entirely from your Linux Mint system — **without breaking the Software Manager**.

It’s designed for anyone who doesn't use Flatpaks, but wants to avoid any errors!

## ✅ What it does:

- Installs Flatpak temporarily (if not installed)
- Backs up `/var/lib/flatpak/repo` so Software Manager keeps working
- Uninstalls all Flatpaks, deletes remotes and cleans up all Flatpak traces
- Restores the repo to satisfy Software Manager's dependency
- Restarts required services (if possible)

## 📦 Installation & Usage

```bash
git clone https://github.com/WszystkoiNic/PurgeFlatpakMint.git
cd PurgeFlatpakMint
chmod +x PurgeFlatpak.sh
sudo ./PurgeFlatpak.sh
```
> ⚠️ **You will need `sudo` access.**

## 🧪 Tested on

- ✅ **Linux Mint 21.3 Cinnamon**
- ✅ **Linux Mint 22.1 Cinnamon**
- ✅ Works with and without Flatpak preinstalled

---

## 🛠 License

This project is licensed under the **GNU GPL v3**.  
See the [LICENSE](./LICENSE) file for details.

---

Made with love and commitment by **WiN** 🖤
