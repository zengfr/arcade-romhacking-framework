#ifndef _COMMON_DRAW_H_
#define _COMMON_DRAW_H_
#include "../common/typef.h"
#include "../common/math.h"
#include "../cps1/text.h"

void show_char(uint8_t x, uint8_t y, uint8_t palette, uint16_t c) ;
void show_string(uint8_t x, uint8_t y, uint8_t palette, const char* s) ;
void show_bits(uint8_t x ,uint8_t y, uint8_t palette,uint16_t data);
void show_rectangle(int x0, int y0, int w, int h);
#endif
