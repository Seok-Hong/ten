NASM=nasm
CC=gcc
CFLAGS=-c -m32 -ffreestanding
LD=ld
LDFLAGS=-melf_i386 -T ../elf_i386.x -nostdlib -e main -Ttext 0x10200

OBJCOPY32 = objcopy -j .text -j .data -j .rodata -j .bss -S -O binary

OBJDIR = build
SRCDIR = src

all: prepare kernel32.bin

prepare:
		mkdir -p $(OBJDIR)

$(OBJDIR)/entry_point.bin: $(SRCDIR)/entry_point.s
		$(NASM) -o $@ $<

dep:
		@echo === Make Dependency File ===
		make -C $(OBJDIR) -f ../Makefile InternalDependency
		@echo === Dependency Search Complete ===

ExecuteInternalBuild: dep
		make -C $(OBJDIR) -f ../Makefile kernel32.elf

$(OBJDIR)/kernel32.elf.bin: ExecuteInternalBuild
		$(OBJCOPY32) $(OBJDIR)/kernel32.elf $@

kernel32.bin: $(OBJDIR)/entry_point.bin $(OBJDIR)/kernel32.elf.bin
		cat $^ > $@
				
clean:
		rm -f *.bin
		rm -f $(OBJDIR)/*
		rm -rf $(OBJDIR)

CENTRYPOINTOBJECTFILE = main.o
CSOURCEFILES = $(wildcard ../$(SRCDIR)/*.c)
ASSEMBLYSOURCEFILES = $(wildcard ../$(SRCDIR)/*.asm)
COBJECTFILES = $(subst $(CENTRYPOINTOBJECTFILE), , $(notdir $(patsubst %.c,%.o,$(CSOURCEFILES))))
ASSEMBLYOBJECTFILES = $(notdir $(patsubst %.asm,%.o,$(ASSEMBLYSOURCEFILES)))

%.o: ../$(SRCDIR)/%.c
		$(CC) $(CFLAGS) -c $<

%.o: ../$(SRCDIR)/%.asm
		$(NASM) -f elf32 -o $@ $<

InternalDependency:
		$(CC) $(CFLAGS) -MM $(CSOURCEFILES) > Dependency.dep

kernel32.elf: $(CENTRYPOINTOBJECTFILE) $(COBJECTFILES) $(ASSEMBLYOBJECTFILES)
		$(LD) $(LDFLAGS) -o $@ $^

ifeq (Dependency.dep, $(wildcard Dependency.dep))
include Dependency.dep
endif
