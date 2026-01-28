#!/bin/bash

# Configuration
BOOK_DIR="book"
MAIN_FILE="book/book.adoc"

# Check if inotifywait exists
if ! command -v inotifywait &> /dev/null; then
    echo "Error: 'inotifywait' is not installed."
    echo "Please install inotify-tools (e.g., sudo apt-get install inotify-tools)"
    exit 1
fi

# Check if asciidoctor-pdf exists
if ! command -v asciidoctor-pdf &> /dev/null; then
    echo "Error: 'asciidoctor-pdf' is not installed."
    echo "Please install it (e.g., gem install asciidoctor-pdf)"
    exit 1
fi

echo "👀 Watching $BOOK_DIR for changes..."
echo "Press Ctrl+C to stop."

while true; do
    # Wait for changes in the directory
    # -r: Recursive
    # -e: Events to listen for
    # --exclude: Ignore changes to the PDF file itself to avoid loops
    change=$(inotifywait -r -e modify,create,delete,move "$BOOK_DIR" \
        --exclude '\.pdf$' \
        --format '%w%f' \
        2>/dev/null)

    echo "🔄 Change detected in $change. Regenerating PDF..."
    
    # Small debounce to let file writes finish
    sleep 0.5
    
    # Generate Trap Index
    python3 tools/generate_index.py
    
    # Run asciidoctor-pdf and asciidoctor-epub3
    if asciidoctor-pdf "$MAIN_FILE" -o "${MAIN_FILE%.adoc}.pdf" && \
       export GEM_HOME=$(ruby -r rubygems -e 'print Gem.user_dir') && \
       export PATH=$PATH:$GEM_HOME/bin && \
       asciidoctor -r asciidoctor-epub3 -b epub3 "$MAIN_FILE" -o "${MAIN_FILE%.adoc}.epub"; then
        echo "✅ PDF and EPUB generated successfully"
        echo "Time: $(date '+%H:%M:%S')"
    else
        echo "❌ Generation failed!"
    fi
    echo "-----------------------------------"
done
