#ifndef __GAME_DEF_H__
#define __GAME_DEF_H__
#include <stdint.h>

#ifndef __fastcall
#define __fastcall
#endif
#ifndef __cdcel
#define __cdcel
#endif

#define __int8 char
#define __int16 short
#define __int32 int
typedef signed char s8;
typedef signed short s16;
typedef signed int s32;

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef unsigned char ubyte;
typedef unsigned short ushort;
typedef unsigned int uint;

typedef unsigned char undefined1;
typedef unsigned short undefined2;
typedef unsigned int undefined4;



typedef unsigned char _BYTE;
typedef unsigned short _WORD;
typedef unsigned int _DWORD;

typedef unsigned char UINT8;
typedef unsigned short UINT16;
typedef unsigned int UINT32;
typedef unsigned long long UINT64;

typedef  u32 (*_FUNC)();

#define FUNC32(x)  (*((u32 (*)())((x)+0)))
#define FUNC16(x)  (*((u32 (*)())((x)|1)))

#define PU8(x)     ((u8 *)(x))
#define PU16(x)    ((u16 *)(x))
#define PU32(x)    ((u32 *)(x))

#define PS8(x)     ((s8 *)(x))
#define PS16(x)    ((s16 *)(x))
#define PS32(x)    ((s32 *)(x))

#define DU8(x)     (*PU8(x))
#define DU16(x)    (*PU16(x))
#define DU32(x)    (*PU32(x))

#define DS8(x)     (*PS8(x))
#define DS16(x)    (*PS16(x))
#define DS32(x)    (*PS32(x))

#define PVU8(x)     ((volatile u8 *)(x))
#define PVU16(x)    ((volatile u16 *)(x))
#define PVU32(x)    ((volatile u32 *)(x))

#define PVS8(x)     ((volatile s8 *)(x))
#define PVS16(x)    ((volatile s16 *)(x))
#define PVS32(x)    ((volatile s32 *)(x))

#define DVU8(x)     (*PVU8(x))
#define DVU16(x)    (*PVU16(x))
#define DVU32(x)    (*PVU32(x))

#define DVS8(x)     (*PVS8(x))
#define DVS16(x)    (*PVS16(x))
#define DVS32(x)    (*PVS32(x))
 

#define PATCH_DAT 0x5441444843544150ULL //"PATCHDAT"
struct init_data {
	UINT64 sig;
	UINT32 typ;
	UINT32 dst;
	UINT32 dst_end;
	UINT32 src;
};

#endif

