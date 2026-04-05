#!/usr/bin/env bash
# Installs userspace tools on a fresh Debian/Ubuntu machine.
set -euo pipefail

apt_install() {
  dpkg -s "$1" &>/dev/null || sudo apt-get install -y "$1"
}

sudo apt-get update -qq
apt_install bat
apt_install fastfetch
apt_install age

if ! command -v starship &>/dev/null; then
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
fi

if ! command -v zoxide &>/dev/null; then
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

if ! command -v fnm &>/dev/null; then
  curl -fsSL https://fnm.vercel.app/install | \
    bash -s -- --install-dir "$HOME/.local/share/fnm" --skip-shell
fi

echo "Tool installation complete. Reload shell to activate."
