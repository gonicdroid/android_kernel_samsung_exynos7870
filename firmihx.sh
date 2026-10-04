#!/bin/bash

# Convert HEX files to IHEX
# Path absolute to the firmware folder of your kernel
FIRMWARE_DIR="/home/gonic/Git/android_kernel_samsung_exynos7870_j7xelte/firmware"

echo "==================================================="
echo "Starting conversion from .ihex to (.fw)"
echo "Directory: $FIRMWARE_DIR"
echo "==================================================="

# Find all .ihex files recursively
find "$FIRMWARE_DIR" -type f -name "*.ihex" | while read -r ihex_file; do
    
    # Remove .ihex extension to get the final name
    fw_file="${ihex_file%.ihex}"

    # Only convert if .fw does not exist yet
    if [ ! -f "$fw_file" ]; then
        echo "Converting: $(basename "$ihex_file") -> $(basename "$fw_file")"
        objcopy -I ihex -O binary "$ihex_file" "$fw_file"
    else
        echo "Skipping (already exists): $(basename "$fw_file")"
    fi

done

echo "==================================================="
echo "Conversion completed successfully!"
echo "==================================================="