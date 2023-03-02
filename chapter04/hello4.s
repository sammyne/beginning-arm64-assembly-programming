// hello4.s

// extern declaration isn't required
// extern printf // declare the function as external

        .data
msg:    .asciz "Hello, World!"
fmtstr: .asciz "This is our string: %s\n" // printformat

        .bss

        .text

        .global main
main:
  stp x29, x30, [sp, #-16]! // function prologue to save FP and LR
  adr x0, fmtstr            // first argument for printf
  adr x1, msg               // second argument for printf
  bl printf                 // call the function
  ldp x29, x30, [sp], #16
  mov x0, 0                 // 0 = success exit code
  mov x8, #93               // 93 = exit  
  svc #0                    // quit
