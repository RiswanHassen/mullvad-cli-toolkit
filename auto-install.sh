#!/bin/bash

set -e



echo
echo "🔐 Starte automatische Installation des Mullvad CLI Toolkit..."
echo

# Voraussetzungen prüfen
for dep in curl git sudo bash; do
    if ! command -v "$dep" &>/dev/null; then
        echo "❌ Abhängigkeit '$dep' fehlt. Bitte installieren und erneut versuchen."
        exit 1
    fi
done

# Temp-Verzeichnis
TMPDIR=$(mktemp -d)
cd "$TMPDIR"
git clone https://github.com/RiswanHassen/mullvad-cli-toolkit.git
cd mullvad-cli-toolkit

# Binary installieren
sudo cp vpn /usr/local/bin
sudo chmod +x /usr/local/bin/vpn

# Autostart-Berechtigungen reparieren
mkdir -p "$HOME/.config/autostart"
sudo chown -R "$USER:$USER" "$HOME/.config/autostart"

# Patch ausführen
vpn patch

# Hilfe anzeigen
vpn help

echo
echo "✅ Installation abgeschlossen."
