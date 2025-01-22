#!/bin/bash


# Variables
BASE="/Users/tarunbansal/project"
DAYS=10
DEPTH=1
RUN=0
TIME_THRESHOLD_DAYS=30


# Check if the directory exists
if [ ! -d "$BASE" ]; then
  echo "Error: Directory does not exist: $BASE"
  exit 1
fi


# Create 'archive' folder if not present
ARCHIVE_DIR="$BASE/archive"
if [ ! -d "$ARCHIVE_DIR" ]; then
  mkdir "$ARCHIVE_DIR" || {
    echo "Error: Failed to create archive directory: $ARCHIVE_DIR"
    exit 1
  }
fi


# Find and archive files larger than 20MB or older than 30 days
find "$BASE" -maxdepth "$DEPTH" \( -type f -size +20M -o -mtime +$TIME_THRESHOLD_DAYS \) | while read -r file; do
  if [ $RUN -eq 0 ]; then
    # Display information about archiving
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] Archiving $file ==> $ARCHIVE_DIR"

    
    # Compress the file using gzip
    gzip "$file" || {
      echo "Error: Failed to gzip file: $file"
      exit 1
    }

    
    # Move the compressed file to the archive folder
    mv "$file.gz" "$ARCHIVE_DIR" || {
      echo "Error: Failed to move compressed file to archive: $file.gz"
      exit 1
    }
  fi
done



