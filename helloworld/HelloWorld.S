.global _start

_start:
    mov X3, #1
    lsl X3, X3, #10
    bl print_loop
    b exit

print:
    mov X0, #1 // set's print to STDOUT
    ldr X1, =helloworld
    mov X2, #13
    mov X8, #64
    svc 0
    ret

print_loop:
    bl print
    lsr X3, X3, #1
    cmp X3, #0
    bne print_loop

exit:
    // exit program
    mov X0, #0 // 0 return code, didn't fail
    mov X8, #93 // 93 terminates
    svc 0

.data
helloworld: .ascii "Hello World!\n"
