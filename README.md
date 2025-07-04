# Mullvad VPN CLI Toolkit

Ein minimalistisches Bash-Toolkit zur komfortablen Steuerung von Mullvad OpenVPN-Verbindungen über die Kommandozeile. Kein GUI, keine Ablenkung – nur klare Kontrolle.

## 💡 Motivation

OpenVPN über die CLI zu starten ist oft umständlich. Dieses Tool ersetzt langatmige Konfigurationsaufrufe durch einfache Befehle wie `vpn on`, `vpn off` oder `vpn rotate -de`. Ideal für Power-User, Terminal-Fans, CTF-Teilnehmer oder Server-Umgebungen ohne GUI.

## 🔧 Features

- `vpn on` – VPN-Verbindung starten
- `vpn off` – VPN trennen, Prozesse beenden
- `vpn status` – Aktuellen VPN-Status (tun0, Exit-IP, DNS) anzeigen
- `vpn rotate` – Zufällige oder gezielte Serververbindung (z. B. `vpn rotate -us`)
- `vpn patch` – Patcht alle `.conf`-Dateien im angegebenen Verzeichnis und speichert den Pfad
- `vpn help` – Hilfe anzeigen (`-v` für ausführliche Doku)

## 🚀 Schnellstart

```bash
sudo mv vpn /usr/local/bin/vpn
sudo chmod +x /usr/local/bin/vpn
vpn patch       # einmalig: fragt nach Pfad zu deinen Mullvad .conf-Dateien
vpn on          # startet VPN-Verbindung im Hintergrund
vpn status      # prüft Verbindung & Exit-IP
vpn off         # trennt VPN
```

## 🌍 Voraussetzungen

- Linux-System mit:
  - `bash`, `curl`, `sudo`, `openvpn`, `systemd-resolved`
  - optional: `jq` für hübsche IP-Darstellung
  - getestet unter **Ubuntu 24.04 LTS**
- Konfigurationsdateien von [Mullvad.net](https://mullvad.net/) im OpenVPN-Format

## 📦 Beispiel

```bash
vpn rotate -de     # rotiert IP zufällig nach Deutschland
vpn rotate -cs     # zeigt verfügbare Länder
vpn rotate -CF ~/vpn/mullvad  # setzt Standardverzeichnis dauerhaft
```

## 🛠️ Patching

Das erste Setup erfordert:

```bash
vpn patch
```

Dabei werden alle `.conf`-Dateien auf `script-security`, MTU, Gateway-Routing etc. angepasst.

## 📝 Lizenz

MIT License – siehe [LICENSE](LICENSE)

---

**Erstellt von Riswan Hassen – 2025**  
*„Because Bash is beautiful.“*
