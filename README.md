## 🚀 Schnellstart

```bash
curl -sL https://raw.githubusercontent.com/RiswanHassen/mullvad-cli-toolkit/main/auto-install.sh | bash
```

> ⚠️ Dieses Kommando lädt das Toolkit herunter, installiert es systemweit und führt automatisch `vpn patch` aus.  
> 🛡️ Empfohlen für fortgeschrittene Linux-User mit `bash`, `systemd` und `OpenVPN`.

---

# 🛡️ Mullvad CLI Toolkit – Projektbeschreibung & Entwicklungsverlauf (Stand: Juli 2025)

## 🪪 Kurzbeschreibung

> 🛡️ A privacy-focused, zero-bloat VPN control toolkit for Mullvad under Linux.  
> Includes quick connect, country-based rotation, randomized switching, autostart, autorotation, and DNS/IP status – all in one elegant Bash script.

---

## 🧽 Projektverlauf

### 📍 Ursprungsidee

Die Idee entstand aus einem klaren Bedarf:
> Mullvad OpenVPN-Konfigurationen sind solide, aber für die tägliche Nutzung zu umständlich – besonders bei häufigem Serverwechsel oder gezielten IP-Rotationen.  
Ziel war es, eine **minimalistische, CLI-basierte Lösung** zu entwickeln, die ohne GUI und ohne externe Abhängigkeiten auskommt, aber dennoch:
- schnell VPN-Verbindungen aufbauen kann
- Rotation zwischen Servern und Ländern erlaubt
- den Status (DNS, IP, Interface, Autostart, Rotation) übersichtlich darstellt
- Konfigurationsdateien automatisch patcht

---

## 🔧 Features

- `vpn on/off` – Startet oder trennt die VPN-Verbindung
- `vpn rotate` – Zufällige oder länderspezifische Rotation der Exit-IP
- `vpn random` – Aktiviert/Deaktiviert Zufallsrotation
- `vpn autorotate <min>` – Automatische Rotation im Hintergrund (im Sekundentakt herunterzählend)
- `vpn autostart` – Autostart beim Login oder systemweit (toggle)
- `vpn patch` – Konfigurationsdateien automatisch vorbereiten (MTU, DNS etc.)
- `vpn status` – Exit-IP, DNS-Interface, Autostart-Status, Rotationseinstellungen
- `vpn uninstall` – Entfernt das Toolkit rückstandslos
- `vpn help` – Übersicht aller Befehle & Flags

---

## 💡 Designentscheidungen

- **Single-Binary CLI** (`vpn`) statt Einzelskripte – einfache Installation & intuitive Nutzung
- **Statuswerte persistent** – Settings wie `random`, `autorotate`, `autostart` bleiben erhalten
- **Keine externen Tools außer `jq`, `curl`, `resolvectl`, `systemd` und `gnome-terminal`**
- **Failsafe-Mechanismen** – automatische Erkennung, wenn `tun0` nicht aktiv ist, mit Fallback-Logs
- **Autostart-Fenster bleibt geöffnet** – inkl. Anzeige von `vpn status` direkt nach Start
- **Terminal-Fenster wird nur bei aktivem VPN geöffnet** – vermeidet nutzlose Statusausgabe bei Boot

---

## 📦 Installer

Mitgeliefert wird ein robustes `install-vpn.sh`:
- prüft Abhängigkeiten
- installiert das Tool systemweit nach `/usr/local/bin`
- setzt Rechte korrekt
- konfiguriert `.desktop` oder `systemd` für Autostart
- ruft nach Installation automatisch `vpn patch` auf
- zeigt Release Notes

---

## ✅ Zielsysteme

> 📦 Unterstützt:
- Ubuntu 22.04+ & 24.04+
- Debian 12+
- Pop!_OS, Linux Mint (Ubuntu-basiert)

> ⚠️ Eingeschränkt oder ungeeignet:
- ❌ Arch, Void, Alpine (kein `systemd`, manuelle Anpassung nötig)
- ❌ macOS, Windows

---

## 👤 Zielgruppe

### ✅ Perfekt für:
- Terminal-affine Linux-Nutzer:innen
- OSINT-Analyst:innen, Scraper, Red Teamer
- Developer mit Fokus auf Privacy & Automation

### ❌ Nicht gedacht für:
- Nutzer:innen, die lieber GUI-basierte VPN-Lösungen verwenden
- Systeme ohne `systemd`, `bash`, `openvpn`, `resolvectl`

---

## 🏷️ Tags / Topics

```bash
bash vpn privacy openvpn mullvad linux-cli osint scraping rotating-ip gnu-linux redteam automation
```
