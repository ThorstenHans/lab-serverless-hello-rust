#!/usr/bin/env bash
set -euo pipefail

echo "==> Detecting architecture..."
ARCH=$(uname -m)
case "${ARCH}" in
    x86_64|amd64)   SPIN_ARCH="amd64" ;;
    aarch64|arm64)  SPIN_ARCH="aarch64" ;;
    *)              echo "Unsupported architecture: ${ARCH}"; exit 1 ;;
esac

echo "==> Architecture identified as: ${SPIN_ARCH}"
echo "==> Installing latest stable Spin binary..."

# Fetch latest stable tag from GitHub releases
SPIN_VERSION=$(curl -sI https://github.com/spinframework/spin/releases/latest | grep -i '^location:' | sed -E 's/.*tag\/v?([^\r\n]+).*/\1/')

echo "--> Detected latest stable release: v${SPIN_VERSION}"

# Download and extract binary matching system architecture
curl -fsSL "https://github.com/spinframework/spin/releases/download/v${SPIN_VERSION}/spin-v${SPIN_VERSION}-linux-${SPIN_ARCH}.tar.gz" | tar -xz -C /tmp
sudo mv /tmp/spin /usr/local/bin/spin
sudo chmod +x /usr/local/bin/spin

echo "==> Spin binary successfully installed to /usr/local/bin/spin"
