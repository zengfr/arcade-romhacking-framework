/*
# Linker Script For PGM Game Patch
# (c) 2016  XingXing(HappyASR#gmail.com)
# (c) 2020  zengfr(362505707#qq.com)(https://github.com/zengfr)
*/

OUTPUT_FORMAT("elf32-m68k")
OUTPUT_ARCH(m68k)

SECTIONS
{
  .rom :
  {
  	*(.patch*)
    *(.text*)
    *(.rodata*)
    . = ALIGN(4);
    PROVIDE(__rom_end__ = .);
  }

  .ram :
  {
    PROVIDE(__ram_start__ = .);
    *(.data*)
    *(.bss*)
    *(COMMON*)
    . = ALIGN(4);
    PROVIDE(__ram_end__ = .);
    PROVIDE(end = .);
  }

  /DISCARD/ :
  { 
    *(.discard*)
    *(.comment*)
  }

}