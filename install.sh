#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Claude Code config from dotfiles-coder..."

mkdir -p ~/.claude/plugins

# Symlink CLAUDE.md and settings.json
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

# Copy subagent-catalog slash command
mkdir -p ~/.claude/commands
cp -r "$DOTFILES_DIR/.claude/commands/subagent-catalog" ~/.claude/commands/
echo "  Copied commands/subagent-catalog"

# Copy plugin manifests (not symlinked — paths are machine-specific)
cp "$DOTFILES_DIR/.claude/plugins/installed_plugins.json" ~/.claude/plugins/installed_plugins.json
echo "  Copied plugins/installed_plugins.json"

# Generate known_marketplaces.json with correct $HOME for this machine
cat > ~/.claude/plugins/known_marketplaces.json <<EOF
{
  "claude-plugins-official": {
    "source": { "source": "github", "repo": "anthropics/claude-plugins-official" },
    "installLocation": "$HOME/.claude/plugins/marketplaces/claude-plugins-official"
  },
  "voltagent-subagents": {
    "source": { "source": "github", "repo": "VoltAgent/awesome-claude-code-subagents" },
    "installLocation": "$HOME/.claude/plugins/marketplaces/voltagent-subagents"
  }
}
EOF
echo "  Generated plugins/known_marketplaces.json"

# Install volt agent plugins via claude CLI if available
if command -v claude &>/dev/null; then
  echo "  Registering voltagent-subagents marketplace..."
  claude plugin marketplace add VoltAgent/awesome-claude-code-subagents 2>/dev/null \
    && echo "  ✓ marketplace registered" \
    || echo "  ✓ marketplace already registered (skipped)"

  echo "  Installing volt agent plugins..."

  VOLT_PLUGINS=(
    "voltagent-lang@voltagent-subagents"
    "voltagent-infra@voltagent-subagents"
    "voltagent-core-dev@voltagent-subagents"
    "voltagent-qa-sec@voltagent-subagents"
    "voltagent-data-ai@voltagent-subagents"
    "voltagent-dev-exp@voltagent-subagents"
    "voltagent-domains@voltagent-subagents"
    "voltagent-biz@voltagent-subagents"
    "voltagent-meta@voltagent-subagents"
    "voltagent-research@voltagent-subagents"
  )

  for plugin in "${VOLT_PLUGINS[@]}"; do
    echo "    Installing $plugin..."
    claude plugin install "$plugin" --yes 2>/dev/null && echo "    ✓ $plugin" || echo "    ✗ $plugin (skipped)"
  done
else
  echo "  claude CLI not found — skipping plugin install (will install on first claude run)"
fi

echo "Done."
