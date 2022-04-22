//String_lastIndexOf_2
//Subroutine String_lastIndexOf_2 returns the index of the last occurrence of character ch in a given String from a starting index
// X0: Points to first byte of a CString
// X2: contains the index to start at
// X3: contains the char you are loooking for
// LR: Contains the return address
// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, X3, X4, X5, and X6 are modified and not preserved


	.data	
ptrChar:	.quad		0

	.global String_lastIndexOf_2
	
	.text

String_lastIndexOf_2:
	str	X2, [sp, #-16]!	// push byte to the stack
	ldr	X3, =ptrChar	// move ptrChar to letter
	str	X1, [X3]		// store address inside	
	mov	X5, X0			// preserve X0 into X5
	str	lr, [sp, #-16]!	// push LR to stack
	bl	strlength		// get string length
	ldr	lr, [sp], #16	// load link back again	
	mov	X0, X5			// restore X0 from X5
	mov	X4, X2			// move string length into X4
	ldr	X2, [sp], #16	// load X2 back again
	mov	X6, X2			// initialize accumulator to amount entered	
	ldr	X1, =ptrChar	// get ptrChar address
	ldr	X1, [X1]		// get address from ptrChar
	ldrb W1, [X1]		// get value from the address
	add	X0, X0, X2		// add this to address to get bytes after index specified
	
loop:
	ldrb W2, [X0], #1	// load a byte from the address at X0 and move the address by 1
	cmp	X2, X1			// compare the value at the two 
	beq	indexOf_equal	// branch to the index return
	
cont:
	cmp	X4, X6			// compare string length to accumulator
	beq	index_end		// if equal move over to end
	add	X6, X6, #1		// increment
	b loop			// go back to the top
	
indexOf_equal:
	mov	X5, X6 			// move accumulator into X5 to return the index position
	b cont	// return to the link register
	
index_end:
	cmp X5, #0			//compare to 0 if it is exit loop
	bne	end			// if it is not equal move to 
	mov	X0, #-1			// move negative 1 into register
	ret	LR				// return lr

end:
	mov	X0, X5			// load last recorded index of occurance of letter
	ret	LR				// return link register
	
	.end
	
	