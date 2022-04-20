//Str_toUpperCase
//Subroutine strlength returns a string converted to upper case
// X0: Points to first byte of a CString
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, X2, X5, and X6 are modified and not preserved

	.data

	.global Str_toUpperCase
	
	.text	

Str_toUpperCase:
	mov	X5, X0			// preserve X1
	str	lr, [sp, #-16]!		// push link register to the stack
	bl	strlength		// run string length for X0
	ldr	lr, [sp], #16		// load link back again	
	mov	X6, X2			// push string length into X6
	mov	X0, X5			// restore X0
	

loop:
	ldrb	W2, [X0] 		// load a byte from the address at X0 and move the address by 1
	cmp	W2, #0x61		// check to see if it is less than or equal to 'Z'
	bge	change			// branch to change
	add	X0, X0, #1		// increment by 1
	
compare:
	cmp	X6, #0			// compare to see if loop is over
	beq	exit			// branch to ending
	sub	X6, X6, #1		// subtract by 1 to move loop
	b	loop			// loop back to top

change:
	cmp	W2, #0x7a		// compare to see if it is above 'A'
	ble	conversion		// branch to lower
	add	X0, X0, #1		// increment by 1
	b	compare				
	
conversion:
	sub	X2, X2, #0x20		// add 0x20 to get the ascii value for a lower case
	strb    W2, [X0], #1   		 // put the value from X2 into X1
	b 	compare			// go to rest of function

exit:
	mov	X1, X5			// return address to uppercase string to X1
	RET	LR			// return to Link Register
	
	.end
	
