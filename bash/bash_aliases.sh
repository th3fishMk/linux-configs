# System Management
alias reSource="source ~/.bashrc"
alias ll="ls -la --color=auto"

# Version Control
alias g="git"
alias update-dotfiles="cd \$HOME/.dotfiles && git pull && cd -"

# Package Management & Maintenance
alias update="sudo dnf upgrade --refresh -y"

sysUp() {
    echo "=== Starting System Update ==="

    echo "--- Checking DNF Packages ---"
    sudo dnf upgrade --refresh -y
    echo "+++ DNF update complete"

    if command -v flatpak &> /dev/null; then
        echo "--- Checking Flatpak Packages ---"
        flatpak update -y
        echo "+++ Flatpak update complete"
    fi

    echo "--- Cleaning Up System Tmp/Cache ---"
    sudo dnf autoremove -y

    echo "=== All updates finished successfully ==="
}
