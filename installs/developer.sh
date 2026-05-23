#!/bin/bash

echo "Today is " "$(date)"
echo "Configuring secure, minimal development environment..."

sudo dnf clean all
sudo dnf -y update

# Enable RPM fusion for clean hardware acceleration codecs
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Install essential dev libs, virtualization, and base system tools
sudo dnf install -y @c-development @virtualization @development-tools \
    mscore-fonts-all gparted gnome-disks fastfetch openssl-devel \
    curl wget file htop tldr jq shellcheck \
    webkit2gtk4.1-devel libappindicator-gtk3-devel librsvg2-devel \
    libxdo-devel

# @c-development: Group package installing the GCC C compiler, standard headers, and glibc libraries.
# @virtualization: Group package installing QEMU, KVM, and libvirt tools to run hardware-accelerated virtual machines.
# @development-tools: Group package providing foundational automation build tools like make, automake, patch, and diff.
# mscore-fonts-all: Installs Microsoft Core TrueType fonts (Arial, Times New Roman) to fix website and document rendering breaks.
# gparted: A graphical partition editor used to format, resize, and manage drive partition layouts safely.
# gnome-disks: A native utility to inspect hard drive S.M.A.R.T attributes, mount volumes, and benchmark disks.
# fastfetch: A lightweight, high-performance C-based tool that prints your system hardware configuration and logo in the terminal.
# openssl-devel: The development files and headers required to compile programs that secure connections via SSL/TLS encryption.
# curl: A command-line tool used to safely download data and communicate with servers using web protocols.
# wget: A simple terminal file downloader that supports background processing and recursive directory downloading.
# file: A low-level security utility that reads a file's raw magic bytes to tell you its true file type, regardless of its extension.
# htop: An interactive, colorful, real-time process manager allowing you to monitor CPU cores, RAM usage, and kill frozen tasks.
# tldr: A community-driven helper that replaces dense manual pages with brief, practical command usage examples.
# jq: A lightning-fast, native C command-line engine used to format, filter, and extract data from JSON files.
# shellcheck: A static analysis tool that automatically scans shell scripts to find syntax errors, bugs, and dangerous security vulnerabilities.
#
# Brave Browser
curl -fsS https://dl.brave.com/install.sh | sh

# Zed Editor
curl -f https://zed.dev/install.sh | sh

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
cargo install create-tauri-app --locked

# Create a tauri app:
# cargo create-tauri-app

echo -e "\n========================================================="
