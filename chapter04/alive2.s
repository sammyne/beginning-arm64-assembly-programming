// alive2.s

        .data
msg1:   .asciz "Hello, World!"
msg2:   .asciz "Alive and Kicking!"
radius: .int 357
pi:     .double 3.14
fmtstr: .asciz "%s\n"   // format for printing a string
fmtflt: .asciz  "%lf\n" // format for a float
fmtint: .asciz "%d\n"   // format for an integer

        .bss

        .text

        .global main
main:
  stp x29, x30, [sp, #-16]! // function prologue to save FP and LR
                            // print msg1
  ldr x0, =fmtstr
  adr x1, msg1              // adr is more effective than ldr
  bl printf
                            // print msg2
  ldr x0, =fmtstr
  ldr x1, =msg2
  bl printf
                            // print radius
#  mov rax, 0               // no floating point
  adr x0, fmtint            // adr is more effective than ldr
  mov x1, [radius]
  bl printf
                          // print pi
  adr x0, fmtflt
  adr x1, pi
  ldr d0, [x1]
  bl printf

  ldp x29, x30, [sp], #16

                          // zero exit codes to fix failed 'make'
//  mov x0, 0                 // 0 = success exit code
//  mov x8, #93               // 93 = exit  
//  svc #0                    // quit
                          // end zero exit codes to fix failed 'make' in case of rax!=0
//  xor rax, rax            // zero rax to make ret equal to exit syscall with code 0.
                          // \if missing, the return code 9 (=#(char) printed) of printf will be used as exit code,
                          // rendering the program failed
  ret
