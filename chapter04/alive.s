# alive.s

        .data
msg1:   .asciz "Hello, World!\n"      // string with NL and 0
msg1Len = . - msg1 - 1                // measure the length, minus the 0
msg2:   .asciz "Alive and Kicking!\n" // string with NL and 0
msg2Len = . - msg2 - 1                // measure the length, minus the 0
radius: .quad 357                     // no string, not displayable?
pi:     .double 3.14                  // no string, not displayable?

        .bss

        .text

        .global main
main:
  stp x29, x30, [sp, #-16]! // function prologue to save FP and LR
  mov x0, 1                 // 1 = to stdout
  adr x1, msg1              // string to display
  mov x2, msg1Len           // length of the string
  mov x8, #64
  svc #0                    // display the string
  mov x0, 1                 // 1 = write
  mov x1, msg2              // string to display
  mov x2, msg2Len           // length of the string
  mov x8, #64
  svc #0                    // display the string
  ldp x29, x30, [sp], #16
  mov x0, 0                 // 0 = success exit code
  mov x8, #93               // 93 = exit  
  svc #0                    // quit
