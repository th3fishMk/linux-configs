#!/bin/bash
# This commands assume that the distro being use is Fedora or fedora based
# And then `sh developer.sh`
# Install almost all the developer tools needed to do all the things

echo "Today is " "$(date)"
echo "Installing all the things"

sudo dnf clean all
sudo dnf -y update

# Enable RPM fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Base
sudo dnf install @c-development @virtualization @development-tools mscore-fonts-all

# All system install will be listed here
sudo dnf install gparted \
    gnome-disks \
    fastfetch \
    steam \
    fastfetch \
    -y

# Brave
curl -fsS https://dl.brave.com/install.sh | sh

# vscodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

# zed
curl -f https://zed.dev/install.sh | sh

# Download and install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Download and install nvm and node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
node -v
npm -v

# Node global tools
npm install -g pnpm
npm install -g typescript
# npm install -g yo generator-code
# npm install -g @vscode/vsce

# Tauri dependencies
sudo dnf check-update
sudo dnf install webkit2gtk4.1-devel \
    openssl-devel \
    curl \
    wget \
    file \
    libappindicator-gtk3-devel \
    librsvg2-devel \
    libxdo-devel
