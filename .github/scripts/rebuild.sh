#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for finos/legend
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm use 20 || nvm install 20
fi

# --- Package manager + dependencies ---
# Uses npm (package-lock.json)
npm install

# --- Build ---
npm run build

echo "[DONE] Build complete."
