#!/usr/bin/env bash
set -euo pipefail

echo "==> Detecting architecture..."
ARCH=$(uname -m)
case "${ARCH}" in
    x86_64|amd64)   SPIN_ARCH="amd64" ;;
    aarch64|arm64)  SPIN_ARCH="aarch64" ;;
    *)              echo "Unsupported architecture: ${ARCH}"; exit 1 ;;
esac

echo "==> Installing latest stable Spin binary (${SPIN_ARCH})..."
SPIN_VERSION=$(curl -sI https://github.com/spinframework/spin/releases/latest | grep -i '^location:' | sed -E 's/.*tag\/v?([^\r\n]+).*/\1/')
curl -fsSL "https://github.com/spinframework/spin/releases/download/v${SPIN_VERSION}/spin-v${SPIN_VERSION}-linux-${SPIN_ARCH}.tar.gz" | tar -xz -C /tmp
sudo mv /tmp/spin /usr/local/bin/spin
sudo chmod +x /usr/local/bin/spin

echo "==> Syncing Spin templates in user context ($USER)..."
spin templates install --git https://github.com/spinframework/spin --upgrade

echo "==> Installing Spin plugins..."
spin plugins update
spin plugins install aka --yes

echo "==> Environment ready!"