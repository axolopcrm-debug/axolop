#!/usr/bin/env bash
set -euo pipefail

# 🚀 AXOLOP Quick Deploy Script
# Usage: ./scripts/quick-deploy.sh "Quick fix description"
# This creates a patch version automatically

DESCRIPTION="${1:?Usage: ./scripts/quick-deploy.sh \"Quick fix description\"}"
TODAY=$(date +%F)

# Get current version from latest tag
CURRENT_VERSION=$(git describe --tags --abbrev=0 2>/dev/null || echo "v0.0.0")
echo "Current version: $CURRENT_VERSION"

# Extract version numbers
if [[ $CURRENT_VERSION =~ v([0-9]+)\.([0-9]+)\.([0-9]+) ]]; then
    MAJOR=${BASH_REMATCH[1]}
    MINOR=${BASH_REMATCH[2]}
    PATCH=${BASH_REMATCH[3]}
    NEW_PATCH=$((PATCH + 1))
    VERSION="v${MAJOR}.${MINOR}.${NEW_PATCH}"
else
    VERSION="v1.0.1"
fi

echo "🚀 Quick deploy: $VERSION"
echo "📝 Description: $DESCRIPTION"

# Run the full deployment script
./scripts/deploy.sh "$VERSION" "$DESCRIPTION"
