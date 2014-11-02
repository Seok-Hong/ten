#------------------------------------------------------------------------------
# temporary Makefile
#
# Author: Seok Hong (seok85.hong@gmail.com)
# Date: 2014-10-12
#
# Changelog:
#	0.0.1 - first version
#------------------------------------------------------------------------------

all: ImageMaker BootLoader Kernel32 Disk.img

ImageMaker:
	make -C utility/imagemaker

BootLoader:
	make -C bootloader

Kernel32:
	make -C kernel32

Disk.img: bootloader/bootloader.bin kernel32/kernel32.bin
	utility/imagemaker/imagemaker $^
	cat $^ > Disk.img

clean:
	make -C utility/imagemaker clean
	make -C bootloader clean
	make -C kernel32 clean
	rm -f Disk.img
