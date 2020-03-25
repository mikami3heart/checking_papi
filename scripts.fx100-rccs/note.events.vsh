
PAPI_FP_INS == PAPI_FP_OPS

[mikami@vsh scripts]$ papi_avail -e PAPI_FP_INS
--------------------------------------------------------------------------------

Event name:                   PAPI_FP_INS
Event Code:                   0x80000034  
Number of Native Events:      2
Short Description:           |FP instructions|
Long Description:            |Floating point instructions|
Developer's Notes:           ||
Derived Type:                |DERIVED_ADD|
Postfix Processing String:   ||
 Native Code[0]: 0x4000001c |FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE double precision FP scalar uops executed|

 Native Code[1]: 0x4000001d |FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE single precision FP scalar uops executed|


[mikami@vsh scripts]$ papi_avail -e PAPI_FP_OPS
--------------------------------------------------------------------------------

Event name:                   PAPI_FP_OPS
Event Code:                   0x80000066  
Number of Native Events:      2
Short Description:           |FP operations|
Long Description:            |Floating point operations|
Developer's Notes:           ||
Derived Type:                |DERIVED_ADD|
Postfix Processing String:   ||
 Native Code[0]: 0x4000001c |FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE double precision FP scalar uops executed|

 Native Code[1]: 0x4000001d |FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE single precision FP scalar uops executed|

[mikami@vsh scripts]$ papi_avail -e  PAPI_SP_OPS
--------------------------------------------------------------------------------

Event name:                   PAPI_SP_OPS
Event Code:                   0x80000067  
Number of Native Events:      3
Short Description:           |SP operations|
Long Description:            |Floating point operations; optimized to count scaled single precision vector operations|
Developer's Notes:           ||
Derived Type:                |DERIVED_POSTFIX|
Postfix Processing String:   |N0|N1|4|*|N2|8|*|+|+||
 Native Code[0]: 0x4000001d |FP_COMP_OPS_EXE:SSE_FP_SCALAR_SINGLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE single precision FP scalar uops executed|

 Native Code[1]: 0x4000001e |FP_COMP_OPS_EXE:SSE_PACKED_SINGLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE single precision FP packed uops executed|

 Native Code[2]: 0x4000001f |SIMD_FP_256:PACKED_SINGLE|
 Number of Register Values: 0
 Native Event Description: |Counts 256-bit packed floating point instructions, masks:Counts 256-bit packed single-precision|


[mikami@vsh scripts]$ papi_avail -e  PAPI_DP_OPS
--------------------------------------------------------------------------------

Event name:                   PAPI_DP_OPS
Event Code:                   0x80000068  
Number of Native Events:      3
Short Description:           |DP operations|
Long Description:            |Floating point operations; optimized to count scaled double precision vector operations|
Developer's Notes:           ||
Derived Type:                |DERIVED_POSTFIX|
Postfix Processing String:   |N0|N1|2|*|N2|4|*|+|+||
 Native Code[0]: 0x4000001c |FP_COMP_OPS_EXE:SSE_SCALAR_DOUBLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE double precision FP scalar uops executed|

 Native Code[1]: 0x40000020 |FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE double precision FP packed uops executed|

 Native Code[2]: 0x40000021 |SIMD_FP_256:PACKED_DOUBLE|
 Number of Register Values: 0
 Native Event Description: |Counts 256-bit packed floating point instructions, masks:Counts 256-bit packed double-precision|


[mikami@vsh scripts]$ papi_avail -e  PAPI_VEC_SP
--------------------------------------------------------------------------------

Event name:                   PAPI_VEC_SP
Event Code:                   0x80000069  
Number of Native Events:      2
Short Description:           |SP Vector/SIMD instr|
Long Description:            |Single precision vector/SIMD instructions|
Developer's Notes:           ||
Derived Type:                |DERIVED_POSTFIX|
Postfix Processing String:   |N0|4|*|N1|8|*|+||
 Native Code[0]: 0x4000001e |FP_COMP_OPS_EXE:SSE_PACKED_SINGLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE single precision FP packed uops executed|

 Native Code[1]: 0x4000001f |SIMD_FP_256:PACKED_SINGLE|
 Number of Register Values: 0
 Native Event Description: |Counts 256-bit packed floating point instructions, masks:Counts 256-bit packed single-precision|


[mikami@vsh scripts]$ papi_avail -e  PAPI_VEC_DP
--------------------------------------------------------------------------------

Event name:                   PAPI_VEC_DP
Event Code:                   0x8000006a  
Number of Native Events:      2
Short Description:           |DP Vector/SIMD instr|
Long Description:            |Double precision vector/SIMD instructions|
Developer's Notes:           ||
Derived Type:                |DERIVED_POSTFIX|
Postfix Processing String:   |N0|2|*|N1|4|*|+||
 Native Code[0]: 0x40000020 |FP_COMP_OPS_EXE:SSE_FP_PACKED_DOUBLE|
 Number of Register Values: 0
 Native Event Description: |Counts number of floating point events, masks:Number of SSE double precision FP packed uops executed|

 Native Code[1]: 0x40000021 |SIMD_FP_256:PACKED_DOUBLE|
 Number of Register Values: 0
 Native Event Description: |Counts 256-bit packed floating point instructions, masks:Counts 256-bit packed double-precision|



