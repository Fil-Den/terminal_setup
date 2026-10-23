#!/usr/bin/env bash
# Symlink terminal setup (nvim, tmux, bin) into $HOME using GNU Stow.
# Safe to re-run: existing real files are backed up, existing links are left alone.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES=(nvim tmux bin)
TS="$(date +%Y%m%d%H%M%S)"

info() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33m!!\033[0m %s\n' "$*"; }

# 1. Ensure stow is installed
if ! command -v stow >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    info "Installing stow via Homebrew"
    brew install stow
  elif command -v apt-get >/dev/null 2>&1; then
    info "Installing stow via apt"
    sudo apt-get install -y stow
  else
    warn "GNU Stow not found. Install it and re-run."
    exit 1
  fi
fi

# 2. Back up real files/dirs that would conflict with the links
# Paths (relative to $HOME) each package will link, e.g. .config/nvim, .tmux.conf, .local/bin/<script>
package_targets() {
  local pkg="$1"
  cd "$DOTFILES/$pkg"
  case "$pkg" in
    nvim) echo ".config/nvim" ;;
    bin)  find .local/bin -type f ! -name .gitkeep ;;
    tmux) echo ".tmux.conf"; echo ".config/tmux-session" ;;
    *)    find . -mindepth 1 -maxdepth 1 ! -name '.stow-local-ignore' | sed 's|^\./||' ;;
  esac
}

backup_conflicts() {
  local rel target
  while IFS= read -r rel; do
    target="$HOME/$rel"
    if [[ -e "$target" && ! -L "$target" ]]; then
      info "Backing up $target -> $target.bak.$TS"
      mv "$target" "$target.bak.$TS"
    fi
  done < <(package_targets "$1")
}

mkdir -p "$HOME/.config" "$HOME/.local/bin"

for pkg in "${PACKAGES[@]}"; do
  backup_conflicts "$pkg"
  info "Stowing $pkg"
  stow --dir="$DOTFILES" --target="$HOME" --restow "$pkg"
done

# 3. Make scripts executable
find "$DOTFILES/bin/.local/bin" -type f ! -name .gitkeep -exec chmod +x {} +

# 4. tmux plugin manager, only if the config uses it
if grep -q 'tmux-plugins/tpm' "$DOTFILES/tmux/.tmux.conf" && [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  info "Installing TPM"
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# 5. PATH check
case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *) warn "~/.local/bin is not on your PATH. Add: export PATH=\"\$HOME/.local/bin:\$PATH\"" ;;
esac

info "Done. Open nvim to let lazy.nvim install plugins."
