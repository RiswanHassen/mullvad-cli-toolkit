#!/bin/bash

echo "🧹 VPN CLI Toolkit wird entfernt..."

# 1. Binärdatei entfernen
if [[ -f /usr/local/bin/vpn ]]; then
    echo "🗑 Entferne /usr/local/bin/vpn"
    sudo rm /usr/local/bin/vpn
fi

# 2. Benutzerkonfiguration löschen
if [[ -f "$HOME/.vpnrotate.conf" ]]; then
    echo "🗑 Entferne $HOME/.vpnrotate.conf"
    rm "$HOME/.vpnrotate.conf"
fi

# 3. Autostart-Datei entfernen
if [[ -f "$HOME/.config/autostart/vpncli.desktop" ]]; then
    echo "🗑 Entferne Autostart-Datei"
    rm "$HOME/.config/autostart/vpncli.desktop"
fi

# 4. Systemd-Service entfernen
if [[ -f /etc/systemd/system/vpncli.service ]]; then
    echo "🗑 Entferne systemd-Service"
    sudo systemctl disable vpncli.service
    sudo rm /etc/systemd/system/vpncli.service
    sudo systemctl daemon-reload
fi

# 5. Statusdatei mit persistenten Einstellungen löschen
if [[ -f "$HOME/.vpncli.state" ]]; then
    echo "🗑 Entferne $HOME/.vpncli.state"
    rm "$HOME/.vpncli.state"
fi


echo "✅ VPN CLI Toolkit wurde entfernt."
