#!/bin/bash

# Check if NASM is installed
if ! command -v nasm &> /dev/null
then
  echo "Error: NASM is not installed. Please install NASM."
  exit 1
fi

# Check if script has execute permission
if [ ! -x "$0" ]
then
  echo "Error: Script does not have execute permission. Run 'chmod +x $0'"
  exit 1
fi

# Assemble the file
filename="$1"
nasm -f elf "./${filename}.asm" || { echo "Error during assembly. Check NASM output"; exit 1; }

# Link the object file
ld -m elf_i386 "./${filename}.o" -o "./${filename}" || { echo "Error during linking. Check linker output"; exit 1; }

# Run the executable
./"$filename"
