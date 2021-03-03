
#include "../../include/xxpacth_include.h"
.section .patch,"ax"

XXEXPORT_START(dumpy)

.file __FILE__
.line __LINE__
XXEXPORT_END(dumpy)
.org 0x0fbb20
XXEXPORT_START(ccodeabc)
