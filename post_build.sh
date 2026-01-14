#!/bin/bash
OBJCOPY=$(find /opt -name arm-none-eabi-objcopy | head -n 1)
ELF=$(find /workspace/Debug -name '*.elf' | head -n 1)

if [ -z "$OBJCOPY" ]; then
    echo "Error: arm-none-eabi-objcopy not found"
    exit 1
fi

if [ -z "$ELF" ]; then
    echo "Error: No .elf file found in /workspace/Debug"
    exit 1
fi

BASENAME=${ELF%.*}
echo "Generating Binaries for $ELF..."
"$OBJCOPY" -O binary "$ELF" "$BASENAME.bin"
"$OBJCOPY" -O ihex "$ELF" "$BASENAME.hex"
echo "Binary generation complete."
