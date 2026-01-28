#!/bin/bash

# Configuration
BOOK_DIR="modules/ROOT/pages"
BUILD_SCRIPT="./build.sh"

# Check if inotifywait exists
if ! command -v inotifywait &> /dev/null; then
    echo "Error: 'inotifywait' is not installed."
    echo "Please install inotify-tools (e.g., sudo apt-get install inotify-tools)"
    exit 1
fi

echo "👀 Watching $BOOK_DIR for changes..."
echo "Press Ctrl+C to stop."

while true; do
    # Wait for changes in the directory
    change=$(inotifywait -r -e modify,create,delete,move "$BOOK_DIR" \
        --exclude '\.(pdf|epub)$' \
        --format '%w%f' \
        2>/dev/null)

    echo "🔄 Change detected in $change. Regenerating all formats..."
    
    # Small debounce
    sleep 0.5
    
    # Execute the full build
    $BUILD_SCRIPT
    
    echo "-----------------------------------"
done
