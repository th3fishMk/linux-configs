#!/bin/bash
# This commands assume that the distro being use is Fedora or fedora based
# And then `sh developer.sh`
# Install developer tools for system, desktop, and Rust development

echo "Today is " "$(date)"
echo "Installing tools..."

sudo dnf clean all
sudo dnf -y update

# Enable RPM fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Base Libraries & Virtualization
sudo dnf install -y @c-development @virtualization @development-tools mscore-fonts-all

# System Tools & Desktop Apps
sudo dnf install gparted \
    gnome-disks \
    steam \
    fastfetch \
    blender \
    openssl-devel \
    curl \
    wget \
    file \
    -y

# Brave Browser
curl -fsS https://dl.brave.com/install.sh | sh

# Zed Editor
curl -f https://zed.dev/install.sh | sh

# Rust Toolchain (rustc, cargo, etc.)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
