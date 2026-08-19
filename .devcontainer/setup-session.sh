#!/usr/bin/env bash
set -euo pipefail

echo "==> Syncing Spin templates..."
spin templates install --git https://github.com/spinframework/spin --upgrade 

echo "==> Installing Spin plugins..."
spin plugins update
spin plugins install aka --yes

echo "==> Environment ready! Opening instructions..."
