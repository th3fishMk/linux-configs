#!/bin/bash

sudo dnf4 group install multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group install -y sound-and-video
sudo dnf install libva-nvidia-driver
