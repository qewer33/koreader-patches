#!/bin/bash

# Define target path
TARGET_DIR="$HOME/.config/koreader/patches"

# Ensure the patches directory exists
mkdir -p "$TARGET_DIR"

# Enable nullglob so the array is empty if no .lua files exist
shopt -s nullglob
LUA_FILES=(*.lua)

# Check if there are any .lua files in the current directory
if [ ${#LUA_FILES[@]} -eq 0 ]; then
    echo "❌ Error: No .lua files found in the current directory."
    exit 1
fi

# Copy all .lua files over (overwriting the old ones)
cp "${LUA_FILES[@]}" "$TARGET_DIR/"

echo "✅ Successfully pushed ${#LUA_FILES[@]} .lua file(s) to local KOReader patches!"

# Optional: List out what was copied for a nice visual confirmation
for file in "${LUA_FILES[@]}"; do
    echo "  - $file"
done

pkill -f koreader
koreader