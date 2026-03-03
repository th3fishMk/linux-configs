#!/bin/bash

# Run `chmod u+x user-programs.sh`
# And then `sh user-programs.sh`

# All system install will be listed here
sudo dnf install gparted \
    gnome-disks \
    fastfetch

# Steam
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

sudo dnf install steam -y

# Brave
curl -fsS https://dl.brave.com/install.sh | sh
