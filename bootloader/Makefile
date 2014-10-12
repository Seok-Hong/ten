#------------------------------------------------------------------------------
# temporary Makefile
#
# Author: Seok Hong (seok85.hong@gmail.com)
# Date: 2014-10-12
#
# Changelog:
#	0.0.1 - first version
#------------------------------------------------------------------------------

all: BootLoader.bin

BootLoader.bin: BootLoader.asm
	nasm -o BootLoader.bin BootLoader.asm

clean:
	rm -f BootLoader.bin
