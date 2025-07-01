# PurgeFlatpak for Mint - Purge Flatpaks WITHOUT breaking Software Manager!
# (c) 2025 Wszystko i Nic
# License: GNU GPL v3 (https://www.gnu.org/licenses/gpl-3.0.html)
#
# This script is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This script is distributed WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

#!/bin/bash
set -e  # Stop if errors occur

echo "✅ Installing Flatpak temporarily..."
sudo apt install flatpak -y

echo "📦 Copying Flatpak's repo..."
sudo cp -r /var/lib/flatpak/repo ~/flatpak_repo_backup

echo "🔥 Let's purge this shit..."
flatpak uninstall --all -y || true
flatpak remote-delete --system --user flathub || true
flatpak uninstall --unused -y || true
flatpak uninstall --system --all -y || true
flatpak uninstall --user --all -y || true

echo "🧼 Uninstaling Flatpak..."
sudo apt purge flatpak -y
sudo apt autoremove --purge -y

rm -rf ~/.var/app
rm -rf ~/.local/share/flatpak
rm -rf ~/.cache/flatpak
rm -rf ~/.config/flatpak
sudo rm -rf /var/lib/flatpak
sudo rm -rf /etc/flatpak

echo "♻️ Fixing Software Manager's Flatpak dependency..."
sudo mkdir -p /var/lib/flatpak
sudo mv ~/flatpak_repo_backup /var/lib/flatpak/repo

echo "♻️ Restarting Services to avoid errors..."
sudo systemctl --user reset-failed
sudo systemctl --user daemon-reexec 

echo "✅ Done. Flatpak fucked, Software Manager saved!"
