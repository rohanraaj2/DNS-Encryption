# DNS-Encryption Toolkit

A collection of scripts and desktop shortcuts to easily toggle and manage DNS-over-TLS (DoT) and encrypted DNS providers on Linux (systemd-resolved) and Android.

## Features

- **Toggle DNS-over-TLS**: Enable/disable DoT on Linux with a single click.
- **Switch DNS Providers**: Choose between Cloudflare, Quad9, Google, or NextDNS.
- **Android Support**: Toggle Private DNS (DoT) on Android via ADB or automate reminders with Tasker.
- **Desktop Shortcuts**: One-click `.desktop` launchers for all major actions.

## Directory Structure

```
/scripts/                # Bash scripts for DNS toggling and switching
/desktop-shortcuts/      # .desktop files for GUI integration
/android/                # Android-specific automation (Tasker profile)
```

## Usage

### Linux

1. **Place scripts in `/scripts/` and make them executable:**
   ```bash
   chmod +x scripts/*.sh
   ```

2. **Copy `.desktop` files to your applications directory:**
   ```bash
   cp desktop-shortcuts/*.desktop ~/.local/share/applications/
   ```

3. **Run scripts directly or use the desktop shortcuts.**

### Android

- **scripts/toggle-android-dns.sh**: Requires ADB. Toggles Private DNS between off and Google DoT.
- **android/PrivateDNSToggleProfile.xml**: Import into Tasker to get WiFi-based Private DNS reminders.

## Requirements

- Linux with `systemd-resolved`
- `adb` for Android DNS toggling
- Tasker (for Tasker profile)

## Security

- Scripts require `sudo` to modify `/etc/systemd/resolved.conf`.
- Review scripts before use.
