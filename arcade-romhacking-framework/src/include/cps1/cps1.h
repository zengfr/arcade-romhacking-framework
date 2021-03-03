#if !defined(__CPS1_H__)
#define __CPS1_H__
#include <stdint.h>
#include "../include/common/typef.h"

#define OBJ_BASE_ADDR      0x900000
#define SCROLL1_BASE_ADDR  0x908000
#define SCROLL2_BASE_ADDR  0x90C000
#define SCROLL3_BASE_ADDR  0x910000
#define Palettes_BASE_ADDR 0x914000
/***0x900000-0x92FFFF*/

#define INPUT_BASE_ADDR             0x800000
#define INPUT_Other_BASE_ADDR       0x800018
#define A_Registers_BASE_ADDR       0x800100
#define B_Registers_BASE_ADDR       0x800140
#define GAME_BASE_ADDR              0xFF8000
/**0xFF0000-0xFFFFFF*/
#define RAM_BASE_ADDR              0xFF0000

struct cps1_sprite
{
    int x ;
    int y  ;
    int tile ;
    int attr ;
};
struct palette {
  union {
    uint16_t code;
    struct {
      uint16_t r : 5;
      uint16_t g : 5;
      uint16_t b : 5;
      uint16_t na : 1;
    } color;
  } entry[16];
};
#endif  // !defined(__CPS1_H__)
