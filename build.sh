#!/bin/bash

# Configuration
MAIN_FILE="modules/ROOT/pages/book.adoc"
PLAYBOOK="antora-playbook.yml"

# Check if asciidoctor-pdf exists
if ! command -v asciidoctor-pdf &> /dev/null; then
    echo "Error: 'asciidoctor-pdf' is not installed."
    echo "Please install it (e.g., gem install asciidoctor-pdf)"
    exit 1
fi

echo "🚀 Starting full build (Web, PDF, EPUB)..."

# Ensure all traps have anchors and regenerate index
echo "🔧 Running pre-build tools..."
python3 tools/add_anchors.py
python3 tools/generate_index.py

# Run Antora for Web
echo "🌐 Generating Web site (Antora)..."
if npx antora "$PLAYBOOK"; then
    echo "✅ Web site generated in build/site/"
else
    echo "❌ Web generation failed!"
fi

# Run asciidoctor-pdf and asciidoctor-epub3
echo "📄 Generating PDF and EPUB..."
if asciidoctor-pdf "$MAIN_FILE" -o "${MAIN_FILE%.adoc}.pdf" && \
   export GEM_HOME=$(ruby -r rubygems -e 'print Gem.user_dir') && \
   export PATH=$PATH:$GEM_HOME/bin && \
   asciidoctor -r asciidoctor-epub3 -b epub3 "$MAIN_FILE" -o "${MAIN_FILE%.adoc}.epub"; then
    
    # Extract version and date
    VERSION=$(grep -oP '^v\d+\.\d+\.\d+' "$MAIN_FILE" | head -1)
    DATE=$(date +%Y-%m-%d)
    
    # Define filenames
    BASENAME="book/preguntas-aesa-spl.$DATE.$VERSION"
    
    # Copy to release filenames
    cp "${MAIN_FILE%.adoc}.pdf" "$BASENAME.pdf"
    cp "${MAIN_FILE%.adoc}.epub" "$BASENAME.epub"
    
    # Also update the generic "latest" link/file for convenience
    cp "${MAIN_FILE%.adoc}.pdf" "book/preguntas-aesa-spl.pdf"
    cp "${MAIN_FILE%.adoc}.epub" "book/preguntas-aesa-spl.epub"
    
    echo "✅ PDF and EPUB generated successfully:"
    echo "   - $BASENAME.pdf"
    echo "   - $BASENAME.epub"
else
    echo "❌ Document generation failed!"
    exit 1
fi
