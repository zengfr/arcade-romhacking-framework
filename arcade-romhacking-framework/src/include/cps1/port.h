#if !defined(__CPS1_PORT_H__)
#define __CPS1_PORT_H__

#include <stdint.h>
enum {
  CTRL_RIGHT = (1 << 0),
  CTRL_LEFT  = (1 << 1),
  CTRL_DOWN  = (1 << 2),
  CTRL_UP    = (1 << 3),
  CTRL_B1    = (1 << 4),
  CTRL_B2    = (1 << 5),
  CTRL_B3    = (1 << 6),
  CTRL_VBLANK     = (1 << 7),
};
 
enum {
  SYS_COIN1    = (1 << 0),
  SYS_COIN2    = (1 << 1),
  SYS_SERVICE1 = (1 << 2),
  SYS_START1   = (1 << 3),
  SYS_START2   = (1 << 4),
  SYS_SERVICE2 = (1 << 5),
};
#define port_base_addr 0xff8000
#define port_in1 ((const volatile uint16_t* const)(port_base_addr+0x0020))
#define port_in2 ((const volatile uint16_t* const)(port_base_addr+0x0024))


#define port_sys ((const volatile uint16_t* const)(port_base_addr+0x0028))
#define port_dsw_a ((const volatile uint16_t* const)(port_base_addr+0x002c))
#define port_dsw_b ((const volatile uint16_t* const)(port_base_addr+0x0030))
#define port_jmpr ((const volatile uint16_t* const)(port_base_addr+0x0034))

#endif  // !defined(__CPS1_PORT_H__)
