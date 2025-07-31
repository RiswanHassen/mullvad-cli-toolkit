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

# 5. Optional: Projektordner entfernen (vorerst auskommentiert)
#read -p "❓ Möchtest du auch den Projektordner löschen? (y/N): " confirm
#if [[ "$confirm" =~ ^[Yy]$ ]]; then
#    read -p "🗂 Gib den Pfad zum Projektordner ein: " project_path
#    if [[ -d "$project_path" ]]; then
#        echo "🗑 Lösche $project_path..."
#        rm -rf "$project_path"
#    else
#        echo "⚠️ Pfad '$project_path' existiert nicht oder ist kein Verzeichnis."
#    fi
#fi

# 6. Persistente Einstellungen löschen
VPNDIR="$HOME/.vpncli"
echo "🔍 Prüfe, ob $VPNDIR existiert..."
if [[ -d "$VPNDIR" ]]; then
    echo "🗑 Entferne $VPNDIR"
    rm -rf "$VPNDIR"
else
    echo "ℹ️ Kein persistenter VPN-Statusordner gefunden ($VPNDIR)"
fi

# 7. Statusdatei mit persistenten Einstellungen löschen
if [[ -f ~/.vpncli.state ]]; then
    echo "🗑 Entferne ~/.vpncli.state"
    rm ~/.vpncli.state
fi


echo "✅ VPN CLI Toolkit wurde entfernt."
