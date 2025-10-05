#!/usr/bin/env bash
set -euo pipefail

# 🚀 AXOLOP Deployment Script
# Usage: ./scripts/deploy.sh vX.Y.Z "Release summary"
# Example: ./scripts/deploy.sh v1.3.0 "Analyzer hero copy + comparison table perf"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[AXOLOP]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Validate inputs
VERSION="${1:?Usage: ./scripts/deploy.sh vX.Y.Z \"Release summary\"}"
SUMMARY="${2:?Provide a short summary}"
TODAY=$(date +%F)

print_status "🚀 Starting AXOLOP deployment: $VERSION"
print_status "📅 Date: $TODAY"
print_status "📝 Summary: $SUMMARY"

# Step 1: Verify clean working tree
print_status "🔍 Checking git status..."
if ! git diff --quiet || ! git diff --cached --quiet; then
    print_error "Working tree is not clean. Please commit or stash changes first."
    exit 1
fi

# Step 2: Pull latest from main
print_status "📥 Pulling latest from main..."
git checkout main
git pull origin main

# Step 3: Create release branch
print_status "🌿 Creating release branch..."
git checkout -b "release/$VERSION"

# Step 4: Build assets (if needed)
print_status "🔨 Building assets..."
if [ -f "package.json" ]; then
    npm run build || print_warning "Build failed, continuing..."
else
    print_status "No package.json found, skipping build step"
fi

# Step 5: Validate Shopify theme
print_status "✅ Validating Shopify theme..."
if command -v shopify &> /dev/null; then
    shopify theme validate || print_warning "Theme validation failed, continuing..."
else
    print_warning "Shopify CLI not found, skipping validation"
fi

# Step 6: Update CHANGELOG
print_status "📝 Updating CHANGELOG..."
[ -f CHANGELOG.md ] || touch CHANGELOG.md
{
    echo "## $VERSION — $TODAY"
    echo "- $SUMMARY"
    echo "- Notes: Any schema changes, section adds/removes, and app config updates."
    echo ""
    cat CHANGELOG.md
} > CHANGELOG.tmp && mv CHANGELOG.tmp CHANGELOG.md

# Step 7: Commit and create tags
print_status "💾 Creating git backup and tags..."
git add -A
git commit -m "release: $VERSION — $SUMMARY"
git tag -a "$VERSION" -m "$SUMMARY"
git tag -a "backup/$TODAY-$VERSION" -m "Backup snapshot before publish"

# Step 8: Push to GitHub
print_status "📤 Pushing to GitHub..."
git push origin "release/$VERSION"
git push origin "$VERSION"
git push origin "backup/$TODAY-$VERSION"

print_success "✅ Git backup and GitHub push completed!"

# Step 9: Merge to main
print_status "🔄 Merging to main..."
git checkout main
git merge "release/$VERSION" --no-ff -m "Merge release/$VERSION into main"
git push origin main

# Step 10: Deploy to Shopify
print_status "🛍️ Deploying to Shopify..."

# Check if Shopify CLI is available
if ! command -v shopify &> /dev/null; then
    print_error "Shopify CLI not found. Please install it first:"
    print_error "npm install -g @shopify/cli @shopify/theme"
    exit 1
fi

# Deploy as draft theme first
print_status "📦 Pushing draft theme to Shopify..."
shopify theme push --unpublished --path . --message "$VERSION — $SUMMARY"

print_success "🎉 Deployment completed successfully!"
print_status ""
print_status "📋 Next steps:"
print_status "1. QA the draft theme in Shopify Admin"
print_status "2. Publish the theme when ready"
print_status "3. Run: shopify theme list (to see your draft theme)"
print_status ""
print_status "🔗 Useful commands:"
print_status "• View themes: shopify theme list"
print_status "• Publish: Use Shopify Admin → Online Store → Themes"
print_status "• Rollback: git checkout tags/$VERSION && shopify theme push --unpublished"
print_status ""
print_success "🚀 AXOLOP deployment $VERSION is ready for QA!"
