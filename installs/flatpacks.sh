#!/bin/bash
# flatpack
# run `sh ./flatpacks.sh` to install all the following programs

flatpak install -y flathub com.belmoussaoui.Authenticator
flatpak install -y flathub com.belmoussaoui.Decoder
flatpak install -y flathub io.gitlab.librewolf-community
flatpak install -y flathub org.chromium.Chromium
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub org.kde.haruna
flatpak install -y flathub org.kde.krita
flatpak install -y flathub org.onlyoffice.desktopeditors

# The following apps are excluded for whatever reason

# flatpak install -y flathub dev.mufeed.Wordbook
# flatpak install -y flathub org.gnome.Crosswords.Editor
# flatpak install -y flathub org.gnome.Mines
# flatpak install -y flathub org.gnome.Crosswords
# flatpak install -y flathub org.gnome.Chess
# flatpak install -y flathub io.github.sepehr_rs.Sudoku
# flatpak install -y flathub org.gnome.Mahjongg
# flatpak install -y flathub com.github.hugolabe.Wike
# flatpak install -y flathub com.obsproject.Studio # Changed installation to dnf instead
# flatpak install -y flathub com.google.AndroidStudio
# flatpak install -y flathub com.spotify.Client
# flatpak install -y flathub org.mozilla.firefox
# flatpak install -y flathub org.telegram.desktop
# flatpak install -y flathub org.videolan.VLC
# flatpak install -y flathub page.codeberg.lo_vely.Nucleus
