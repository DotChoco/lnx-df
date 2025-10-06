#!/usr/bin/env bash
set -euo pipefail

# Obtiene el directorio donde está el script actual
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ejecuta otro script que está en el mismo directorio
"$SCRIPT_DIR/GameDev/PSPinstall.sh"

ln -s "${SCRIPT_DIR}/config/.zshrc" ~/.zshrc
ln -s "${SCRIPT_DIR}/config/nvim/" ~/.config/nvim
ln -s "${SCRIPT_DIR}/config/zsh/" ~/.config/zsh
ln -s "${SCRIPT_DIR}/config/kitty/" ~/.config/kitty
ln -s "${SCRIPT_DIR}/config/tmux/" ~/.config/tmux

