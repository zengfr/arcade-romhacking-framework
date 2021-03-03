
game:     file format elf32-m68k


Disassembly of section .rom:

00000000 <__patch_end_dumpy>:
	...

000fbb20 <show_char>:
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void show_char(uint8_t x, uint8_t y, uint8_t palette, uint16_t c)
{
   fbb20:	4fef ffe8      	lea %sp@(-24),%sp
   fbb24:	2f02           	movel %d2,%sp@-
   fbb26:	226f 0020      	moveal %sp@(32),%a1
   fbb2a:	206f 0024      	moveal %sp@(36),%a0
   fbb2e:	222f 0028      	movel %sp@(40),%d1
   fbb32:	202f 002c      	movel %sp@(44),%d0
   fbb36:	3409           	movew %a1,%d2
   fbb38:	1f42 000c      	moveb %d2,%sp@(12)
   fbb3c:	3408           	movew %a0,%d2
   fbb3e:	1f42 000a      	moveb %d2,%sp@(10)
   fbb42:	1f41 0008      	moveb %d1,%sp@(8)
   fbb46:	3f40 0006      	movew %d0,%sp@(6)
    uint16_t offect=0xa000+0x08;
   fbb4a:	3f7c a008 001a 	movew #-24568,%sp@(26)
    uint16_t px = x;
   fbb50:	4240           	clrw %d0
   fbb52:	102f 000c      	moveb %sp@(12),%d0
   fbb56:	3f40 0018      	movew %d0,%sp@(24)
    uint16_t py = y;
   fbb5a:	4240           	clrw %d0
   fbb5c:	102f 000a      	moveb %sp@(10),%d0
   fbb60:	3f40 0016      	movew %d0,%sp@(22)
    uint32_t data = (palette << 0) | (c<<16);
   fbb64:	7200           	moveq #0,%d1
   fbb66:	122f 0008      	moveb %sp@(8),%d1
   fbb6a:	7000           	moveq #0,%d0
   fbb6c:	302f 0006      	movew %sp@(6),%d0
   fbb70:	4840           	swap %d0
   fbb72:	4240           	clrw %d0
   fbb74:	8081           	orl %d1,%d0
   fbb76:	2f40 0012      	movel %d0,%sp@(18)
    uint32_t index=offect + px*0x80+py * 4;
   fbb7a:	7200           	moveq #0,%d1
   fbb7c:	322f 001a      	movew %sp@(26),%d1
   fbb80:	7000           	moveq #0,%d0
   fbb82:	302f 0018      	movew %sp@(24),%d0
   fbb86:	ef88           	lsll #7,%d0
   fbb88:	d280           	addl %d0,%d1
   fbb8a:	7000           	moveq #0,%d0
   fbb8c:	302f 0016      	movew %sp@(22),%d0
   fbb90:	d080           	addl %d0,%d0
   fbb92:	d080           	addl %d0,%d0
   fbb94:	d081           	addl %d1,%d0
   fbb96:	2f40 000e      	movel %d0,%sp@(14)
    index=index/4;
   fbb9a:	202f 000e      	movel %sp@(14),%d0
   fbb9e:	e488           	lsrl #2,%d0
   fbba0:	2f40 000e      	movel %d0,%sp@(14)
    text_vram[index] = data;
   fbba4:	202f 000e      	movel %sp@(14),%d0
   fbba8:	d080           	addl %d0,%d0
   fbbaa:	d080           	addl %d0,%d0
   fbbac:	0680 0090 0000 	addil #9437184,%d0
   fbbb2:	2040           	moveal %d0,%a0
   fbbb4:	20af 0012      	movel %sp@(18),%a0@

}
   fbbb8:	241f           	movel %sp@+,%d2
   fbbba:	4fef 0018      	lea %sp@(24),%sp
   fbbbe:	4e75           	rts

000fbbc0 <show_string>:

void show_string(uint8_t x, uint8_t y, uint8_t palette, const char* s)
{
   fbbc0:	518f           	subql #8,%sp
   fbbc2:	2f02           	movel %d2,%sp@-
   fbbc4:	206f 0010      	moveal %sp@(16),%a0
   fbbc8:	222f 0014      	movel %sp@(20),%d1
   fbbcc:	202f 0018      	movel %sp@(24),%d0
   fbbd0:	3408           	movew %a0,%d2
   fbbd2:	1f42 000a      	moveb %d2,%sp@(10)
   fbbd6:	1f41 0008      	moveb %d1,%sp@(8)
   fbbda:	1f40 0006      	moveb %d0,%sp@(6)
    while (*s)
   fbbde:	604e           	bras fbc2e <show_string+0x6e>
        show_char(x++, y, palette, *s++);
   fbbe0:	202f 001c      	movel %sp@(28),%d0
   fbbe4:	2200           	movel %d0,%d1
   fbbe6:	5281           	addql #1,%d1
   fbbe8:	2f41 001c      	movel %d1,%sp@(28)
   fbbec:	2040           	moveal %d0,%a0
   fbbee:	1010           	moveb %a0@,%d0
   fbbf0:	4880           	extw %d0
   fbbf2:	3000           	movew %d0,%d0
   fbbf4:	0280 0000 ffff 	andil #65535,%d0
   fbbfa:	2240           	moveal %d0,%a1
   fbbfc:	7000           	moveq #0,%d0
   fbbfe:	102f 0006      	moveb %sp@(6),%d0
   fbc02:	2040           	moveal %d0,%a0
   fbc04:	7200           	moveq #0,%d1
   fbc06:	122f 0008      	moveb %sp@(8),%d1
   fbc0a:	102f 000a      	moveb %sp@(10),%d0
   fbc0e:	1400           	moveb %d0,%d2
   fbc10:	5202           	addqb #1,%d2
   fbc12:	1f42 000a      	moveb %d2,%sp@(10)
   fbc16:	1000           	moveb %d0,%d0
   fbc18:	0280 0000 00ff 	andil #255,%d0
   fbc1e:	2f09           	movel %a1,%sp@-
   fbc20:	2f08           	movel %a0,%sp@-
   fbc22:	2f01           	movel %d1,%sp@-
   fbc24:	2f00           	movel %d0,%sp@-
   fbc26:	4eba fef8      	jsr %pc@(fbb20 <show_char>)
   fbc2a:	4fef 0010      	lea %sp@(16),%sp

}

void show_string(uint8_t x, uint8_t y, uint8_t palette, const char* s)
{
    while (*s)
   fbc2e:	202f 001c      	movel %sp@(28),%d0
   fbc32:	2040           	moveal %d0,%a0
   fbc34:	1010           	moveb %a0@,%d0
   fbc36:	4a00           	tstb %d0
   fbc38:	66a6           	bnes fbbe0 <show_string+0x20>
        show_char(x++, y, palette, *s++);
}
   fbc3a:	241f           	movel %sp@+,%d2
   fbc3c:	508f           	addql #8,%sp
   fbc3e:	4e75           	rts

000fbc40 <show_bits>:
void show_bits(uint8_t x,uint8_t y, uint8_t palette,uint16_t data)
{
   fbc40:	4fef fff4      	lea %sp@(-12),%sp
   fbc44:	2f02           	movel %d2,%sp@-
   fbc46:	226f 0014      	moveal %sp@(20),%a1
   fbc4a:	206f 0018      	moveal %sp@(24),%a0
   fbc4e:	222f 001c      	movel %sp@(28),%d1
   fbc52:	202f 0020      	movel %sp@(32),%d0
   fbc56:	3409           	movew %a1,%d2
   fbc58:	1f42 000a      	moveb %d2,%sp@(10)
   fbc5c:	3408           	movew %a0,%d2
   fbc5e:	1f42 0008      	moveb %d2,%sp@(8)
   fbc62:	1f41 0006      	moveb %d1,%sp@(6)
   fbc66:	3f40 0004      	movew %d0,%sp@(4)
    int bit;
    for (bit = 15; bit >= 0; bit--)
   fbc6a:	700f           	moveq #15,%d0
   fbc6c:	2f40 000c      	movel %d0,%sp@(12)
   fbc70:	604a           	bras fbcbc <show_bits+0x7c>
        show_char(x++, y, 0, (data & (1 << bit)) ? '1' : '0');
   fbc72:	7000           	moveq #0,%d0
   fbc74:	302f 0004      	movew %sp@(4),%d0
   fbc78:	222f 000c      	movel %sp@(12),%d1
   fbc7c:	e2a0           	asrl %d1,%d0
   fbc7e:	7401           	moveq #1,%d2
   fbc80:	c082           	andl %d2,%d0
   fbc82:	4a80           	tstl %d0
   fbc84:	6704           	beqs fbc8a <show_bits+0x4a>
   fbc86:	7031           	moveq #49,%d0
   fbc88:	6002           	bras fbc8c <show_bits+0x4c>
   fbc8a:	7030           	moveq #48,%d0
   fbc8c:	7200           	moveq #0,%d1
   fbc8e:	122f 0008      	moveb %sp@(8),%d1
   fbc92:	2041           	moveal %d1,%a0
   fbc94:	122f 000a      	moveb %sp@(10),%d1
   fbc98:	1401           	moveb %d1,%d2
   fbc9a:	5202           	addqb #1,%d2
   fbc9c:	1f42 000a      	moveb %d2,%sp@(10)
   fbca0:	1201           	moveb %d1,%d1
   fbca2:	0281 0000 00ff 	andil #255,%d1
   fbca8:	2f00           	movel %d0,%sp@-
   fbcaa:	42a7           	clrl %sp@-
   fbcac:	2f08           	movel %a0,%sp@-
   fbcae:	2f01           	movel %d1,%sp@-
   fbcb0:	4eba fe6e      	jsr %pc@(fbb20 <show_char>)
   fbcb4:	4fef 0010      	lea %sp@(16),%sp
        show_char(x++, y, palette, *s++);
}
void show_bits(uint8_t x,uint8_t y, uint8_t palette,uint16_t data)
{
    int bit;
    for (bit = 15; bit >= 0; bit--)
   fbcb8:	53af 000c      	subql #1,%sp@(12)
   fbcbc:	4aaf 000c      	tstl %sp@(12)
   fbcc0:	6cb0           	bges fbc72 <show_bits+0x32>
        show_char(x++, y, 0, (data & (1 << bit)) ? '1' : '0');
}
   fbcc2:	241f           	movel %sp@+,%d2
   fbcc4:	4fef 000c      	lea %sp@(12),%sp
   fbcc8:	4e75           	rts

000fbcca <show_line>:

