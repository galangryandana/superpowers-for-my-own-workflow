#!/bin/bash

# Superpowers Installer for Droid CLI
# Usage: curl -fsSL https://raw.githubusercontent.com/galangryandana/superpowers-for-my-own-workflow/main/install.sh | bash

set -e

FACTORY_DIR="$HOME/.factory"
REPO_URL="https://github.com/galangryandana/superpowers-for-my-own-workflow.git"
TEMP_DIR=$(mktemp -d)

echo "Installing Superpowers for Droid CLI..."

# Clone repo
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null

# Create directories if not exist
mkdir -p "$FACTORY_DIR/skills" "$FACTORY_DIR/droids" "$FACTORY_DIR/commands"

# Copy folders
cp -r "$TEMP_DIR/skills/"* "$FACTORY_DIR/skills/"
cp -r "$TEMP_DIR/droids/"* "$FACTORY_DIR/droids/"
cp -r "$TEMP_DIR/commands/"* "$FACTORY_DIR/commands/"

# Cleanup
rm -rf "$TEMP_DIR"

echo "Superpowers installed successfully!"
echo ""
echo "Installed to: $FACTORY_DIR"
echo "  - skills/   (13 workflows)"
echo "  - droids/   (49 specialists)"
echo "  - commands/ (quick commands)"
