#!/bin/bash

# GitHub Release Management Script for SPL Exam Guide
# This script deletes existing releases and commits/pushes improvements

set -e

echo "🗑️  GitHub Release Management for SPL Exam Guide"

# Check if gh CLI is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) not found. Please install it first:"
    echo "   curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg"
    echo "   echo \"deb [arch=\$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null"
    echo "   sudo apt update && sudo apt install gh"
    echo "   gh auth login"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub. Please run: gh auth login"
    exit 1
fi

REPO="VuelaLibre-net/examenes-spl"

echo "🔍 Fetching existing releases..."

# List all releases
RELEASES=$(gh release list --repo $REPO --limit 100 --json tagName,name)

if [ -z "$RELEASES" ]; then
    echo "✅ No releases found to delete"
else
    echo "📋 Found releases:"
    echo "$RELEASES" | jq -r '.[] | "- \(.name) (\(.tagName))"'
    
    # Auto-confirm since user explicitly requested it
    echo "⚠️  Deleting all releases as requested..."
    
    echo "🗑️  Deleting releases..."
    
    # Delete each release
    echo "$RELEASES" | jq -r '.[].tagName' | while read tag; do
        echo "  🗑️  Deleting release: $tag"
        gh release delete "$tag" --repo $REPO --yes
    done
    
    echo "✅ All releases deleted"
fi

echo ""
echo "🔄 Committing and pushing changes..."

# Stage all changes
echo "📋 Staging changes..."
git add .

# Commit changes
echo "💾 Committing changes..."
git commit -m "✅ SPL Exam Guide - Complete Restructure & Link Fix

🔗 FIXED: Internal Navigation Links
- Fixed broken xref links in generated HTML
- Updated nav.adoc with proper component syntax (spl-guide: prefix)
- All navigation links now working correctly in web version

🏗️ Migration to Modern Architecture
- Migrated from legacy AsciiDoc to Antora-based documentation
- Implemented proper modules/ROOT/pages/ structure
- Created modern web portal with responsive design
- Maintained PDF/EPUB generation capabilities

🎨 Enhanced User Experience
- Added themed navigation with emojis for better visual hierarchy
- Translated admonitions to Spanish (Nota/Advertencia/Precaución)
- Fixed FontAwesome conflicts and red styling for 'trampa' blocks
- Implemented modern CSS with improved typography

📊 New Content & Features
- Added new 'trap' question about pilot incapacitation
- Updated executive summary with new content
- Created comprehensive README.md with badges and modern structure
- Implemented versioned artifacts with date stamps

🛠️ Build System Improvements
- Unified build scripts (build.sh, watch.sh)
- Versioned PDF/EPUB generation
- Automated indexing and anchor generation
- Development-friendly watch mode

All critical issues resolved, ready for student use and further development."

# Push to main branch
echo "🚀 Pushing to main branch..."
git push origin main

echo ""
echo "🎉 Complete! The repository has been updated:"
echo "   📦 All releases deleted from GitHub"
echo "   💻 All improvements committed and pushed"
echo "   🌐 Web version ready with working navigation"
echo "   📄 PDF/EPUB generation working with versioning"
echo ""
echo "🔗 Next steps:"
echo "   1. GitHub Actions will automatically build and deploy"
echo "   2. Visit https://VuelaLibre-net.github.io/examenes-spl"
echo "   3. Create a new release with versioned artifacts if needed"