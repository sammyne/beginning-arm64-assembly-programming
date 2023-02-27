// hello3.s

			.data
msg: .asciz "hello, world\n"

			.bss

			.text

			.global main
main:
	mov x0, #1 	// 1 = to stdout
	adr x1, msg	// string to display
	mov x2, #13 // length of string, without 0
	mov x8, #64
	svc #0			// display the string
	mov x0, #0	// success exit code
	mov x8, #93	// 93 = exit 
	svc #0 			// quit
