#if !defined(__COMMON_TYPE2_H__)
#define __COMMON_TYPE2_H__

#include <stdint.h>

typedef signed char int8_t;
typedef signed short int16_t;
//typedef signed long int32_t;

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
//typedef unsigned long uint32_t;

typedef  void(*FP00)();

#define FAST_CALL  __attribute__((regparm(3)))
#define STACK_CALL __attribute__((regparm(0)))
#define REG_PARM3 __attribute((regparm(3)))
#define REG_PARM0 __attribute((regparm(0)))

#define CPP_ASMLINKAGE
#define asmlinkage00 CPP_ASMLINKAGE __attribute__((regparm(0)))
#define asmlinkage0 CPP_ASMLINKAGE __attribute__((regparm(0)))
#define asmlinkage3 CPP_ASMLINKAGE __attribute__((regparm(3)))

//#define rd2 register int d2 asm("d2");

#endif  // !defined(__COMMON_TYPE2_H__)
