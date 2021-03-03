#if !defined(__CPS1_TEXT_H__)
#define __CPS1_TEXT_H__

#include <stdint.h>

#define text_vram_addr 0x900000
#define text_line_select_addr 0xff8000+0x400
#define text_line_scroll_addr 0xff8000+0x800
#define text_palette_addr 0xff8000+0xc00

#define text_vram ((volatile uint32_t* const)(text_vram_addr))
#define text_line_select ((volatile uint32_t* const)(text_line_select_addr))
#define text_line_scroll ((volatile int32_t* const)(text_line_scroll_addr))
#define text_palette ((volatile uint32_t* const)(text_palette_addr))

#endif  // !defined(__CPS1_TEXT_H__)
