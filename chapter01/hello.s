
  .data
msg: .asciz "hello, world"


  .bss

  .global main

  .text
main: 
              // Procedure Call Standard sees
              //  https://developer.arm.com/documentation/102374/0101/Procedure-Call-Standard
  mov x0, #1  // 1 = to stdout
  adr x1, msg // string to display in rsi,
  mov x2, #12 // length of the string, without 0
  mov x8, #64 // syscall #64 is the write() function
  svc #0      // display the string
  mov x0, 0   // 0 = success exit code 
  mov x8, #93 // 60 = exit
  svc #0      // quit