void show_line(int x0, int y0, int x1, int y1, uint16_t c)
{
   fbcca:	4fef ffc8      	lea %sp@(-56),%sp
   fbcce:	2f03           	movel %d3,%sp@-
   fbcd0:	2f02           	movel %d2,%sp@-
   fbcd2:	202f 0054      	movel %sp@(84),%d0
   fbcd6:	3f40 000a      	movew %d0,%sp@(10)
    int dx = x1 - x0, dy = y1 - y0, k;
   fbcda:	202f 004c      	movel %sp@(76),%d0
   fbcde:	90af 0044      	subl %sp@(68),%d0
   fbce2:	2f40 0020      	movel %d0,%sp@(32)
   fbce6:	202f 0050      	movel %sp@(80),%d0
   fbcea:	90af 0048      	subl %sp@(72),%d0
   fbcee:	2f40 001c      	movel %d0,%sp@(28)
    double x = x0, y = y0, xIncre, yIncre, espl;
   fbcf2:	2f2f 0044      	movel %sp@(68),%sp@-
   fbcf6:	4eb9 000f cafc 	jsr fcafc <__floatsidf>
   fbcfc:	588f           	addql #4,%sp
   fbcfe:	2f40 0034      	movel %d0,%sp@(52)
   fbd02:	2f41 0038      	movel %d1,%sp@(56)
   fbd06:	2f2f 0048      	movel %sp@(72),%sp@-
   fbd0a:	4eb9 000f cafc 	jsr fcafc <__floatsidf>
   fbd10:	588f           	addql #4,%sp
   fbd12:	2f40 002c      	movel %d0,%sp@(44)
   fbd16:	2f41 0030      	movel %d1,%sp@(48)
    espl = abs(dy);
   fbd1a:	202f 001c      	movel %sp@(28),%d0
   fbd1e:	4a80           	tstl %d0
   fbd20:	6c02           	bges fbd24 <show_line+0x5a>
   fbd22:	4480           	negl %d0
   fbd24:	2f00           	movel %d0,%sp@-
   fbd26:	4eb9 000f cafc 	jsr fcafc <__floatsidf>
   fbd2c:	588f           	addql #4,%sp
   fbd2e:	2f40 0024      	movel %d0,%sp@(36)
   fbd32:	2f41 0028      	movel %d1,%sp@(40)
    if (abs(dx) > abs(dy))
   fbd36:	202f 0020      	movel %sp@(32),%d0
   fbd3a:	4a80           	tstl %d0
   fbd3c:	6c02           	bges fbd40 <show_line+0x76>
   fbd3e:	4480           	negl %d0
   fbd40:	2200           	movel %d0,%d1
   fbd42:	202f 001c      	movel %sp@(28),%d0
   fbd46:	4a80           	tstl %d0
   fbd48:	6c02           	bges fbd4c <show_line+0x82>
   fbd4a:	4480           	negl %d0
   fbd4c:	b081           	cmpl %d1,%d0
   fbd4e:	6c1c           	bges fbd6c <show_line+0xa2>
        espl = abs(dx);
   fbd50:	202f 0020      	movel %sp@(32),%d0
   fbd54:	4a80           	tstl %d0
   fbd56:	6c02           	bges fbd5a <show_line+0x90>
   fbd58:	4480           	negl %d0
   fbd5a:	2f00           	movel %d0,%sp@-
   fbd5c:	4eb9 000f cafc 	jsr fcafc <__floatsidf>
   fbd62:	588f           	addql #4,%sp
   fbd64:	2f40 0024      	movel %d0,%sp@(36)
   fbd68:	2f41 0028      	movel %d1,%sp@(40)
    xIncre = 1.0*dx / espl;
   fbd6c:	2f2f 0020      	movel %sp@(32),%sp@-
   fbd70:	4eb9 000f cafc 	jsr fcafc <__floatsidf>
   fbd76:	588f           	addql #4,%sp
   fbd78:	2f2f 0028      	movel %sp@(40),%sp@-
   fbd7c:	2f2f 0028      	movel %sp@(40),%sp@-
   fbd80:	2f01           	movel %d1,%sp@-
   fbd82:	2f00           	movel %d0,%sp@-
   fbd84:	4eb9 000f c494 	jsr fc494 <__divdf3>
   fbd8a:	4fef 0010      	lea %sp@(16),%sp
   fbd8e:	2f40 0014      	movel %d0,%sp@(20)
   fbd92:	2f41 0018      	movel %d1,%sp@(24)
    yIncre = 1.0*dy / espl;
   fbd96:	2f2f 001c      	movel %sp@(28),%sp@-
   fbd9a:	4eb9 000f cafc 	jsr fcafc <__floatsidf>
   fbda0:	588f           	addql #4,%sp
   fbda2:	2f2f 0028      	movel %sp@(40),%sp@-
   fbda6:	2f2f 0028      	movel %sp@(40),%sp@-
   fbdaa:	2f01           	movel %d1,%sp@-
   fbdac:	2f00           	movel %d0,%sp@-
   fbdae:	4eb9 000f c494 	jsr fc494 <__divdf3>
   fbdb4:	4fef 0010      	lea %sp@(16),%sp
   fbdb8:	2f40 000c      	movel %d0,%sp@(12)
   fbdbc:	2f41 0010      	movel %d1,%sp@(16)
    for (k = 0; k < espl; k++)
   fbdc0:	42af 003c      	clrl %sp@(60)
   fbdc4:	6000 0090      	braw fbe56 <show_line+0x18c>
    {
        show_char(x, y,0,c);
   fbdc8:	7600           	moveq #0,%d3
   fbdca:	362f 000a      	movew %sp@(10),%d3
   fbdce:	2f2f 0030      	movel %sp@(48),%sp@-
   fbdd2:	2f2f 0030      	movel %sp@(48),%sp@-
   fbdd6:	4eb9 000f c94c 	jsr fc94c <__fixunsdfsi>
   fbddc:	508f           	addql #8,%sp
   fbdde:	1000           	moveb %d0,%d0
   fbde0:	7400           	moveq #0,%d2
   fbde2:	1400           	moveb %d0,%d2
   fbde4:	2f2f 0038      	movel %sp@(56),%sp@-
   fbde8:	2f2f 0038      	movel %sp@(56),%sp@-
   fbdec:	4eb9 000f c94c 	jsr fc94c <__fixunsdfsi>
   fbdf2:	508f           	addql #8,%sp
   fbdf4:	1000           	moveb %d0,%d0
   fbdf6:	1000           	moveb %d0,%d0
   fbdf8:	0280 0000 00ff 	andil #255,%d0
   fbdfe:	2f03           	movel %d3,%sp@-
   fbe00:	42a7           	clrl %sp@-
   fbe02:	2f02           	movel %d2,%sp@-
   fbe04:	2f00           	movel %d0,%sp@-
   fbe06:	4eba fd18      	jsr %pc@(fbb20 <show_char>)
   fbe0a:	4fef 0010      	lea %sp@(16),%sp
        x += xIncre;
   fbe0e:	2f2f 0018      	movel %sp@(24),%sp@-
   fbe12:	2f2f 0018      	movel %sp@(24),%sp@-
   fbe16:	2f2f 0040      	movel %sp@(64),%sp@-
   fbe1a:	2f2f 0040      	movel %sp@(64),%sp@-
   fbe1e:	4eb9 000f bf50 	jsr fbf50 <__adddf3>
   fbe24:	4fef 0010      	lea %sp@(16),%sp
   fbe28:	2f40 0034      	movel %d0,%sp@(52)
   fbe2c:	2f41 0038      	movel %d1,%sp@(56)
        y += yIncre;
   fbe30:	2f2f 0010      	movel %sp@(16),%sp@-
   fbe34:	2f2f 0010      	movel %sp@(16),%sp@-
   fbe38:	2f2f 0038      	movel %sp@(56),%sp@-
   fbe3c:	2f2f 0038      	movel %sp@(56),%sp@-
   fbe40:	4eb9 000f bf50 	jsr fbf50 <__adddf3>
   fbe46:	4fef 0010      	lea %sp@(16),%sp
   fbe4a:	2f40 002c      	movel %d0,%sp@(44)
   fbe4e:	2f41 0030      	movel %d1,%sp@(48)
    espl = abs(dy);
    if (abs(dx) > abs(dy))
        espl = abs(dx);
    xIncre = 1.0*dx / espl;
    yIncre = 1.0*dy / espl;
    for (k = 0; k < espl; k++)
   fbe52:	52af 003c      	addql #1,%sp@(60)
   fbe56:	2f2f 003c      	movel %sp@(60),%sp@-
   fbe5a:	4eb9 000f cafc 	jsr fcafc <__floatsidf>
   fbe60:	588f           	addql #4,%sp
   fbe62:	2f2f 0028      	movel %sp@(40),%sp@-
   fbe66:	2f2f 0028      	movel %sp@(40),%sp@-
   fbe6a:	2f01           	movel %d1,%sp@-
   fbe6c:	2f00           	movel %d0,%sp@-
   fbe6e:	4eb9 000f c928 	jsr fc928 <__ltdf2>
   fbe74:	4fef 0010      	lea %sp@(16),%sp
   fbe78:	4a80           	tstl %d0
   fbe7a:	6d00 ff4c      	bltw fbdc8 <show_line+0xfe>
    {
        show_char(x, y,0,c);
        x += xIncre;
        y += yIncre;
    }
}
   fbe7e:	241f           	movel %sp@+,%d2
   fbe80:	261f           	movel %sp@+,%d3
   fbe82:	4fef 0038      	lea %sp@(56),%sp
   fbe86:	4e75           	rts

000fbe88 <show_rectangle>:
void show_rectangle(int x0, int y0, int w, int h)
{
   fbe88:	598f           	subql #4,%sp
    uint16_t c1='-';
   fbe8a:	3f7c 002d 0002 	movew #45,%sp@(2)
    //uint16_t c2='|';
    show_line(x0,   y0,   x0+w,  y0,   c1);//x
   fbe90:	7200           	moveq #0,%d1
   fbe92:	322f 0002      	movew %sp@(2),%d1
   fbe96:	202f 0008      	movel %sp@(8),%d0
   fbe9a:	d0af 0010      	addl %sp@(16),%d0
   fbe9e:	2f01           	movel %d1,%sp@-
   fbea0:	2f2f 0010      	movel %sp@(16),%sp@-
   fbea4:	2f00           	movel %d0,%sp@-
   fbea6:	2f2f 0018      	movel %sp@(24),%sp@-
   fbeaa:	2f2f 0018      	movel %sp@(24),%sp@-
   fbeae:	4eba fe1a      	jsr %pc@(fbcca <show_line>)
   fbeb2:	4fef 0014      	lea %sp@(20),%sp
    //show_line(x0,   y0,   x0,   y0+h,   c2);//y
    //show_line(x0+w,   y0,   x0+w,   y0+h,   c2);//y
    show_line(x0,   y0+h,  x0+w,   y0+h,   c1);//x
   fbeb6:	7000           	moveq #0,%d0
   fbeb8:	302f 0002      	movew %sp@(2),%d0
   fbebc:	2240           	moveal %d0,%a1
   fbebe:	206f 000c      	moveal %sp@(12),%a0
   fbec2:	d1ef 0014      	addal %sp@(20),%a0
   fbec6:	222f 0008      	movel %sp@(8),%d1
   fbeca:	d2af 0010      	addl %sp@(16),%d1
   fbece:	202f 000c      	movel %sp@(12),%d0
   fbed2:	d0af 0014      	addl %sp@(20),%d0
   fbed6:	2f09           	movel %a1,%sp@-
   fbed8:	2f08           	movel %a0,%sp@-
   fbeda:	2f01           	movel %d1,%sp@-
   fbedc:	2f00           	movel %d0,%sp@-
   fbede:	2f2f 0018      	movel %sp@(24),%sp@-
   fbee2:	4eba fde6      	jsr %pc@(fbcca <show_line>)
   fbee6:	4fef 0014      	lea %sp@(20),%sp
}
   fbeea:	588f           	addql #4,%sp
   fbeec:	4e75           	rts
	...

000fbef0 <Ld$den>:
   fbef0:	8087           	orl %d7,%d0
   fbef2:	3e3c 0003      	movew #3,%d7
   fbef6:	7c02           	moveq #2,%d6
   fbef8:	4ef9 000f c8ca 	jmp fc8ca <$_exception_handler>

000fbefe <Ld$infty>:
   fbefe:	203c 7ff0 0000 	movel #2146435072,%d0
   fbf04:	7200           	moveq #0,%d1
   fbf06:	8087           	orl %d7,%d0
   fbf08:	3e3c 0005      	movew #5,%d7
   fbf0c:	7c02           	moveq #2,%d6
   fbf0e:	4ef9 000f c8ca 	jmp fc8ca <$_exception_handler>

000fbf14 <Ld$underflow>:
   fbf14:	7000           	moveq #0,%d0
   fbf16:	2200           	movel %d0,%d1
   fbf18:	3e3c 0003      	movew #3,%d7
   fbf1c:	7c02           	moveq #2,%d6
   fbf1e:	4ef9 000f c8ca 	jmp fc8ca <$_exception_handler>

000fbf24 <Ld$inop>:
   fbf24:	70ff           	moveq #-1,%d0
   fbf26:	2200           	movel %d0,%d1
   fbf28:	3e3c 0011      	movew #17,%d7
   fbf2c:	7c02           	moveq #2,%d6
   fbf2e:	4ef9 000f c8ca 	jmp fc8ca <$_exception_handler>

000fbf34 <Ld$div$0>:
   fbf34:	203c 7ff0 0000 	movel #2146435072,%d0
   fbf3a:	7200           	moveq #0,%d1
   fbf3c:	8087           	orl %d7,%d0
   fbf3e:	3e3c 0009      	movew #9,%d7
   fbf42:	7c02           	moveq #2,%d6
   fbf44:	4ef9 000f c8ca 	jmp fc8ca <$_exception_handler>

000fbf4a <__subdf3>:
   fbf4a:	086f 001f 000c 	bchg #31,%sp@(12)

000fbf50 <__adddf3>:
   fbf50:	4e56 0000      	linkw %fp,#0
   fbf54:	48e7 3f00      	moveml %d2-%d7,%sp@-
   fbf58:	202e 0008      	movel %fp@(8),%d0
   fbf5c:	222e 000c      	movel %fp@(12),%d1
   fbf60:	242e 0010      	movel %fp@(16),%d2
   fbf64:	262e 0014      	movel %fp@(20),%d3
   fbf68:	2e00           	movel %d0,%d7
   fbf6a:	d281           	addl %d1,%d1
   fbf6c:	d180           	addxl %d0,%d0
   fbf6e:	6700 0286      	beqw fc1f6 <Ladddf$b>
   fbf72:	2c02           	movel %d2,%d6
   fbf74:	d683           	addl %d3,%d3
   fbf76:	d582           	addxl %d2,%d2
   fbf78:	6700 029a      	beqw fc214 <Ladddf$a>
   fbf7c:	0287 8000 0000 	andil #-2147483648,%d7
   fbf82:	4846           	swap %d6
   fbf84:	0246 8000      	andiw #-32768,%d6
   fbf88:	8e46           	orw %d6,%d7
   fbf8a:	2047           	moveal %d7,%a0
   fbf8c:	2c3c 001f ffff 	movel #2097151,%d6
   fbf92:	2e3c 0020 0000 	movel #2097152,%d7
   fbf98:	2800           	movel %d0,%d4
   fbf9a:	c086           	andl %d6,%d0
   fbf9c:	4686           	notl %d6
   fbf9e:	c886           	andl %d6,%d4
   fbfa0:	6700 0246      	beqw fc1e8 <Ladddf$a$den>
   fbfa4:	b886           	cmpl %d6,%d4
   fbfa6:	6700 02ca      	beqw fc272 <Ladddf$nf>
   fbfaa:	8087           	orl %d7,%d0

000fbfac <Ladddf$1>:
   fbfac:	4844           	swap %d4
   fbfae:	ea4c           	lsrw #5,%d4
   fbfb0:	2a02           	movel %d2,%d5
   fbfb2:	ca86           	andl %d6,%d5
   fbfb4:	6700 0238      	beqw fc1ee <Ladddf$b$den>
   fbfb8:	ba86           	cmpl %d6,%d5
   fbfba:	6700 02b6      	beqw fc272 <Ladddf$nf>
   fbfbe:	4686           	notl %d6
   fbfc0:	c486           	andl %d6,%d2
   fbfc2:	8487           	orl %d7,%d2

000fbfc4 <Ladddf$2>:
   fbfc4:	4845           	swap %d5
   fbfc6:	ea4d           	lsrw #5,%d5
   fbfc8:	48e7 0030      	moveml %a2-%a3,%sp@-
   fbfcc:	2444           	moveal %d4,%a2
   fbfce:	2645           	moveal %d5,%a3
   fbfd0:	7e00           	moveq #0,%d7
   fbfd2:	2c07           	movel %d7,%d6
   fbfd4:	2a03           	movel %d3,%d5
   fbfd6:	2802           	movel %d2,%d4
   fbfd8:	2607           	movel %d7,%d3
   fbfda:	2407           	movel %d7,%d2
   fbfdc:	c98a           	exg %d4,%a2
   fbfde:	cb8b           	exg %d5,%a3
   fbfe0:	ba44           	cmpw %d4,%d5
   fbfe2:	6700 00cc      	beqw fc0b0 <Ladddf$3>
   fbfe6:	6200 0064      	bhiw fc04c <Ladddf$2+0x88>
   fbfea:	3404           	movew %d4,%d2
   fbfec:	9445           	subw %d5,%d2
   fbfee:	c98a           	exg %d4,%a2
   fbff0:	cb8b           	exg %d5,%a3
   fbff2:	0c42 0037      	cmpiw #55,%d2
   fbff6:	6c00 01d2      	bgew fc1ca <Ladddf$b$small>
   fbffa:	0c42 0020      	cmpiw #32,%d2
   fbffe:	6c00 0022      	bgew fc022 <Ladddf$2+0x5e>
   fc002:	0c42 0010      	cmpiw #16,%d2
   fc006:	6c00 002a      	bgew fc032 <Ladddf$2+0x6e>
   fc00a:	6000 000a      	braw fc016 <Ladddf$2+0x52>
   fc00e:	e28c           	lsrl #1,%d4
   fc010:	e295           	roxrl #1,%d5
   fc012:	e296           	roxrl #1,%d6
   fc014:	e297           	roxrl #1,%d7
   fc016:	51ca fff6      	dbf %d2,fc00e <Ladddf$2+0x4a>
   fc01a:	7400           	moveq #0,%d2
   fc01c:	2602           	movel %d2,%d3
   fc01e:	6000 0094      	braw fc0b4 <Ladddf$4>
   fc022:	2e06           	movel %d6,%d7
   fc024:	2c05           	movel %d5,%d6
   fc026:	2a04           	movel %d4,%d5
   fc028:	7800           	moveq #0,%d4
   fc02a:	0442 0020      	subiw #32,%d2
   fc02e:	6000 ffd2      	braw fc002 <Ladddf$2+0x3e>
   fc032:	3e06           	movew %d6,%d7
   fc034:	4847           	swap %d7
   fc036:	3c05           	movew %d5,%d6
   fc038:	4846           	swap %d6
   fc03a:	3a04           	movew %d4,%d5
   fc03c:	4845           	swap %d5
   fc03e:	383c 0000      	movew #0,%d4
   fc042:	4844           	swap %d4
   fc044:	0442 0010      	subiw #16,%d2
   fc048:	6000 ffcc      	braw fc016 <Ladddf$2+0x52>
   fc04c:	c945           	exg %d4,%d5
   fc04e:	3c04           	movew %d4,%d6
   fc050:	9c45           	subw %d5,%d6
   fc052:	c98a           	exg %d4,%a2
   fc054:	cb8b           	exg %d5,%a3
   fc056:	0c46 0037      	cmpiw #55,%d6
   fc05a:	6c00 0150      	bgew fc1ac <Ladddf$a$small>
   fc05e:	0c46 0020      	cmpiw #32,%d6
   fc062:	6c00 0022      	bgew fc086 <Ladddf$2+0xc2>
   fc066:	0c46 0010      	cmpiw #16,%d6
   fc06a:	6c00 002a      	bgew fc096 <Ladddf$2+0xd2>
   fc06e:	6000 000a      	braw fc07a <Ladddf$2+0xb6>
   fc072:	e288           	lsrl #1,%d0
   fc074:	e291           	roxrl #1,%d1
   fc076:	e292           	roxrl #1,%d2
   fc078:	e293           	roxrl #1,%d3
   fc07a:	51ce fff6      	dbf %d6,fc072 <Ladddf$2+0xae>
   fc07e:	7e00           	moveq #0,%d7
   fc080:	2c07           	movel %d7,%d6
   fc082:	6000 0030      	braw fc0b4 <Ladddf$4>
   fc086:	2602           	movel %d2,%d3
   fc088:	2401           	movel %d1,%d2
   fc08a:	2200           	movel %d0,%d1
   fc08c:	7000           	moveq #0,%d0
   fc08e:	0446 0020      	subiw #32,%d6
   fc092:	6000 ffd2      	braw fc066 <Ladddf$2+0xa2>
   fc096:	3602           	movew %d2,%d3
   fc098:	4843           	swap %d3
   fc09a:	3401           	movew %d1,%d2
   fc09c:	4842           	swap %d2
   fc09e:	3200           	movew %d0,%d1
   fc0a0:	4841           	swap %d1
   fc0a2:	303c 0000      	movew #0,%d0
   fc0a6:	4840           	swap %d0
   fc0a8:	0446 0010      	subiw #16,%d6
   fc0ac:	6000 ffcc      	braw fc07a <Ladddf$2+0xb6>

000fc0b0 <Ladddf$3>:
   fc0b0:	c98a           	exg %d4,%a2
   fc0b2:	cb8b           	exg %d5,%a3

000fc0b4 <Ladddf$4>:
   fc0b4:	cf88           	exg %d7,%a0
   fc0b6:	cd8b           	exg %d6,%a3
   fc0b8:	2c07           	movel %d7,%d6
   fc0ba:	3e3c 0000      	movew #0,%d7
   fc0be:	4846           	swap %d6
   fc0c0:	3c3c 0000      	movew #0,%d6
   fc0c4:	bf86           	eorl %d7,%d6
   fc0c6:	6b00 006e      	bmiw fc136 <Lsubdf$0>
   fc0ca:	cf88           	exg %d7,%a0
   fc0cc:	cd8b           	exg %d6,%a3
   fc0ce:	d687           	addl %d7,%d3
   fc0d0:	d586           	addxl %d6,%d2
   fc0d2:	d385           	addxl %d5,%d1
   fc0d4:	d184           	addxl %d4,%d0
   fc0d6:	280a           	movel %a2,%d4
   fc0d8:	2e08           	movel %a0,%d7
   fc0da:	0287 8000 0000 	andil #-2147483648,%d7
   fc0e0:	4cdf 0c00      	moveml %sp@+,%a2-%a3
   fc0e4:	0800 0036      	btst #54,%d0
   fc0e8:	6700 000c      	beqw fc0f6 <Ladddf$4+0x42>
   fc0ec:	e288           	lsrl #1,%d0
   fc0ee:	e291           	roxrl #1,%d1
   fc0f0:	e292           	roxrl #1,%d2
   fc0f2:	e293           	roxrl #1,%d3
   fc0f4:	5244           	addqw #1,%d4
   fc0f6:	41fa 0020      	lea %pc@(fc118 <Ladddf$5>),%a0
   fc0fa:	43f9 0081 0000 	lea 810000 <_fpCCR>,%a1
   fc100:	3c29 0006      	movew %a1@(6),%d6
   fc104:	6700 0750      	beqw fc856 <Lround$to$nearest>
   fc108:	0c46 0002      	cmpiw #2,%d6
   fc10c:	6200 07ac      	bhiw fc8ba <Lround$to$minus>
   fc110:	6d00 07a8      	bltw fc8ba <Lround$to$minus>
   fc114:	6000 07a4      	braw fc8ba <Lround$to$minus>

000fc118 <Ladddf$5>:
   fc118:	0c44 07ff      	cmpiw #2047,%d4
   fc11c:	6c00 0012      	bgew fc130 <Ladddf$5+0x18>
   fc120:	0880 0034      	bclr #52,%d0
   fc124:	e94c           	lslw #4,%d4
   fc126:	4840           	swap %d0
   fc128:	8044           	orw %d4,%d0
   fc12a:	4840           	swap %d0
   fc12c:	6000 0128      	braw fc256 <Ladddf$ret>
   fc130:	7a01           	moveq #1,%d5
   fc132:	6000 fdca      	braw fbefe <Ld$infty>

000fc136 <Lsubdf$0>:
   fc136:	cf88           	exg %d7,%a0
   fc138:	cd8b           	exg %d6,%a3
   fc13a:	9687           	subl %d7,%d3
   fc13c:	9586           	subxl %d6,%d2
   fc13e:	9385           	subxl %d5,%d1
   fc140:	9184           	subxl %d4,%d0
   fc142:	6700 010e      	beqw fc252 <Ladddf$ret$1>
   fc146:	6a00 0012      	bplw fc15a <Lsubdf$0+0x24>
   fc14a:	2e08           	movel %a0,%d7
   fc14c:	0847 001f      	bchg #31,%d7
   fc150:	2047           	moveal %d7,%a0
   fc152:	4483           	negl %d3
   fc154:	4082           	negxl %d2
   fc156:	4081           	negxl %d1
   fc158:	4080           	negxl %d0
   fc15a:	280a           	movel %a2,%d4
   fc15c:	2e08           	movel %a0,%d7
   fc15e:	0287 8000 0000 	andil #-2147483648,%d7
   fc164:	4cdf 0c00      	moveml %sp@+,%a2-%a3
   fc168:	0800 0036      	btst #54,%d0
   fc16c:	6700 000c      	beqw fc17a <Lsubdf$0+0x44>
   fc170:	e288           	lsrl #1,%d0
   fc172:	e291           	roxrl #1,%d1
   fc174:	e292           	roxrl #1,%d2
   fc176:	e293           	roxrl #1,%d3
   fc178:	5244           	addqw #1,%d4
   fc17a:	41fa 0020      	lea %pc@(fc19c <Lsubdf$1>),%a0
   fc17e:	43f9 0081 0000 	lea 810000 <_fpCCR>,%a1
   fc184:	3c29 0006      	movew %a1@(6),%d6
   fc188:	6700 06cc      	beqw fc856 <Lround$to$nearest>
   fc18c:	0c46 0002      	cmpiw #2,%d6
   fc190:	6200 0728      	bhiw fc8ba <Lround$to$minus>
   fc194:	6d00 0724      	bltw fc8ba <Lround$to$minus>
   fc198:	6000 0720      	braw fc8ba <Lround$to$minus>

000fc19c <Lsubdf$1>:
   fc19c:	0880 0034      	bclr #52,%d0
   fc1a0:	e94c           	lslw #4,%d4
   fc1a2:	4840           	swap %d0
   fc1a4:	8044           	orw %d4,%d0
   fc1a6:	4840           	swap %d0
   fc1a8:	6000 00ac      	braw fc256 <Ladddf$ret>

000fc1ac <Ladddf$a$small>:
   fc1ac:	4cdf 0c00      	moveml %sp@+,%a2-%a3
   fc1b0:	202e 0010      	movel %fp@(16),%d0
   fc1b4:	222e 0014      	movel %fp@(20),%d1
   fc1b8:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc1be:	30bc 0000      	movew #0,%a0@
   fc1c2:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc1c6:	4e5e           	unlk %fp
   fc1c8:	4e75           	rts

000fc1ca <Ladddf$b$small>:
   fc1ca:	4cdf 0c00      	moveml %sp@+,%a2-%a3
   fc1ce:	202e 0008      	movel %fp@(8),%d0
   fc1d2:	222e 000c      	movel %fp@(12),%d1
   fc1d6:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc1dc:	30bc 0000      	movew #0,%a0@
   fc1e0:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc1e4:	4e5e           	unlk %fp
   fc1e6:	4e75           	rts

000fc1e8 <Ladddf$a$den>:
   fc1e8:	2807           	movel %d7,%d4
   fc1ea:	6000 fdc0      	braw fbfac <Ladddf$1>

000fc1ee <Ladddf$b$den>:
   fc1ee:	2a07           	movel %d7,%d5
   fc1f0:	4686           	notl %d6
   fc1f2:	6000 fdd0      	braw fbfc4 <Ladddf$2>

000fc1f6 <Ladddf$b>:
   fc1f6:	2002           	movel %d2,%d0
   fc1f8:	2203           	movel %d3,%d1
   fc1fa:	6600 0020      	bnew fc21c <Ladddf$a+0x8>
   fc1fe:	0c80 8000 0000 	cmpil #-2147483648,%d0
   fc204:	6600 0016      	bnew fc21c <Ladddf$a+0x8>
   fc208:	0287 8000 0000 	andil #-2147483648,%d7
   fc20e:	4280           	clrl %d0
   fc210:	6000 0044      	braw fc256 <Ladddf$ret>

000fc214 <Ladddf$a>:
   fc214:	202e 0008      	movel %fp@(8),%d0
   fc218:	222e 000c      	movel %fp@(12),%d1
   fc21c:	7a01           	moveq #1,%d5
   fc21e:	2e00           	movel %d0,%d7
   fc220:	0287 8000 0000 	andil #-2147483648,%d7
   fc226:	0880 001f      	bclr #31,%d0
   fc22a:	0c80 7ff0 0000 	cmpil #2146435072,%d0
   fc230:	6c00 0010      	bgew fc242 <Ladddf$a+0x2e>
   fc234:	2000           	movel %d0,%d0
   fc236:	6600 001e      	bnew fc256 <Ladddf$ret>
   fc23a:	0887 001f      	bclr #31,%d7
   fc23e:	6000 0016      	braw fc256 <Ladddf$ret>
   fc242:	0280 000f ffff 	andil #1048575,%d0
   fc248:	8081           	orl %d1,%d0
   fc24a:	6600 fcd8      	bnew fbf24 <Ld$inop>
   fc24e:	6000 fcae      	braw fbefe <Ld$infty>

000fc252 <Ladddf$ret$1>:
   fc252:	4cdf 0c00      	moveml %sp@+,%a2-%a3

000fc256 <Ladddf$ret>:
   fc256:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc25c:	30bc 0000      	movew #0,%a0@
   fc260:	8087           	orl %d7,%d0
   fc262:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc266:	4e5e           	unlk %fp
   fc268:	4e75           	rts

000fc26a <Ladddf$ret$den>:
   fc26a:	e288           	lsrl #1,%d0
   fc26c:	e291           	roxrl #1,%d1
   fc26e:	6000 ffe6      	braw fc256 <Ladddf$ret>

000fc272 <Ladddf$nf>:
   fc272:	7a01           	moveq #1,%d5
   fc274:	202e 0008      	movel %fp@(8),%d0
   fc278:	222e 000c      	movel %fp@(12),%d1
   fc27c:	242e 0010      	movel %fp@(16),%d2
   fc280:	262e 0014      	movel %fp@(20),%d3
   fc284:	283c 7ff0 0000 	movel #2146435072,%d4
   fc28a:	2e00           	movel %d0,%d7
   fc28c:	2c02           	movel %d2,%d6
   fc28e:	0880 001f      	bclr #31,%d0
   fc292:	0882 001f      	bclr #31,%d2
   fc296:	b084           	cmpl %d4,%d0
   fc298:	6200 fc8a      	bhiw fbf24 <Ld$inop>
   fc29c:	6600 0008      	bnew fc2a6 <Ladddf$nf+0x34>
   fc2a0:	4a81           	tstl %d1
   fc2a2:	6600 fc80      	bnew fbf24 <Ld$inop>
   fc2a6:	b484           	cmpl %d4,%d2
   fc2a8:	6200 fc7a      	bhiw fbf24 <Ld$inop>
   fc2ac:	6600 0008      	bnew fc2b6 <Ladddf$nf+0x44>
   fc2b0:	4a83           	tstl %d3
   fc2b2:	6600 fc70      	bnew fbf24 <Ld$inop>
   fc2b6:	bf86           	eorl %d7,%d6
   fc2b8:	6b00 000c      	bmiw fc2c6 <Ladddf$nf+0x54>
   fc2bc:	0287 8000 0000 	andil #-2147483648,%d7
   fc2c2:	6000 fc3a      	braw fbefe <Ld$infty>
   fc2c6:	b082           	cmpl %d2,%d0
   fc2c8:	6600 0008      	bnew fc2d2 <Ladddf$nf+0x60>
   fc2cc:	b283           	cmpl %d3,%d1
   fc2ce:	6700 fc54      	beqw fbf24 <Ld$inop>
   fc2d2:	0287 8000 0000 	andil #-2147483648,%d7
   fc2d8:	b084           	cmpl %d4,%d0
   fc2da:	6700 fc22      	beqw fbefe <Ld$infty>
   fc2de:	0847 001f      	bchg #31,%d7
   fc2e2:	6000 fc1a      	braw fbefe <Ld$infty>

000fc2e6 <__muldf3>:
   fc2e6:	4e56 0000      	linkw %fp,#0
   fc2ea:	48e7 3f00      	moveml %d2-%d7,%sp@-
   fc2ee:	202e 0008      	movel %fp@(8),%d0
   fc2f2:	222e 000c      	movel %fp@(12),%d1
   fc2f6:	242e 0010      	movel %fp@(16),%d2
   fc2fa:	262e 0014      	movel %fp@(20),%d3
   fc2fe:	2e00           	movel %d0,%d7
   fc300:	b587           	eorl %d2,%d7
   fc302:	0287 8000 0000 	andil #-2147483648,%d7
   fc308:	2047           	moveal %d7,%a0
   fc30a:	2e3c 7ff0 0000 	movel #2146435072,%d7
   fc310:	2c07           	movel %d7,%d6
   fc312:	4686           	notl %d6
   fc314:	0880 001f      	bclr #31,%d0
   fc318:	2800           	movel %d0,%d4
   fc31a:	8881           	orl %d1,%d4
   fc31c:	6700 0120      	beqw fc43e <Lmuldf$a$0>
   fc320:	2800           	movel %d0,%d4
   fc322:	0882 001f      	bclr #31,%d2
   fc326:	2a02           	movel %d2,%d5
   fc328:	8a83           	orl %d3,%d5
   fc32a:	6700 0106      	beqw fc432 <Lmuldf$b$0>
   fc32e:	2a02           	movel %d2,%d5
   fc330:	b087           	cmpl %d7,%d0
   fc332:	6200 00dc      	bhiw fc410 <Lmuldf$inop>
   fc336:	6700 00ec      	beqw fc424 <Lmuldf$a$nf>
   fc33a:	b487           	cmpl %d7,%d2
   fc33c:	6200 00d2      	bhiw fc410 <Lmuldf$inop>
   fc340:	6700 00d4      	beqw fc416 <Lmuldf$b$nf>
   fc344:	c887           	andl %d7,%d4
   fc346:	6700 0120      	beqw fc468 <Lmuldf$a$den>
   fc34a:	c086           	andl %d6,%d0
   fc34c:	0080 0010 0000 	oril #1048576,%d0
   fc352:	4844           	swap %d4
   fc354:	e84c           	lsrw #4,%d4

000fc356 <Lmuldf$1>:
   fc356:	ca87           	andl %d7,%d5
   fc358:	6700 0124      	beqw fc47e <Lmuldf$b$den>
   fc35c:	c486           	andl %d6,%d2
   fc35e:	0082 0010 0000 	oril #1048576,%d2
   fc364:	4845           	swap %d5
   fc366:	e84d           	lsrw #4,%d5

000fc368 <Lmuldf$2>:
   fc368:	d845           	addw %d5,%d4
   fc36a:	0444 03ff      	subiw #1023,%d4
   fc36e:	48e7 0030      	moveml %a2-%a3,%sp@-
   fc372:	247c 0000 0000 	moveal #0,%a2
   fc378:	2644           	moveal %d4,%a3
   fc37a:	ea9a           	rorl #5,%d2
   fc37c:	4842           	swap %d2
   fc37e:	ea9b           	rorl #5,%d3
   fc380:	4843           	swap %d3
   fc382:	3c03           	movew %d3,%d6
   fc384:	0246 07ff      	andiw #2047,%d6
   fc388:	8446           	orw %d6,%d2
   fc38a:	0243 f800      	andiw #-2048,%d3
   fc38e:	2c02           	movel %d2,%d6
   fc390:	2e03           	movel %d3,%d7
   fc392:	2800           	movel %d0,%d4
   fc394:	2a01           	movel %d1,%d5
   fc396:	7600           	moveq #0,%d3
   fc398:	2403           	movel %d3,%d2
   fc39a:	2203           	movel %d3,%d1
   fc39c:	2003           	movel %d3,%d0
   fc39e:	227c 0000 0034 	moveal #52,%a1
   fc3a4:	cf89           	exg %d7,%a1
   fc3a6:	cf89           	exg %d7,%a1
   fc3a8:	d683           	addl %d3,%d3
   fc3aa:	d582           	addxl %d2,%d2
   fc3ac:	d381           	addxl %d1,%d1
   fc3ae:	d180           	addxl %d0,%d0
   fc3b0:	de87           	addl %d7,%d7
   fc3b2:	dd86           	addxl %d6,%d6
   fc3b4:	6400 000e      	bccw fc3c4 <Lmuldf$2+0x5c>
   fc3b8:	cf8a           	exg %d7,%a2
   fc3ba:	d685           	addl %d5,%d3
   fc3bc:	d584           	addxl %d4,%d2
   fc3be:	d387           	addxl %d7,%d1
   fc3c0:	d187           	addxl %d7,%d0
   fc3c2:	cf8a           	exg %d7,%a2
   fc3c4:	cf89           	exg %d7,%a1
   fc3c6:	51cf ffde      	dbf %d7,fc3a6 <Lmuldf$2+0x3e>
   fc3ca:	280b           	movel %a3,%d4
   fc3cc:	4cdf 0c00      	moveml %sp@+,%a2-%a3
   fc3d0:	4840           	swap %d0
   fc3d2:	4841           	swap %d1
   fc3d4:	3001           	movew %d1,%d0
   fc3d6:	4842           	swap %d2
   fc3d8:	3202           	movew %d2,%d1
   fc3da:	4843           	swap %d3
   fc3dc:	3403           	movew %d3,%d2
   fc3de:	363c 0000      	movew #0,%d3
   fc3e2:	e288           	lsrl #1,%d0
   fc3e4:	e291           	roxrl #1,%d1
   fc3e6:	e292           	roxrl #1,%d2
   fc3e8:	e293           	roxrl #1,%d3
   fc3ea:	e288           	lsrl #1,%d0
   fc3ec:	e291           	roxrl #1,%d1
   fc3ee:	e292           	roxrl #1,%d2
   fc3f0:	e293           	roxrl #1,%d3
   fc3f2:	e288           	lsrl #1,%d0
   fc3f4:	e291           	roxrl #1,%d1
   fc3f6:	e292           	roxrl #1,%d2
   fc3f8:	e293           	roxrl #1,%d3
   fc3fa:	2e08           	movel %a0,%d7
   fc3fc:	7a02           	moveq #2,%d5
   fc3fe:	0800 0016      	btst #22,%d0
   fc402:	6700 027a      	beqw fc67e <Lround$exit>
   fc406:	e288           	lsrl #1,%d0
   fc408:	e291           	roxrl #1,%d1
   fc40a:	5244           	addqw #1,%d4
   fc40c:	6000 0270      	braw fc67e <Lround$exit>

000fc410 <Lmuldf$inop>:
   fc410:	7a02           	moveq #2,%d5
   fc412:	6000 fb10      	braw fbf24 <Ld$inop>

000fc416 <Lmuldf$b$nf>:
   fc416:	7a02           	moveq #2,%d5
   fc418:	2e08           	movel %a0,%d7
   fc41a:	4a83           	tstl %d3
   fc41c:	6600 fb06      	bnew fbf24 <Ld$inop>
   fc420:	6000 fadc      	braw fbefe <Ld$infty>

000fc424 <Lmuldf$a$nf>:
   fc424:	7a02           	moveq #2,%d5
   fc426:	2e08           	movel %a0,%d7
   fc428:	4a81           	tstl %d1
   fc42a:	6600 faf8      	bnew fbf24 <Ld$inop>
   fc42e:	6000 face      	braw fbefe <Ld$infty>

000fc432 <Lmuldf$b$0>:
   fc432:	7a02           	moveq #2,%d5
   fc434:	c540           	exg %d2,%d0
   fc436:	c741           	exg %d3,%d1
   fc438:	2008           	movel %a0,%d0
   fc43a:	6000 0010      	braw fc44c <Lmuldf$a$0+0xe>

000fc43e <Lmuldf$a$0>:
   fc43e:	2008           	movel %a0,%d0
   fc440:	242e 0010      	movel %fp@(16),%d2
   fc444:	262e 0014      	movel %fp@(20),%d3
   fc448:	0882 001f      	bclr #31,%d2
   fc44c:	0c82 7ff0 0000 	cmpil #2146435072,%d2
   fc452:	6c00 fad0      	bgew fbf24 <Ld$inop>
   fc456:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc45c:	30bc 0000      	movew #0,%a0@
   fc460:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc464:	4e5e           	unlk %fp
   fc466:	4e75           	rts

000fc468 <Lmuldf$a$den>:
   fc468:	7801           	moveq #1,%d4
   fc46a:	c086           	andl %d6,%d0
   fc46c:	d281           	addl %d1,%d1
   fc46e:	d180           	addxl %d0,%d0
   fc470:	5344           	subqw #1,%d4
   fc472:	0800 0014      	btst #20,%d0
   fc476:	6600 fede      	bnew fc356 <Lmuldf$1>
   fc47a:	6000 fff0      	braw fc46c <Lmuldf$a$den+0x4>

000fc47e <Lmuldf$b$den>:
   fc47e:	7a01           	moveq #1,%d5
   fc480:	c486           	andl %d6,%d2
   fc482:	d683           	addl %d3,%d3
   fc484:	d582           	addxl %d2,%d2
   fc486:	5345           	subqw #1,%d5
   fc488:	0802 0014      	btst #20,%d2
   fc48c:	6600 feda      	bnew fc368 <Lmuldf$2>
   fc490:	6000 fff0      	braw fc482 <Lmuldf$b$den+0x4>

000fc494 <__divdf3>:
   fc494:	4e56 0000      	linkw %fp,#0
   fc498:	48e7 3f00      	moveml %d2-%d7,%sp@-
   fc49c:	202e 0008      	movel %fp@(8),%d0
   fc4a0:	222e 000c      	movel %fp@(12),%d1
   fc4a4:	242e 0010      	movel %fp@(16),%d2
   fc4a8:	262e 0014      	movel %fp@(20),%d3
   fc4ac:	2e00           	movel %d0,%d7
   fc4ae:	b587           	eorl %d2,%d7
   fc4b0:	0287 8000 0000 	andil #-2147483648,%d7
   fc4b6:	2047           	moveal %d7,%a0
   fc4b8:	2e3c 7ff0 0000 	movel #2146435072,%d7
   fc4be:	2c07           	movel %d7,%d6
   fc4c0:	4686           	notl %d6
   fc4c2:	0880 001f      	bclr #31,%d0
   fc4c6:	2800           	movel %d0,%d4
   fc4c8:	8881           	orl %d1,%d4
   fc4ca:	6700 0112      	beqw fc5de <Ldivdf$a$0>
   fc4ce:	2800           	movel %d0,%d4
   fc4d0:	0882 001f      	bclr #31,%d2
   fc4d4:	2a02           	movel %d2,%d5
   fc4d6:	8a83           	orl %d3,%d5
   fc4d8:	6700 013c      	beqw fc616 <Ldivdf$b$0>
   fc4dc:	2a02           	movel %d2,%d5
   fc4de:	b087           	cmpl %d7,%d0
   fc4e0:	6200 00f6      	bhiw fc5d8 <Ldivdf$inop>
   fc4e4:	6700 0154      	beqw fc63a <Ldivdf$a$nf>
   fc4e8:	b487           	cmpl %d7,%d2
   fc4ea:	6200 00ec      	bhiw fc5d8 <Ldivdf$inop>
   fc4ee:	6700 013e      	beqw fc62e <Ldivdf$b$nf>
   fc4f2:	c887           	andl %d7,%d4
   fc4f4:	6700 015c      	beqw fc652 <Ldivdf$a$den>
   fc4f8:	c086           	andl %d6,%d0
   fc4fa:	0080 0010 0000 	oril #1048576,%d0
   fc500:	4844           	swap %d4
   fc502:	e84c           	lsrw #4,%d4

000fc504 <Ldivdf$1>:
   fc504:	ca87           	andl %d7,%d5
   fc506:	6700 0160      	beqw fc668 <Ldivdf$b$den>
   fc50a:	c486           	andl %d6,%d2
   fc50c:	0082 0010 0000 	oril #1048576,%d2
   fc512:	4845           	swap %d5
   fc514:	e84d           	lsrw #4,%d5

000fc516 <Ldivdf$2>:
   fc516:	9845           	subw %d5,%d4
   fc518:	0644 03fe      	addiw #1022,%d4
   fc51c:	7c00           	moveq #0,%d6
   fc51e:	2e06           	movel %d6,%d7
   fc520:	227c 0000 0000 	moveal #0,%a1
   fc526:	7a16           	moveq #22,%d5
   fc528:	b480           	cmpl %d0,%d2
   fc52a:	6200 000c      	bhiw fc538 <Ldivdf$2+0x22>
   fc52e:	6700 0014      	beqw fc544 <Ldivdf$2+0x2e>
   fc532:	9283           	subl %d3,%d1
   fc534:	9182           	subxl %d2,%d0
   fc536:	0bc6           	bset %d5,%d6
   fc538:	d281           	addl %d1,%d1
   fc53a:	d180           	addxl %d0,%d0
   fc53c:	51cd ffea      	dbf %d5,fc528 <Ldivdf$2+0x12>
   fc540:	6000 000c      	braw fc54e <Ldivdf$2+0x38>
   fc544:	b681           	cmpl %d1,%d3
   fc546:	6200 fff0      	bhiw fc538 <Ldivdf$2+0x22>
   fc54a:	6000 ffe6      	braw fc532 <Ldivdf$2+0x1c>
   fc54e:	7a1f           	moveq #31,%d5
   fc550:	b480           	cmpl %d0,%d2
   fc552:	6200 000c      	bhiw fc560 <Ldivdf$2+0x4a>
   fc556:	6700 0014      	beqw fc56c <Ldivdf$2+0x56>
   fc55a:	9283           	subl %d3,%d1
   fc55c:	9182           	subxl %d2,%d0
   fc55e:	0bc7           	bset %d5,%d7
   fc560:	d281           	addl %d1,%d1
   fc562:	d180           	addxl %d0,%d0
   fc564:	51cd ffea      	dbf %d5,fc550 <Ldivdf$2+0x3a>
   fc568:	6000 000c      	braw fc576 <Ldivdf$2+0x60>
   fc56c:	b681           	cmpl %d1,%d3
   fc56e:	6200 fff0      	bhiw fc560 <Ldivdf$2+0x4a>
   fc572:	6000 ffe6      	braw fc55a <Ldivdf$2+0x44>
   fc576:	7a35           	moveq #53,%d5
   fc578:	b082           	cmpl %d2,%d0
   fc57a:	6200 001c      	bhiw fc598 <Ldivdf$2+0x82>
   fc57e:	6700 0012      	beqw fc592 <Ldivdf$2+0x7c>
   fc582:	d281           	addl %d1,%d1
   fc584:	d180           	addxl %d0,%d0
   fc586:	51cd fff0      	dbf %d5,fc578 <Ldivdf$2+0x62>
   fc58a:	7400           	moveq #0,%d2
   fc58c:	2602           	movel %d2,%d3
   fc58e:	6000 0028      	braw fc5b8 <Ldivdf$2+0xa2>
   fc592:	b681           	cmpl %d1,%d3
   fc594:	6200 ffec      	bhiw fc582 <Ldivdf$2+0x6c>
   fc598:	7400           	moveq #0,%d2
   fc59a:	2602           	movel %d2,%d3
   fc59c:	0445 0035      	subiw #53,%d5
   fc5a0:	0645 003f      	addiw #63,%d5
   fc5a4:	0c45 001f      	cmpiw #31,%d5
   fc5a8:	6200 000c      	bhiw fc5b6 <Ldivdf$2+0xa0>
   fc5ac:	0bc3           	bset %d5,%d3
   fc5ae:	6000 0008      	braw fc5b8 <Ldivdf$2+0xa2>
   fc5b2:	0445 0020      	subiw #32,%d5
   fc5b6:	0bc2           	bset %d5,%d2
   fc5b8:	2006           	movel %d6,%d0
   fc5ba:	2207           	movel %d7,%d1
   fc5bc:	7600           	moveq #0,%d3
   fc5be:	0800 0016      	btst #22,%d0
   fc5c2:	6700 000c      	beqw fc5d0 <Ldivdf$2+0xba>
   fc5c6:	e288           	lsrl #1,%d0
   fc5c8:	e291           	roxrl #1,%d1
   fc5ca:	e292           	roxrl #1,%d2
   fc5cc:	e293           	roxrl #1,%d3
   fc5ce:	5244           	addqw #1,%d4
   fc5d0:	2e08           	movel %a0,%d7
   fc5d2:	7a03           	moveq #3,%d5
   fc5d4:	6000 00a8      	braw fc67e <Lround$exit>

000fc5d8 <Ldivdf$inop>:
   fc5d8:	7a03           	moveq #3,%d5
   fc5da:	6000 f948      	braw fbf24 <Ld$inop>

000fc5de <Ldivdf$a$0>:
   fc5de:	7a03           	moveq #3,%d5
   fc5e0:	0882 001f      	bclr #31,%d2
   fc5e4:	2802           	movel %d2,%d4
   fc5e6:	8883           	orl %d3,%d4
   fc5e8:	6700 f93a      	beqw fbf24 <Ld$inop>
   fc5ec:	0c82 7ff0 0000 	cmpil #2146435072,%d2
   fc5f2:	6200 f930      	bhiw fbf24 <Ld$inop>
   fc5f6:	6d00 0008      	bltw fc600 <Ldivdf$a$0+0x22>
   fc5fa:	4a83           	tstl %d3
   fc5fc:	6600 f926      	bnew fbf24 <Ld$inop>
   fc600:	2008           	movel %a0,%d0
   fc602:	7200           	moveq #0,%d1
   fc604:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc60a:	30bc 0000      	movew #0,%a0@
   fc60e:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc612:	4e5e           	unlk %fp
   fc614:	4e75           	rts

000fc616 <Ldivdf$b$0>:
   fc616:	7a03           	moveq #3,%d5
   fc618:	2e08           	movel %a0,%d7
   fc61a:	0c80 7ff0 0000 	cmpil #2146435072,%d0
   fc620:	6200 f902      	bhiw fbf24 <Ld$inop>
   fc624:	4a81           	tstl %d1
   fc626:	6600 f8fc      	bnew fbf24 <Ld$inop>
   fc62a:	6000 f908      	braw fbf34 <Ld$div$0>

000fc62e <Ldivdf$b$nf>:
   fc62e:	7a03           	moveq #3,%d5
   fc630:	4a83           	tstl %d3
   fc632:	6600 f8f0      	bnew fbf24 <Ld$inop>
   fc636:	6000 f8dc      	braw fbf14 <Ld$underflow>

000fc63a <Ldivdf$a$nf>:
   fc63a:	7a03           	moveq #3,%d5
   fc63c:	4a81           	tstl %d1
   fc63e:	6600 f8e4      	bnew fbf24 <Ld$inop>
   fc642:	b487           	cmpl %d7,%d2
   fc644:	6c00 f8de      	bgew fbf24 <Ld$inop>
   fc648:	4a83           	tstl %d3
   fc64a:	6600 f8d8      	bnew fbf24 <Ld$inop>
   fc64e:	6000 f8ae      	braw fbefe <Ld$infty>

000fc652 <Ldivdf$a$den>:
   fc652:	7801           	moveq #1,%d4
   fc654:	c086           	andl %d6,%d0
   fc656:	d281           	addl %d1,%d1
   fc658:	d180           	addxl %d0,%d0
   fc65a:	5344           	subqw #1,%d4
   fc65c:	0800 0014      	btst #20,%d0
   fc660:	6600 fea2      	bnew fc504 <Ldivdf$1>
   fc664:	6000 fff0      	braw fc656 <Ldivdf$a$den+0x4>

000fc668 <Ldivdf$b$den>:
   fc668:	7a01           	moveq #1,%d5
   fc66a:	c486           	andl %d6,%d2
   fc66c:	d683           	addl %d3,%d3
   fc66e:	d582           	addxl %d2,%d2
   fc670:	5345           	subqw #1,%d5
   fc672:	0802 0014      	btst #20,%d2
   fc676:	6600 fe9e      	bnew fc516 <Ldivdf$2>
   fc67a:	6000 fff0      	braw fc66c <Ldivdf$b$den+0x4>

000fc67e <Lround$exit>:
   fc67e:	0c44 ffca      	cmpiw #-54,%d4
   fc682:	6d00 f890      	bltw fbf14 <Ld$underflow>
   fc686:	2047           	moveal %d7,%a0
   fc688:	7c00           	moveq #0,%d6
   fc68a:	2e06           	movel %d6,%d7
   fc68c:	0c44 0001      	cmpiw #1,%d4
   fc690:	6c00 0020      	bgew fc6b2 <Lround$exit+0x34>
   fc694:	5244           	addqw #1,%d4
   fc696:	e288           	lsrl #1,%d0
   fc698:	e291           	roxrl #1,%d1
   fc69a:	e292           	roxrl #1,%d2
   fc69c:	e293           	roxrl #1,%d3
   fc69e:	e296           	roxrl #1,%d6
   fc6a0:	e297           	roxrl #1,%d7
   fc6a2:	0c44 0001      	cmpiw #1,%d4
   fc6a6:	6700 000a      	beqw fc6b2 <Lround$exit+0x34>
   fc6aa:	6000 ffe8      	braw fc694 <Lround$exit+0x16>
   fc6ae:	6000 f864      	braw fbf14 <Ld$underflow>
   fc6b2:	8486           	orl %d6,%d2
   fc6b4:	8687           	orl %d7,%d3
   fc6b6:	2e08           	movel %a0,%d7
   fc6b8:	41fa 0020      	lea %pc@(fc6da <Lround$0>),%a0
   fc6bc:	43f9 0081 0000 	lea 810000 <_fpCCR>,%a1
   fc6c2:	3c29 0006      	movew %a1@(6),%d6
   fc6c6:	6700 018e      	beqw fc856 <Lround$to$nearest>
   fc6ca:	0c46 0002      	cmpiw #2,%d6
   fc6ce:	6200 01ea      	bhiw fc8ba <Lround$to$minus>
   fc6d2:	6d00 01e6      	bltw fc8ba <Lround$to$minus>
   fc6d6:	6000 01e2      	braw fc8ba <Lround$to$minus>

000fc6da <Lround$0>:
   fc6da:	0c44 07ff      	cmpiw #2047,%d4
   fc6de:	6c00 f81e      	bgew fbefe <Ld$infty>
   fc6e2:	3804           	movew %d4,%d4
   fc6e4:	6700 f80a      	beqw fbef0 <Ld$den>
   fc6e8:	e94c           	lslw #4,%d4
   fc6ea:	0880 0014      	bclr #20,%d0
   fc6ee:	4840           	swap %d0
   fc6f0:	8044           	orw %d4,%d0
   fc6f2:	4840           	swap %d0
   fc6f4:	8087           	orl %d7,%d0
   fc6f6:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc6fc:	30bc 0000      	movew #0,%a0@
   fc700:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc704:	4e5e           	unlk %fp
   fc706:	4e75           	rts

000fc708 <__negdf2>:
   fc708:	4e56 0000      	linkw %fp,#0
   fc70c:	48e7 3f00      	moveml %d2-%d7,%sp@-
   fc710:	7a04           	moveq #4,%d5
   fc712:	202e 0008      	movel %fp@(8),%d0
   fc716:	222e 000c      	movel %fp@(12),%d1
   fc71a:	0840 001f      	bchg #31,%d0
   fc71e:	2400           	movel %d0,%d2
   fc720:	0882 001f      	bclr #31,%d2
   fc724:	2802           	movel %d2,%d4
   fc726:	8881           	orl %d1,%d4
   fc728:	6700 0034      	beqw fc75e <__negdf2+0x56>
   fc72c:	0c82 7ff0 0000 	cmpil #2146435072,%d2
   fc732:	6d00 0018      	bltw fc74c <__negdf2+0x44>
   fc736:	6200 f7ec      	bhiw fbf24 <Ld$inop>
   fc73a:	4a81           	tstl %d1
   fc73c:	6600 f7e6      	bnew fbf24 <Ld$inop>
   fc740:	2e00           	movel %d0,%d7
   fc742:	0287 8000 0000 	andil #-2147483648,%d7
   fc748:	6000 f7b4      	braw fbefe <Ld$infty>
   fc74c:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc752:	30bc 0000      	movew #0,%a0@
   fc756:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc75a:	4e5e           	unlk %fp
   fc75c:	4e75           	rts
   fc75e:	0880 001f      	bclr #31,%d0
   fc762:	6000 ffe8      	braw fc74c <__negdf2+0x44>

000fc766 <__cmpdf2_internal>:
   fc766:	4e56 0000      	linkw %fp,#0
   fc76a:	48e7 3f00      	moveml %d2-%d7,%sp@-
   fc76e:	7a05           	moveq #5,%d5
   fc770:	202e 0008      	movel %fp@(8),%d0
   fc774:	222e 000c      	movel %fp@(12),%d1
   fc778:	242e 0010      	movel %fp@(16),%d2
   fc77c:	262e 0014      	movel %fp@(20),%d3
   fc780:	2c00           	movel %d0,%d6
   fc782:	0880 001f      	bclr #31,%d0
   fc786:	2e02           	movel %d2,%d7
   fc788:	0882 001f      	bclr #31,%d2
   fc78c:	0c80 7ff0 0000 	cmpil #2146435072,%d0
   fc792:	6200 0094      	bhiw fc828 <Lcmpd$inop>
   fc796:	6700 007c      	beqw fc814 <Lcmpdf$a$nf>
   fc79a:	2800           	movel %d0,%d4
   fc79c:	8881           	orl %d1,%d4
   fc79e:	6700 0064      	beqw fc804 <Lcmpdf$a$0>

000fc7a2 <Lcmpdf$0>:
   fc7a2:	0c82 7ff0 0000 	cmpil #2146435072,%d2
   fc7a8:	6200 007e      	bhiw fc828 <Lcmpd$inop>
   fc7ac:	6700 0070      	beqw fc81e <Lcmpdf$b$nf>
   fc7b0:	2802           	movel %d2,%d4
   fc7b2:	8883           	orl %d3,%d4
   fc7b4:	6700 0056      	beqw fc80c <Lcmpdf$b$0>

000fc7b8 <Lcmpdf$1>:
   fc7b8:	bd87           	eorl %d6,%d7
   fc7ba:	6a00 000c      	bplw fc7c8 <Lcmpdf$1+0x10>
   fc7be:	4a86           	tstl %d6
   fc7c0:	6a00 002e      	bplw fc7f0 <Lcmpdf$a$gt$b>
   fc7c4:	6b00 0034      	bmiw fc7fa <Lcmpdf$b$gt$a>
   fc7c8:	4a86           	tstl %d6
   fc7ca:	6a00 0006      	bplw fc7d2 <Lcmpdf$1+0x1a>
   fc7ce:	c142           	exg %d0,%d2
   fc7d0:	c343           	exg %d1,%d3
   fc7d2:	b480           	cmpl %d0,%d2
   fc7d4:	6200 0024      	bhiw fc7fa <Lcmpdf$b$gt$a>
   fc7d8:	6600 0016      	bnew fc7f0 <Lcmpdf$a$gt$b>
   fc7dc:	b681           	cmpl %d1,%d3
   fc7de:	6200 001a      	bhiw fc7fa <Lcmpdf$b$gt$a>
   fc7e2:	6600 000c      	bnew fc7f0 <Lcmpdf$a$gt$b>
   fc7e6:	7000           	moveq #0,%d0
   fc7e8:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc7ec:	4e5e           	unlk %fp
   fc7ee:	4e75           	rts

000fc7f0 <Lcmpdf$a$gt$b>:
   fc7f0:	7001           	moveq #1,%d0
   fc7f2:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc7f6:	4e5e           	unlk %fp
   fc7f8:	4e75           	rts

000fc7fa <Lcmpdf$b$gt$a>:
   fc7fa:	70ff           	moveq #-1,%d0
   fc7fc:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc800:	4e5e           	unlk %fp
   fc802:	4e75           	rts

000fc804 <Lcmpdf$a$0>:
   fc804:	0886 001f      	bclr #31,%d6
   fc808:	6000 ff98      	braw fc7a2 <Lcmpdf$0>

000fc80c <Lcmpdf$b$0>:
   fc80c:	0887 001f      	bclr #31,%d7
   fc810:	6000 ffa6      	braw fc7b8 <Lcmpdf$1>

000fc814 <Lcmpdf$a$nf>:
   fc814:	4a81           	tstl %d1
   fc816:	6600 f70c      	bnew fbf24 <Ld$inop>
   fc81a:	6000 ff86      	braw fc7a2 <Lcmpdf$0>

000fc81e <Lcmpdf$b$nf>:
   fc81e:	4a83           	tstl %d3
   fc820:	6600 f702      	bnew fbf24 <Ld$inop>
   fc824:	6000 ff92      	braw fc7b8 <Lcmpdf$1>

000fc828 <Lcmpd$inop>:
   fc828:	202e 0018      	movel %fp@(24),%d0
   fc82c:	7e11           	moveq #17,%d7
   fc82e:	7c02           	moveq #2,%d6
   fc830:	4ef9 000f c8ca 	jmp fc8ca <$_exception_handler>

000fc836 <__cmpdf2>:
   fc836:	4e56 0000      	linkw %fp,#0
   fc83a:	4878 0001      	pea 1 <ADD>
   fc83e:	2f2e 0014      	movel %fp@(20),%sp@-
   fc842:	2f2e 0010      	movel %fp@(16),%sp@-
   fc846:	2f2e 000c      	movel %fp@(12),%sp@-
   fc84a:	2f2e 0008      	movel %fp@(8),%sp@-
   fc84e:	6100 ff16      	bsrw fc766 <__cmpdf2_internal>
   fc852:	4e5e           	unlk %fp
   fc854:	4e75           	rts

000fc856 <Lround$to$nearest>:
   fc856:	0800 0015      	btst #21,%d0
   fc85a:	6600 0016      	bnew fc872 <Lround$to$nearest+0x1c>
   fc85e:	0c44 0001      	cmpiw #1,%d4
   fc862:	6700 000e      	beqw fc872 <Lround$to$nearest+0x1c>
   fc866:	d683           	addl %d3,%d3
   fc868:	d582           	addxl %d2,%d2
   fc86a:	d381           	addxl %d1,%d1
   fc86c:	d180           	addxl %d0,%d0
   fc86e:	51cc ffe6      	dbf %d4,fc856 <Lround$to$nearest>
   fc872:	0801 0000      	btst #0,%d1
   fc876:	6700 0022      	beqw fc89a <Lround$to$nearest+0x44>
   fc87a:	8682           	orl %d2,%d3
   fc87c:	6600 0014      	bnew fc892 <Lround$to$nearest+0x3c>
   fc880:	2601           	movel %d1,%d3
   fc882:	0283 0000 0002 	andil #2,%d3
   fc888:	7400           	moveq #0,%d2
   fc88a:	d283           	addl %d3,%d1
   fc88c:	d182           	addxl %d2,%d0
   fc88e:	6000 000a      	braw fc89a <Lround$to$nearest+0x44>
   fc892:	7601           	moveq #1,%d3
   fc894:	7400           	moveq #0,%d2
   fc896:	d283           	addl %d3,%d1
   fc898:	d182           	addxl %d2,%d0
   fc89a:	e288           	lsrl #1,%d0
   fc89c:	e291           	roxrl #1,%d1
   fc89e:	0800 0015      	btst #21,%d0
   fc8a2:	6700 0008      	beqw fc8ac <Lround$to$nearest+0x56>
   fc8a6:	e288           	lsrl #1,%d0
   fc8a8:	e291           	roxrl #1,%d1
   fc8aa:	5244           	addqw #1,%d4
   fc8ac:	0800 0014      	btst #20,%d0
   fc8b0:	6700 0004      	beqw fc8b6 <Lround$to$nearest+0x60>
   fc8b4:	4ed0           	jmp %a0@
   fc8b6:	7800           	moveq #0,%d4
   fc8b8:	4ed0           	jmp %a0@

000fc8ba <Lround$to$minus>:
   fc8ba:	4ed0           	jmp %a0@

000fc8bc <__clear_sticky_bit>:
   fc8bc:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc8c2:	317c 0000 0004 	movew #0,%a0@(4)
   fc8c8:	4e75           	rts

000fc8ca <$_exception_handler>:
   fc8ca:	41f9 0081 0000 	lea 810000 <_fpCCR>,%a0
   fc8d0:	3087           	movew %d7,%a0@
   fc8d2:	8f68 0004      	orw %d7,%a0@(4)
   fc8d6:	3146 0008      	movew %d6,%a0@(8)
   fc8da:	3145 000a      	movew %d5,%a0@(10)
   fc8de:	0c46 0001      	cmpiw #1,%d6
   fc8e2:	6700 001e      	beqw fc902 <$_exception_handler+0x38>
   fc8e6:	216e 0008 000c 	movel %fp@(8),%a0@(12)
   fc8ec:	216e 000c 0010 	movel %fp@(12),%a0@(16)
   fc8f2:	216e 0010 0014 	movel %fp@(16),%a0@(20)
   fc8f8:	216e 0014 0018 	movel %fp@(20),%a0@(24)
   fc8fe:	6000 000e      	braw fc90e <$_exception_handler+0x44>
   fc902:	216e 0008 000c 	movel %fp@(8),%a0@(12)
   fc908:	216e 000c 0014 	movel %fp@(12),%a0@(20)
   fc90e:	ce68 0002      	andw %a0@(2),%d7
   fc912:	6700 000a      	beqw fc91e <$_exception_handler+0x54>
   fc916:	4879 0081 0000 	pea 810000 <_fpCCR>
   fc91c:	4e4f           	trap #15
   fc91e:	4cdf 00fc      	moveml %sp@+,%d2-%d7
   fc922:	4e5e           	unlk %fp
   fc924:	4e75           	rts
	...

000fc928 <__ltdf2>:
   fc928:	4e56 0000      	linkw %fp,#0
   fc92c:	4878 0001      	pea 1 <ADD>
   fc930:	2f2e 0014      	movel %fp@(20),%sp@-
   fc934:	2f2e 0010      	movel %fp@(16),%sp@-
   fc938:	2f2e 000c      	movel %fp@(12),%sp@-
   fc93c:	2f2e 0008      	movel %fp@(8),%sp@-
   fc940:	4eb9 000f c766 	jsr fc766 <__cmpdf2_internal>
   fc946:	4e5e           	unlk %fp
   fc948:	4e75           	rts
	...

000fc94c <__fixunsdfsi>:
   fc94c:	4e56 0000      	linkw %fp,#0
   fc950:	2f03           	movel %d3,%sp@-
   fc952:	2f02           	movel %d2,%sp@-
   fc954:	242e 0008      	movel %fp@(8),%d2
   fc958:	262e 000c      	movel %fp@(12),%d3
   fc95c:	42a7           	clrl %sp@-
   fc95e:	2f3c 41e0 0000 	movel #1105199104,%sp@-
   fc964:	2f03           	movel %d3,%sp@-
   fc966:	2f02           	movel %d2,%sp@-
   fc968:	4eb9 000f ce10 	jsr fce10 <__gedf2>
   fc96e:	4fef 0010      	lea %sp@(16),%sp
   fc972:	4a80           	tstl %d0
   fc974:	6c18           	bges fc98e <__fixunsdfsi+0x42>
   fc976:	2f03           	movel %d3,%sp@-
   fc978:	2f02           	movel %d2,%sp@-
   fc97a:	4eb9 000f cd60 	jsr fcd60 <__fixdfsi>
   fc980:	508f           	addql #8,%sp
   fc982:	242e fff8      	movel %fp@(-8),%d2
   fc986:	262e fffc      	movel %fp@(-4),%d3
   fc98a:	4e5e           	unlk %fp
   fc98c:	4e75           	rts
   fc98e:	42a7           	clrl %sp@-
   fc990:	2f3c 41e0 0000 	movel #1105199104,%sp@-
   fc996:	2f03           	movel %d3,%sp@-
   fc998:	2f02           	movel %d2,%sp@-
   fc99a:	4eb9 000f bf4a 	jsr fbf4a <__subdf3>
   fc9a0:	4fef 000c      	lea %sp@(12),%sp
   fc9a4:	2e81           	movel %d1,%sp@
   fc9a6:	2f00           	movel %d0,%sp@-
   fc9a8:	4eb9 000f cd60 	jsr fcd60 <__fixdfsi>
   fc9ae:	508f           	addql #8,%sp
   fc9b0:	0680 8000 0000 	addil #-2147483648,%d0
   fc9b6:	242e fff8      	movel %fp@(-8),%d2
   fc9ba:	262e fffc      	movel %fp@(-4),%d3
   fc9be:	4e5e           	unlk %fp
   fc9c0:	4e75           	rts
	...

000fc9c4 <__unordsf2>:
   fc9c4:	4e56 0000      	linkw %fp,#0
   fc9c8:	2f02           	movel %d2,%sp@-
   fc9ca:	202e 0008      	movel %fp@(8),%d0
   fc9ce:	222e 000c      	movel %fp@(12),%d1
   fc9d2:	2400           	movel %d0,%d2
   fc9d4:	4842           	swap %d2
   fc9d6:	ee42           	asrw #7,%d2
   fc9d8:	48c2           	extl %d2
   fc9da:	0c02 ffff      	cmpib #-1,%d2
   fc9de:	6716           	beqs fc9f6 <__unordsf2+0x32>
   fc9e0:	2001           	movel %d1,%d0
   fc9e2:	4840           	swap %d0
   fc9e4:	ee40           	asrw #7,%d0
   fc9e6:	48c0           	extl %d0
   fc9e8:	0c00 ffff      	cmpib #-1,%d0
   fc9ec:	6718           	beqs fca06 <__unordsf2+0x42>
   fc9ee:	7000           	moveq #0,%d0
   fc9f0:	241f           	movel %sp@+,%d2
   fc9f2:	4e5e           	unlk %fp
   fc9f4:	4e75           	rts
   fc9f6:	0280 007f ffff 	andil #8388607,%d0
   fc9fc:	67e2           	beqs fc9e0 <__unordsf2+0x1c>
   fc9fe:	7001           	moveq #1,%d0
   fca00:	241f           	movel %sp@+,%d2
   fca02:	4e5e           	unlk %fp
   fca04:	4e75           	rts
   fca06:	0281 007f ffff 	andil #8388607,%d1
   fca0c:	56c0           	sne %d0
   fca0e:	4880           	extw %d0
   fca10:	48c0           	extl %d0
   fca12:	4480           	negl %d0
   fca14:	241f           	movel %sp@+,%d2
   fca16:	4e5e           	unlk %fp
   fca18:	4e75           	rts

000fca1a <__unorddf2>:
   fca1a:	4e56 0000      	linkw %fp,#0
   fca1e:	2f02           	movel %d2,%sp@-
   fca20:	222e 0008      	movel %fp@(8),%d1
   fca24:	242e 0010      	movel %fp@(16),%d2
   fca28:	226e 0014      	moveal %fp@(20),%a1
   fca2c:	206e 000c      	moveal %fp@(12),%a0
   fca30:	2001           	movel %d1,%d0
   fca32:	4840           	swap %d0
   fca34:	e840           	asrw #4,%d0
   fca36:	48c0           	extl %d0
   fca38:	0280 0000 07ff 	andil #2047,%d0
   fca3e:	0c80 0000 07ff 	cmpil #2047,%d0
   fca44:	671e           	beqs fca64 <__unorddf2+0x4a>
   fca46:	2002           	movel %d2,%d0
   fca48:	4840           	swap %d0
   fca4a:	e840           	asrw #4,%d0
   fca4c:	48c0           	extl %d0
   fca4e:	0280 0000 07ff 	andil #2047,%d0
   fca54:	0c80 0000 07ff 	cmpil #2047,%d0
   fca5a:	671e           	beqs fca7a <__unorddf2+0x60>
   fca5c:	7000           	moveq #0,%d0
   fca5e:	241f           	movel %sp@+,%d2
   fca60:	4e5e           	unlk %fp
   fca62:	4e75           	rts
   fca64:	0281 000f ffff 	andil #1048575,%d1
   fca6a:	6606           	bnes fca72 <__unorddf2+0x58>
   fca6c:	b0fc 0000      	cmpaw #0,%a0
   fca70:	67d4           	beqs fca46 <__unorddf2+0x2c>
   fca72:	7001           	moveq #1,%d0
   fca74:	241f           	movel %sp@+,%d2
   fca76:	4e5e           	unlk %fp
   fca78:	4e75           	rts
   fca7a:	0282 000f ffff 	andil #1048575,%d2
   fca80:	66f0           	bnes fca72 <__unorddf2+0x58>
   fca82:	b2fc 0000      	cmpaw #0,%a1
   fca86:	66ea           	bnes fca72 <__unorddf2+0x58>
   fca88:	4240           	clrw %d0
   fca8a:	241f           	movel %sp@+,%d2
   fca8c:	4e5e           	unlk %fp
   fca8e:	4e75           	rts

000fca90 <__floatunsidf>:
   fca90:	4e56 0000      	linkw %fp,#0
   fca94:	48e7 3800      	moveml %d2-%d4,%sp@-
   fca98:	202e 0008      	movel %fp@(8),%d0
   fca9c:	674e           	beqs fcaec <__floatunsidf+0x5c>
   fca9e:	223c 0000 041e 	movel #1054,%d1
   fcaa4:	0c80 01ff ffff 	cmpil #33554431,%d0
   fcaaa:	620c           	bhis fcab8 <__floatunsidf+0x28>
   fcaac:	e988           	lsll #4,%d0
   fcaae:	5981           	subql #4,%d1
   fcab0:	0c80 01ff ffff 	cmpil #33554431,%d0
   fcab6:	63f4           	blss fcaac <__floatunsidf+0x1c>
   fcab8:	4a80           	tstl %d0
   fcaba:	6d08           	blts fcac4 <__floatunsidf+0x34>
   fcabc:	d080           	addl %d0,%d0
   fcabe:	5381           	subql #1,%d1
   fcac0:	4a80           	tstl %d0
   fcac2:	6cf8           	bges fcabc <__floatunsidf+0x2c>
   fcac4:	2400           	movel %d0,%d2
   fcac6:	760b           	moveq #11,%d3
   fcac8:	e6aa           	lsrl %d3,%d2
   fcaca:	0882 0014      	bclr #20,%d2
   fcace:	e949           	lslw #4,%d1
   fcad0:	4841           	swap %d1
   fcad2:	4241           	clrw %d1
   fcad4:	2802           	movel %d2,%d4
   fcad6:	8881           	orl %d1,%d4
   fcad8:	2600           	movel %d0,%d3
   fcada:	eb4b           	lslw #5,%d3
   fcadc:	4843           	swap %d3
   fcade:	4243           	clrw %d3
   fcae0:	2004           	movel %d4,%d0
   fcae2:	2203           	movel %d3,%d1
   fcae4:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcae8:	4e5e           	unlk %fp
   fcaea:	4e75           	rts
   fcaec:	93c9           	subal %a1,%a1
   fcaee:	91c8           	subal %a0,%a0
   fcaf0:	2009           	movel %a1,%d0
   fcaf2:	2208           	movel %a0,%d1
   fcaf4:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcaf8:	4e5e           	unlk %fp
   fcafa:	4e75           	rts

000fcafc <__floatsidf>:
   fcafc:	4e56 0000      	linkw %fp,#0
   fcb00:	48e7 3800      	moveml %d2-%d4,%sp@-
   fcb04:	202e 0008      	movel %fp@(8),%d0
   fcb08:	675c           	beqs fcb66 <__floatsidf+0x6a>
   fcb0a:	6d6a           	blts fcb76 <__floatsidf+0x7a>
   fcb0c:	7400           	moveq #0,%d2
   fcb0e:	223c 0000 041d 	movel #1053,%d1
   fcb14:	0c80 00ff ffff 	cmpil #16777215,%d0
   fcb1a:	6e0c           	bgts fcb28 <__floatsidf+0x2c>
   fcb1c:	e988           	lsll #4,%d0
   fcb1e:	5981           	subql #4,%d1
   fcb20:	0c80 00ff ffff 	cmpil #16777215,%d0
   fcb26:	6ff4           	bles fcb1c <__floatsidf+0x20>
   fcb28:	0c80 3fff ffff 	cmpil #1073741823,%d0
   fcb2e:	6e0c           	bgts fcb3c <__floatsidf+0x40>
   fcb30:	d080           	addl %d0,%d0
   fcb32:	5381           	subql #1,%d1
   fcb34:	0c80 3fff ffff 	cmpil #1073741823,%d0
   fcb3a:	6ff4           	bles fcb30 <__floatsidf+0x34>
   fcb3c:	e949           	lslw #4,%d1
   fcb3e:	4841           	swap %d1
   fcb40:	4241           	clrw %d1
   fcb42:	8282           	orl %d2,%d1
   fcb44:	2400           	movel %d0,%d2
   fcb46:	760a           	moveq #10,%d3
   fcb48:	e6a2           	asrl %d3,%d2
   fcb4a:	0882 0014      	bclr #20,%d2
   fcb4e:	2801           	movel %d1,%d4
   fcb50:	8882           	orl %d2,%d4
   fcb52:	2600           	movel %d0,%d3
   fcb54:	ed4b           	lslw #6,%d3
   fcb56:	4843           	swap %d3
   fcb58:	4243           	clrw %d3
   fcb5a:	2004           	movel %d4,%d0
   fcb5c:	2203           	movel %d3,%d1
   fcb5e:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcb62:	4e5e           	unlk %fp
   fcb64:	4e75           	rts
   fcb66:	93c9           	subal %a1,%a1
   fcb68:	91c8           	subal %a0,%a0
   fcb6a:	2009           	movel %a1,%d0
   fcb6c:	2208           	movel %a0,%d1
   fcb6e:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcb72:	4e5e           	unlk %fp
   fcb74:	4e75           	rts
   fcb76:	4480           	negl %d0
   fcb78:	6b16           	bmis fcb90 <__floatsidf+0x94>
   fcb7a:	243c 8000 0000 	movel #-2147483648,%d2
   fcb80:	223c 0000 041d 	movel #1053,%d1
   fcb86:	0c80 00ff ffff 	cmpil #16777215,%d0
   fcb8c:	6f8e           	bles fcb1c <__floatsidf+0x20>
   fcb8e:	6098           	bras fcb28 <__floatsidf+0x2c>
   fcb90:	227c c1e0 0000 	moveal #-1042284544,%a1
   fcb96:	91c8           	subal %a0,%a0
   fcb98:	2009           	movel %a1,%d0
   fcb9a:	2208           	movel %a0,%d1
   fcb9c:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcba0:	4e5e           	unlk %fp
   fcba2:	4e75           	rts

000fcba4 <__floatunsisf>:
   fcba4:	4e56 0000      	linkw %fp,#0
   fcba8:	2f2e 0008      	movel %fp@(8),%sp@-
   fcbac:	4eba fee2      	jsr %pc@(fca90 <__floatunsidf>)
   fcbb0:	2e81           	movel %d1,%sp@
   fcbb2:	2f00           	movel %d0,%sp@-
   fcbb4:	4eba 00a0      	jsr %pc@(fcc56 <__truncdfsf2>)
   fcbb8:	508f           	addql #8,%sp
   fcbba:	4e5e           	unlk %fp
   fcbbc:	4e75           	rts

000fcbbe <__floatsisf>:
   fcbbe:	4e56 0000      	linkw %fp,#0
   fcbc2:	2f2e 0008      	movel %fp@(8),%sp@-
   fcbc6:	4eba ff34      	jsr %pc@(fcafc <__floatsidf>)
   fcbca:	2e81           	movel %d1,%sp@
   fcbcc:	2f00           	movel %d0,%sp@-
   fcbce:	4eba 0086      	jsr %pc@(fcc56 <__truncdfsf2>)
   fcbd2:	508f           	addql #8,%sp
   fcbd4:	4e5e           	unlk %fp
   fcbd6:	4e75           	rts

000fcbd8 <__extendsfdf2>:
   fcbd8:	4e56 0000      	linkw %fp,#0
   fcbdc:	48e7 3800      	moveml %d2-%d4,%sp@-
   fcbe0:	202e 0008      	movel %fp@(8),%d0
   fcbe4:	2600           	movel %d0,%d3
   fcbe6:	0283 8000 0000 	andil #-2147483648,%d3
   fcbec:	2200           	movel %d0,%d1
   fcbee:	0881 001f      	bclr #31,%d1
   fcbf2:	4a81           	tstl %d1
   fcbf4:	6752           	beqs fcc48 <__extendsfdf2+0x70>
   fcbf6:	2200           	movel %d0,%d1
   fcbf8:	4841           	swap %d1
   fcbfa:	ee41           	asrw #7,%d1
   fcbfc:	48c1           	extl %d1
   fcbfe:	7400           	moveq #0,%d2
   fcc00:	4602           	notb %d2
   fcc02:	c282           	andl %d2,%d1
   fcc04:	0280 007f ffff 	andil #8388607,%d0
   fcc0a:	4a81           	tstl %d1
   fcc0c:	6612           	bnes fcc20 <__extendsfdf2+0x48>
   fcc0e:	123c 0001      	moveb #1,%d1
   fcc12:	d080           	addl %d0,%d0
   fcc14:	5381           	subql #1,%d1
   fcc16:	0800 0017      	btst #23,%d0
   fcc1a:	67f6           	beqs fcc12 <__extendsfdf2+0x3a>
   fcc1c:	0880 0017      	bclr #23,%d0
   fcc20:	2400           	movel %d0,%d2
   fcc22:	e682           	asrl #3,%d2
   fcc24:	8483           	orl %d3,%d2
   fcc26:	0681 0000 0380 	addil #896,%d1
   fcc2c:	e949           	lslw #4,%d1
   fcc2e:	4841           	swap %d1
   fcc30:	4241           	clrw %d1
   fcc32:	2802           	movel %d2,%d4
   fcc34:	8881           	orl %d1,%d4
   fcc36:	2600           	movel %d0,%d3
   fcc38:	721d           	moveq #29,%d1
   fcc3a:	e3ab           	lsll %d1,%d3
   fcc3c:	2004           	movel %d4,%d0
   fcc3e:	2203           	movel %d3,%d1
   fcc40:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcc44:	4e5e           	unlk %fp
   fcc46:	4e75           	rts
   fcc48:	91c8           	subal %a0,%a0
   fcc4a:	2003           	movel %d3,%d0
   fcc4c:	2208           	movel %a0,%d1
   fcc4e:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcc52:	4e5e           	unlk %fp
   fcc54:	4e75           	rts

000fcc56 <__truncdfsf2>:
   fcc56:	4e56 0000      	linkw %fp,#0
   fcc5a:	48e7 3e00      	moveml %d2-%d6,%sp@-
   fcc5e:	242e 0008      	movel %fp@(8),%d2
   fcc62:	262e 000c      	movel %fp@(12),%d3
   fcc66:	2002           	movel %d2,%d0
   fcc68:	0880 001f      	bclr #31,%d0
   fcc6c:	4a80           	tstl %d0
   fcc6e:	6606           	bnes fcc76 <__truncdfsf2+0x20>
   fcc70:	4a83           	tstl %d3
   fcc72:	6700 00b4      	beqw fcd28 <__truncdfsf2+0xd2>
   fcc76:	2802           	movel %d2,%d4
   fcc78:	4844           	swap %d4
   fcc7a:	e844           	asrw #4,%d4
   fcc7c:	48c4           	extl %d4
   fcc7e:	0284 0000 07ff 	andil #2047,%d4
   fcc84:	2004           	movel %d4,%d0
   fcc86:	0680 ffff fc80 	addil #-896,%d0
   fcc8c:	2a03           	movel %d3,%d5
   fcc8e:	0285 003f ffff 	andil #4194303,%d5
   fcc94:	4243           	clrw %d3
   fcc96:	4843           	swap %d3
   fcc98:	ec4b           	lsrw #6,%d3
   fcc9a:	2202           	movel %d2,%d1
   fcc9c:	0281 000f ffff 	andil #1048575,%d1
   fcca2:	08c1 0014      	bset #20,%d1
   fcca6:	7c0a           	moveq #10,%d6
   fcca8:	eda9           	lsll %d6,%d1
   fccaa:	8681           	orl %d1,%d3
   fccac:	723f           	moveq #63,%d1
   fccae:	c283           	andl %d3,%d1
   fccb0:	8285           	orl %d5,%d1
   fccb2:	ec83           	asrl #6,%d3
   fccb4:	4a80           	tstl %d0
   fccb6:	6f5a           	bles fcd12 <__truncdfsf2+0xbc>
   fccb8:	0803 0000      	btst #0,%d3
   fccbc:	673c           	beqs fccfa <__truncdfsf2+0xa4>
   fccbe:	4a81           	tstl %d1
   fccc0:	6606           	bnes fccc8 <__truncdfsf2+0x72>
   fccc2:	0803 0001      	btst #1,%d3
   fccc6:	6732           	beqs fccfa <__truncdfsf2+0xa4>
   fccc8:	4a80           	tstl %d0
   fccca:	676c           	beqs fcd38 <__truncdfsf2+0xe2>
   fcccc:	223c 0200 0000 	movel #33554432,%d1
   fccd2:	7802           	moveq #2,%d4
   fccd4:	5283           	addql #1,%d3
   fccd6:	b283           	cmpl %d3,%d1
   fccd8:	6e20           	bgts fccfa <__truncdfsf2+0xa4>
   fccda:	5280           	addql #1,%d0
   fccdc:	ef48           	lslw #7,%d0
   fccde:	4840           	swap %d0
   fcce0:	4240           	clrw %d0
   fcce2:	e8a3           	asrl %d4,%d3
   fcce4:	0883 0017      	bclr #23,%d3
   fcce8:	8083           	orl %d3,%d0
   fccea:	0282 8000 0000 	andil #-2147483648,%d2
   fccf0:	8082           	orl %d2,%d0
   fccf2:	4cdf 007c      	moveml %sp@+,%d2-%d6
   fccf6:	4e5e           	unlk %fp
   fccf8:	4e75           	rts
   fccfa:	ef48           	lslw #7,%d0
   fccfc:	4840           	swap %d0
   fccfe:	4240           	clrw %d0
   fcd00:	e283           	asrl #1,%d3
   fcd02:	0883 0017      	bclr #23,%d3
   fcd06:	8083           	orl %d3,%d0
   fcd08:	0282 8000 0000 	andil #-2147483648,%d2
   fcd0e:	8082           	orl %d2,%d0
   fcd10:	60e0           	bras fccf2 <__truncdfsf2+0x9c>
   fcd12:	7ae8           	moveq #-24,%d5
   fcd14:	ba80           	cmpl %d0,%d5
   fcd16:	6f2a           	bles fcd42 <__truncdfsf2+0xec>
   fcd18:	7600           	moveq #0,%d3
   fcd1a:	7000           	moveq #0,%d0
   fcd1c:	8083           	orl %d3,%d0
   fcd1e:	0282 8000 0000 	andil #-2147483648,%d2
   fcd24:	8082           	orl %d2,%d0
   fcd26:	60ca           	bras fccf2 <__truncdfsf2+0x9c>
   fcd28:	2002           	movel %d2,%d0
   fcd2a:	0280 8000 0000 	andil #-2147483648,%d0
   fcd30:	4cdf 007c      	moveml %sp@+,%d2-%d6
   fcd34:	4e5e           	unlk %fp
   fcd36:	4e75           	rts
   fcd38:	223c 0100 0000 	movel #16777216,%d1
   fcd3e:	7801           	moveq #1,%d4
   fcd40:	6092           	bras fccd4 <__truncdfsf2+0x7e>
   fcd42:	3c3c 0381      	movew #897,%d6
   fcd46:	9c84           	subl %d4,%d6
   fcd48:	7001           	moveq #1,%d0
   fcd4a:	eda8           	lsll %d6,%d0
   fcd4c:	5380           	subql #1,%d0
   fcd4e:	c083           	andl %d3,%d0
   fcd50:	8280           	orl %d0,%d1
   fcd52:	eca3           	asrl %d6,%d3
   fcd54:	7000           	moveq #0,%d0
   fcd56:	0803 0000      	btst #0,%d3
   fcd5a:	6600 ff62      	bnew fccbe <__truncdfsf2+0x68>
   fcd5e:	609a           	bras fccfa <__truncdfsf2+0xa4>

000fcd60 <__fixdfsi>:
   fcd60:	4e56 0000      	linkw %fp,#0
   fcd64:	48e7 3800      	moveml %d2-%d4,%sp@-
   fcd68:	242e 0008      	movel %fp@(8),%d2
   fcd6c:	262e 000c      	movel %fp@(12),%d3
   fcd70:	2002           	movel %d2,%d0
   fcd72:	6722           	beqs fcd96 <__fixdfsi+0x36>
   fcd74:	2202           	movel %d2,%d1
   fcd76:	4841           	swap %d1
   fcd78:	e841           	asrw #4,%d1
   fcd7a:	48c1           	extl %d1
   fcd7c:	0281 0000 07ff 	andil #2047,%d1
   fcd82:	0681 ffff fbe3 	addil #-1053,%d1
   fcd88:	4a81           	tstl %d1
   fcd8a:	6f12           	bles fcd9e <__fixdfsi+0x3e>
   fcd8c:	4a82           	tstl %d2
   fcd8e:	6d3c           	blts fcdcc <__fixdfsi+0x6c>
   fcd90:	203c 7fff ffff 	movel #2147483647,%d0
   fcd96:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcd9a:	4e5e           	unlk %fp
   fcd9c:	4e75           	rts
   fcd9e:	78e1           	moveq #-31,%d4
   fcda0:	b881           	cmpl %d1,%d4
   fcda2:	6e36           	bgts fcdda <__fixdfsi+0x7a>
   fcda4:	0282 000f ffff 	andil #1048575,%d2
   fcdaa:	08c2 0014      	bset #20,%d2
   fcdae:	780a           	moveq #10,%d4
   fcdb0:	e9aa           	lsll %d4,%d2
   fcdb2:	4243           	clrw %d3
   fcdb4:	4843           	swap %d3
   fcdb6:	ec4b           	lsrw #6,%d3
   fcdb8:	8483           	orl %d3,%d2
   fcdba:	4a81           	tstl %d1
   fcdbc:	6626           	bnes fcde4 <__fixdfsi+0x84>
   fcdbe:	4a80           	tstl %d0
   fcdc0:	6d28           	blts fcdea <__fixdfsi+0x8a>
   fcdc2:	2002           	movel %d2,%d0
   fcdc4:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcdc8:	4e5e           	unlk %fp
   fcdca:	4e75           	rts
   fcdcc:	203c 8000 0000 	movel #-2147483648,%d0
   fcdd2:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcdd6:	4e5e           	unlk %fp
   fcdd8:	4e75           	rts
   fcdda:	7000           	moveq #0,%d0
   fcddc:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcde0:	4e5e           	unlk %fp
   fcde2:	4e75           	rts
   fcde4:	4481           	negl %d1
   fcde6:	e2a2           	asrl %d1,%d2
   fcde8:	60d4           	bras fcdbe <__fixdfsi+0x5e>
   fcdea:	2002           	movel %d2,%d0
   fcdec:	4480           	negl %d0
   fcdee:	4cdf 001c      	moveml %sp@+,%d2-%d4
   fcdf2:	4e5e           	unlk %fp
   fcdf4:	4e75           	rts

000fcdf6 <__fixsfsi>:
   fcdf6:	4e56 0000      	linkw %fp,#0
   fcdfa:	2f2e 0008      	movel %fp@(8),%sp@-
   fcdfe:	4eba fdd8      	jsr %pc@(fcbd8 <__extendsfdf2>)
   fce02:	2e81           	movel %d1,%sp@
   fce04:	2f00           	movel %d0,%sp@-
   fce06:	4eba ff58      	jsr %pc@(fcd60 <__fixdfsi>)
   fce0a:	508f           	addql #8,%sp
   fce0c:	4e5e           	unlk %fp
   fce0e:	4e75           	rts

000fce10 <__gedf2>:
   fce10:	4e56 0000      	linkw %fp,#0
   fce14:	4878 ffff      	pea ffffffff <LESS>
   fce18:	2f2e 0014      	movel %fp@(20),%sp@-
   fce1c:	2f2e 0010      	movel %fp@(16),%sp@-
   fce20:	2f2e 000c      	movel %fp@(12),%sp@-
   fce24:	2f2e 0008      	movel %fp@(8),%sp@-
   fce28:	4eb9 000f c766 	jsr fc766 <__cmpdf2_internal>
   fce2e:	4e5e           	unlk %fp
   fce30:	4e75           	rts
	...
