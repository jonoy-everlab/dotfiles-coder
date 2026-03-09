#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Claude Code config from dotfiles-coder..."

mkdir -p ~/.claude

# Symlink CLAUDE.md and settings.json so updates to the repo reflect immediately
for file in CLAUDE.md settings.json; do
  src="$DOTFILES_DIR/.claude/$file"
  dest="$HOME/.claude/$file"

  if [ -f "$dest" ] && [ ! -L "$dest" ]; then
    echo "  Backing up existing $file → $dest.bak"
    mv "$dest" "$dest.bak"
  fi

  ln -sf "$src" "$dest"
  echo "  Linked ~/.claude/$file"
done

echo "Done."
