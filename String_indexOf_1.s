//String_indexOf_1
//Subroutine String__indexOf_1 returns the index of the first occurrence of character ch in a given String.
// X0: Points to first byte of a CString
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, X3, X4, and X3 are modified and not preserved

	.data
		
ptrChar:	.quad 0

	.global String_indexOf_1
	
	.text
	
String_indexOf_1:
	ldr	X2, =ptrChar	// load ptrChar
	str	X1, [X2]		// store address of ptrChar
	mov	X5, X0			// preserve X0 into X5
	str	lr, [sp, #-16]!	// push LR to stack
	bl	strlength		// get string length
	ldr	lr, [sp], #16	// load link back again
	mov	X3, #0			// initialize accumulator to 0
	mov	X0, X5			// restore X0 from X6
	mov	X4, X2			// preserve string length into X4
	ldr	X1, =ptrChar	// get pointer address
	ldr	X1, [X1]		// get address from ptrChar
	ldrb W1, [X1]		// get value from the address
	
loop:
	ldrb W2, [X0], #1	// load a byte from the address at X0 and move the address by 1
	cmp	X2, X1			// compare the value at the two 
	beq	indexOf_equal	// branch to the index return
	cmp	X4, X3			// compare string length to accumulator
	beq	index_end		// if equal move over to function
	add	X3, X3, #1		// increment loop
	b loop			    // go back to the top
	
indexOf_equal:
	mov	X1, X3 			// move accumulator into X1 to return the index position
	ret	LR				// return to the link register
	
index_end:
	mov	X1, #-1			// move negative 1 into register if false
	ret	LR				// return to Link Register
	
	.end
	