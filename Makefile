#------------------------------------------------------------------------------
# temporary Makefile
#
# Author: Seok Hong (seok85.hong@gmail.com)
# Date: 2014-10-12
#
# Changelog:
#	0.0.1 - first version
#------------------------------------------------------------------------------

all: BootLoader Disk.img

BootLoader:
	@echo
	@echo ========== Build Boot Loader ==========
	@echo

	make -C bootloader

	@echo
	@echo ========== Build Complete ==========
	@echo

Kernel32:
	@echo
	@echo ========== Build Boot Loader ==========
	@echo

	make -C kernel32

	@echo
	@echo ========== Build Complete ==========
	@echo

Disk.img: BootLoader Kernel32
	@echo
	@echo ========== Build Image Build Start ==========
	@echo

	cat bootloader/BootLoader.bin kernel32/VirtualOS.bin > Disk.img

	@echo
	@echo ========== All Build Complete ==========
	@echo

clean:
	make -C bootloader clean
	rm -f Disk.img
