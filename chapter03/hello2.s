// hello2.s

      .data
msg:  .asciz "hello, world"
NL:   .byte  0xa // ascii code for new line


      .bss


      .text


      .global main

main:
  mov x0, #1  // 1 = to stdout
  adr x1, msg // string to display
  mov x2, #12 // length of string, without 0
  mov x8, #64 // syscall #64 is the write() function
  svc #0      // display the string
  mov x0, #1  // 1 = to stdout
  adr x1, NL  // display new line
  mov x2, #1  // length of the string
  mov x8, #64 // syscall #64 is the write() function
  svc #0
  mov x0, 0   // 0 = success exit code 
  mov x8, #93 // 93 = exit
  svc #0      // quit
