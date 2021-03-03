#include "../common/type.h"
#include "../common/typef.h"
#include "../common/math.h"
#include "../cps1/port.h"
#include "../cps1/text.h"
#include "../common/draw.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void show_char(uint8_t x, uint8_t y, uint8_t palette, uint16_t c)
{
    uint16_t offect=0xa000+0x08;
    uint16_t px = x;
    uint16_t py = y;
    uint32_t data = (palette << 0) | (c<<16);
    uint32_t index=offect + px*0x80+py * 4;
    index=index/4;
    text_vram[index] = data;

}

void show_string(uint8_t x, uint8_t y, uint8_t palette, const char* s)
{
    while (*s)
        show_char(x++, y, palette, *s++);
}
void show_bits(uint8_t x,uint8_t y, uint8_t palette,uint16_t data)
{
    int bit;
    for (bit = 15; bit >= 0; bit--)
        show_char(x++, y, 0, (data & (1 << bit)) ? '1' : '0');
}

void show_line(int x0, int y0, int x1, int y1, uint16_t c)
{
    int dx = x1 - x0, dy = y1 - y0, k;
    double x = x0, y = y0, xIncre, yIncre, espl;
    espl = abs(dy);
    if (abs(dx) > abs(dy))
        espl = abs(dx);
    xIncre = 1.0*dx / espl;
    yIncre = 1.0*dy / espl;
    for (k = 0; k < espl; k++)
    {
        show_char(x, y,0,c);
        x += xIncre;
        y += yIncre;
    }
}
void show_rectangle(int x0, int y0, int w, int h)
{
    uint16_t c1='-';
    //uint16_t c2='|';
    show_line(x0,   y0,   x0+w,  y0,   c1);//x
    //show_line(x0,   y0,   x0,   y0+h,   c2);//y
    //show_line(x0+w,   y0,   x0+w,   y0+h,   c2);//y
    show_line(x0,   y0+h,  x0+w,   y0+h,   c1);//x
}
