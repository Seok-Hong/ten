#------------------------------------------------------------------------------
# temporary Makefile
#
# Author: Seok Hong (seok85.hong@gmail.com)
# Date: 2014-10-12
#
# Changelog:
#	0.0.1 - first version
#------------------------------------------------------------------------------

all: BootLoader Kernel32 Disk.img

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

Disk.img: bootloader/BootLoader.bin kernel32/Kernel32.bin
	@echo
	@echo ========== Build Image Build Start ==========
	@echo

	utility/imagemaker/imagemaker.exe $^
	cat $^ > Disk.img

	@echo
	@echo ========== All Build Complete ==========
	@echo

clean:
	make -C bootloader clean
	make -C kernel32 clean
	rm -f Disk.img
