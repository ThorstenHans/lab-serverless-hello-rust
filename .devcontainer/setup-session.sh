#!/usr/bin/env bash
set -euo pipefail

# Ensure we don't run multiple times in parallel
touch "$HOME/.spin_initialized"

echo "==> Syncing Spin templates in user context ($USER)..."
spin templates install --git https://github.com/spinframework/spin --upgrade --yes

echo "==> Installing Spin plugins..."
spin plugins update
spin plugins install aka --yes

echo "==> Environment ready!"