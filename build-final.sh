#!/bin/bash

# Build script for SPL Exam Guide
# This script generates both web (Antora) and PDF/EPUB versions

set -e

echo "🛩️  Building SPL Exam Guide..."

# Run preprocessing scripts
echo "📋 Running preprocessing..."
python3 tools/add_anchors.py
python3 tools/generate_index.py

# Generate web version with Antora
echo "🌐 Building web version with Antora..."
npx antora antora-playbook.yml

# Generate PDF and EPUB
echo "📄 Generating PDF/EPUB..."
asciidoctor-pdf modules/ROOT/pages/book.adoc -o book/guia-spl.pdf
asciidoctor-epub3 modules/ROOT/pages/book.adoc -o book/guia-spl.epub

# Create versioned copies
DATE=$(date +%Y-%m-%d)
VERSION=$(grep "^version:" modules/ROOT/pages/book.adoc | cut -d'"' -f2 | head -1)
if [ -z "$VERSION" ]; then
    VERSION="v0.9.8"
fi

echo "📋 Creating versioned artifacts..."
cp book/guia-spl.pdf "book/preguntas-aesa-spl.${DATE}.${VERSION}.pdf"
cp book/guia-spl.epub "book/preguntas-aesa-spl.${DATE}.${VERSION}.epub"

echo "✅ Build complete!"
echo "📁 Web version: build/site/"
echo "📄 PDF: book/preguntas-aesa-spl.${DATE}.${VERSION}.pdf"
echo "📚 EPUB: book/preguntas-aesa-spl.${DATE}.${VERSION}.epub"