#!/bin/bash

set -e


echo
echo "🔐 Mullvad CLI Toolkit Installer"
echo "--------------------------------"
echo "Dieses Skript wird die folgenden Schritte ausführen:"
echo
echo "1. Prüft, ob alle erforderlichen Pakete (curl, git, bash, sudo) installiert sind"
echo "2. Klont das GitHub-Repository: https://github.com/RiswanHassen/mullvad-cli-toolkit"
echo "3. Kopiert die Datei 'vpn' nach /usr/local/bin"
echo "4. Setzt die nötigen Berechtigungen"
echo "5. Repariert ggf. Besitzrechte von ~/.config/autostart"
echo "6. Führt 'vpn patch' aus, um deine Mullvad-Konfigurationsdateien zu registrieren"
echo "7. Zeigt dir die aktuellen Release Notes"
echo
read -rp "❓ Möchtest du fortfahren? (ja/nein): " confirm
if [[ "$confirm" != "ja" ]]; then
    echo "❌ Abgebrochen vom Benutzer."
    exit 1
fi


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
