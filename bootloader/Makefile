#------------------------------------------------------------------------------
# temporary Makefile
#
# Author: Seok Hong (seok85.hong@gmail.com)
# Date: 2014-10-12
#
# Changelog:
#	0.0.1 - first version
#------------------------------------------------------------------------------

all: bootloader.bin

bootloader.bin: bootloader.asm
	nasm -o bootloader.bin bootloader.asm

clean:
	rm -f bootloader.bin
