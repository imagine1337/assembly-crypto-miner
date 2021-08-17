MAX_NONCE:
        .long   5
SHA256:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     rax, QWORD PTR [rbp-24]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movabs  rcx, 8319104414228247328
        mov     QWORD PTR [rax], rcx
        mov     BYTE PTR [rax+8], 0
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-8]
        leave
        ret
.LC0:
        .string "%d%s%s%d"
.LC1:
        .string "%*.*s"
.LC2:
        .string "foo bar baz guux %s \n"
mine:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 1200
        mov     DWORD PTR [rbp-1172], edi
        mov     QWORD PTR [rbp-1184], rsi
        mov     QWORD PTR [rbp-1192], rdx
        mov     DWORD PTR [rbp-1176], ecx
        mov     QWORD PTR [rbp-1024], 48
        mov     QWORD PTR [rbp-1016], 0
        lea     rdx, [rbp-1008]
        mov     eax, 0
        mov     ecx, 123
        mov     rdi, rdx
        rep stosq
        mov     DWORD PTR [rbp-4], 0
        jmp     .L4
.L5:
        lea     rax, [rbp-1024]
        mov     rdi, rax
        call    strlen
        mov     rdx, rax
        lea     rax, [rbp-1024]
        add     rax, rdx
        mov     WORD PTR [rax], 48
        add     DWORD PTR [rbp-4], 1
.L4:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-1176]
        jl      .L5
        mov     DWORD PTR [rbp-8], 0
        jmp     .L6
.L8:
        mov     edi, DWORD PTR [rbp-1176]
        mov     rsi, QWORD PTR [rbp-1192]
        mov     rcx, QWORD PTR [rbp-1184]
        mov     edx, DWORD PTR [rbp-1172]
        lea     rax, [rbp-1056]
        mov     r9d, edi
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        lea     rax, [rbp-1056]
        mov     rdi, rax
        call    SHA256
        mov     QWORD PTR [rbp-16], rax
        lea     rax, [rbp-1024]
        mov     rdi, rax
        call    strlen
        mov     DWORD PTR [rbp-20], eax
        mov     rsi, QWORD PTR [rbp-16]
        mov     ecx, DWORD PTR [rbp-20]
        mov     edx, DWORD PTR [rbp-20]
        lea     rax, [rbp-1168]
        mov     r8, rsi
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    sprintf
        lea     rdx, [rbp-1168]
        lea     rax, [rbp-1024]
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        mov     DWORD PTR [rbp-24], eax
        cmp     DWORD PTR [rbp-24], 0
        jne     .L7
        lea     rax, [rbp-1168]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 0
        call    printf
.L7:
        add     DWORD PTR [rbp-8], 1
.L6:
        mov     eax, DWORD PTR MAX_NONCE[rip]
        cmp     DWORD PTR [rbp-8], eax
        jle     .L8
        nop
        leave
        ret
.LC3:
        .string "p"
.LC4:
        .string "t"
main:
        push    rbp
        mov     rbp, rsp
        mov     ecx, 6
        mov     edx, OFFSET FLAT:.LC3
        mov     esi, OFFSET FLAT:.LC4
        mov     edi, 3
        call    mine
        mov     eax, 0
        pop     rbp
        ret
