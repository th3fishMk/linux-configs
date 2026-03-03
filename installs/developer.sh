#!/bin/bash
# This commands assume that the distro being use is Fedora or fedora based
# Run `chmod u+x developer.sh`
# And then `sh developer.sh`
# Install almost all the developer tools needed to do all the things

echo "Today is " "$(date)"
echo "Installing all the dev things"

sudo dnf clean all
sudo dnf -y update

# Base
sudo dnf install @c-development @virtualization @development-tools mscore-fonts-all

# vscodium
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h\n" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

# zed
curl -f https://zed.dev/install.sh | sh

# vscode
# sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
# echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
# dnf check-update
# sudo dnf install code

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

# pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
# pnpm add -D @tauri-apps/cli@latest

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

# biome binary
# curl -L https://github.com/biomejs/biome/releases/download/@biomejs/biome@2.2.6/biome-linux-x64 -o biome
# chmod +x biome
