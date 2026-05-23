#!/bin/bash
#!/bin/bash
# Desktop setup script for regular personal/daily use apps on Fedora
# Usage: sh ./personal_apps.sh

echo "Today is $(date)"
echo "Configuring your personal desktop application layer..."

# ---------------------------------------------------------------------
# 1. PREREQUISITES & FLATHUB REPOSITORY SETUP
# ---------------------------------------------------------------------
echo -e "\n--> Verifying Flatpak and adding Flathub repository..."
# Ensures the Flathub remote server is configured so Flatpak knows where to fetch the apps
sudo dnf install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# ---------------------------------------------------------------------
# 2. SYSTEM RPM PACKAGES
# ---------------------------------------------------------------------
echo -e "\n--> Installing native multimedia codecs and host system apps..."

# Enable RPM Fusion if not already done (required for clean, hardware-accelerated media)
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm

# Native Steam Installation (Preferred over Flatpak on Fedora for cleaner
# access to system drives, controllers, and custom Proton runtime paths)
sudo dnf install -y steam meld

echo "Initializing Flatpak application suite installation..."

# List of active applications to deploy
APPS=(
    "org.onlyoffice.desktopeditors"
    "com.belmoussaoui.Authenticator"
    "com.belmoussaoui.Decoder"
    "io.gitlab.librewolf-community"
    "org.chromium.Chromium"
    "org.inkscape.Inkscape"
    "org.kde.haruna"
    "org.kde.krita"
    "org.onlyoffice.desktopeditors"
    "com.discordapp.Discord"
    "org.jousse.vincent.Pomodorolm"
    "io.github.peazip.PeaZip"
    "com.bitwarden.desktop"
    "org.audacityteam.Audacity"
    "fr.handbrake.HandBrake"
)

# Loop through and install each application sequentially
for APP in "${APPS[@]}"; do
    echo -e "\n--> Installing: $APP"
    flatpak install -y flathub "$APP"
done

echo -e "\n--> Cleaning package footprints and verifying structural integrity..."
sudo dnf clean all
flatpak uninstall --unused -y
echo -e "\n========================================================="
echo "PERSONAL APPLICATION SUITE IS ACTIVE!"
