//String_lastIndexOf_1
//Subroutine String__lastIndexOf_1 returns the index of the last occurrence of character ch in a given String.
// X0: Points to first byte of a CString
// X1: contains the  substring you are looking for
// X3: contains char to look for
// LR: Contains the return address
// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, X3, X4, X5 and X6 are modified and not preserved
	.data
		
ptrChar:		.quad		0

	.global String_lastIndexOf_1
	
	.text
	
String_lastIndexOf_1:

	ldr	X2, =ptrChar	// Load ptrChar to X2
	str	X1, [X2]		// store address inside
	
	mov	X5, X0			// preserve X0 by moving to X5
	str	lr, [sp, #-16]!	// push LR to the stack
	bl	strlength		// get strlength
	ldr	lr, [sp], #16	// load LR from stack
	mov	X6, #0			// initialize accumulator to 0
	mov	X0, X5			// restore X0
	mov	X4, X2			// move strlength into X4
	ldr	X1, =ptrChar	// get ptrChar address
	ldr	X1, [X1]		// get address from ptrChar
	ldrb W1, [X1]		// get value from the address
	mov	X5, #0			// reset the value of X5 to 0
	
	
loop:
	ldrb W2, [X0], #1	// load a byte from the address at X0 and move the address by 1
	cmp	X2, X1			// compare the value at the two 
	beq	indexOf_equal	// branch to the index return
	
cont:
	cmp	X4, X6			// compare string length to accumulator
	beq	index_end		// if equal move over to function
	add	X6, X6, #1		// accumulate X6
	b loop			// go back to the top
	
indexOf_equal:
	mov	X5, X6 			// move accumulator into X1 to return the index position
	b cont		// continue to loop until new letter is found at another index
	
index_end:
	cmp	X5, #0			// compare to 0 if it is continue exiting loop
	bne	end			// if it is not equal move to 
	mov	X1, #-1			// move negative 1 into register
	ret	LR				// return link register

end:
	mov	X1, X5			// load last recorded index of occurance of letter
	ret	LR				// return link register
	
	.end
