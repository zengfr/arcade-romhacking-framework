/* here we use AT&T format assembly */
    .text
    .code32
    .globl    writeHexASCII
    .globl    swapEnds

/*
0x8(%esp) = number
0x4(%esp) = *buffer
%ecx = shift length
%eax = hex value
%edi = loop count

*/
writeHexASCII:
    movl   $28,%ecx
    movl   $0,%edi
    mov    0x4(%esp),%edx
    jmp    if_loop_end
loop_start:
    mov    0x8(%esp),%eax
    shr    %cl,%eax
    and    $0xf,%eax
    cmpl   $9,%eax
    jg     hex_abcdef
hex_0_9:
    addl   $0x30,%eax
    jmp    hex_convert_complete
hex_abcdef:
    addl   $0x57,%eax
hex_convert_complete:
    mov    %al,(%edx)
    add    $1,%edx
    subl   $4,%ecx
    addl   $1,%edi
if_loop_end:
    cmpl   $7,%edi
    jle    loop_start
    movb   $0x0,(%edx)
    ret


/*
0x4(%esp) = x
%edi = temp value
*/
swapEnds:
    mov    4(%esp),%eax
    and    $0xff000000,%eax
    shr    $24,%eax
    mov    %eax,%edi
    
    movzbl 4(%esp),%eax
    shl    $24,%eax
    or     %eax,%edi
    
    mov    4(%esp),%eax
    and    $0xff0000,%eax
    shr    $8,%eax
    or     %eax,%edi
    
    mov    4(%esp),%eax
    and    $0xff00,%eax
    shl    $8,%eax
    or     %eax,%edi
    
    mov    %edi,%eax
    
    ret    


