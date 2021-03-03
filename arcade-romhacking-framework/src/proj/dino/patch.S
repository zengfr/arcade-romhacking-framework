
#include "../../include/xxpacth_include.h"
.section .patch,"ax"

XXEXPORT_START(dumpy)

.file "patch/dino.S"
.line 0

.file "patch/dino.S"
.line 0
	XXPATCH16JSR16(0xfb0d4,showMenu)
.file __FILE__
.line __LINE__
XXEXPORT_END(dumpy)
.org 0x0fbb20
XXEXPORT_START(ccodeabc)
