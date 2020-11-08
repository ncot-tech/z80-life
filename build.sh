#!/bin/sh
# Tools
ASM=/opt/sjasmplus
HEX=/home/james/z88dk/bin/appmake
HEXARGS="+hex --org 0x8000 -b $1.z80 -o $1.hex"

# Compile the z80 file
$ASM $1.asm --sym && $HEX $HEXARGS

