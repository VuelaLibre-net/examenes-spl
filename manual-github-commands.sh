#!/bin/bash

# Manual Commands for GitHub Release Management
# Run these commands manually if the automated script doesn't work

echo "📋 Manual GitHub Commands for SPL Exam Guide"
echo ""

# 1. INSTALL GITHUB CLI (if not installed)
echo "1️⃣ Install GitHub CLI:"
echo "   curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg"
echo "   echo \"deb [arch=\$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null"
echo "   sudo apt update && sudo apt install gh"
echo "   gh auth login"
echo ""

# 2. DELETE EXISTING RELEASES
echo "2️⃣ Delete existing releases:"
echo "   gh release list --repo VuelaLibre-net/examenes-spl"
echo "   # Then delete each release:"
echo "   gh release delete RELEASE_TAG --repo VuelaLibre-net/examenes-spl --yes"
echo ""

# 3. COMMIT AND PUSH
echo "3️⃣ Commit and push changes:"
echo "   git add ."
echo "   git commit -m \"✅ SPL Exam Guide - Complete Restructure & Link Fix

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

All critical issues resolved, ready for student use and further development.\""
echo "   git push origin main"
echo ""

# 4. BUILD AND CREATE NEW RELEASE
echo "4️⃣ Build project and create new release (if needed):"
echo "   ./build.sh"
echo "   gh release create v0.9.8 --title 'SPL Exam Guide v0.9.8' --notes 'Complete restructure with working navigation and modern web interface' book/preguntas-aesa-spl.*.pdf book/preguntas-aesa-spl.*.epub"
echo ""

echo "✅ Complete!"