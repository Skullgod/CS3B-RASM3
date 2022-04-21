//String_indexOf_2
//Subroutine String__indexOf_2 returns the index of the first occurrence of character ch in a given String.
// X0: Points to first byte of a CString
// X1: contains the  substring you are looking for
// LR: Contains the return address
// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, X3, X4, X5, X6, and X7 are modified and not preserved

	.data
	
ptrString: .quad 0
ptrSubString: .quad	0

	.global String_indexOf_3
	
	.text
	
String_indexOf_3:
	ldr	X3, =ptrString	// load ptrString to X3
	str	X0, [X3]		// STR the address for the ptrString
	ldr	X2, =ptrSubString	// load ptrSubString to X2
	str	X1, [X2]		// STR address inside	
	ldr	X0, =ptrString	// load ptrString to address
	ldr	X0, [X0]		// load address stored
	str	lr, [sp, #-16]!	// push lr to the stack
	bl	strlength		// get the strlength of the string
	ldr	lr, [sp], #16	// load lr from stack
	str	X2, [sp, #-16]!	// push X2 to the stack	
	ldr X0, =ptrSubString	// get ptrSubString address
	ldr	X0, [X0]		// get address from ptrLet
	str	lr, [sp, #-16]!	// push lr to the stack
	bl strlength		// get strlength of the substring
	ldr	lr, [sp], #16	// load lr from stack
	str	X2, [sp, #-16]!	// push X2 to the stack	
	ldr	X2, [sp], #16	// load X2 from string from the stack
	mov X7, X2			// move string length into X4	
	ldr	X2, [sp], #16	// load X2 from substring from the stack
	mov X4, X2			// move substring length into X7	
	mov	X5, #-1			// reset the value of X5 to 0
	mov	X3, #0			// move the value zero into X3
	mov	X6, #0			// initialize accumulator to 0
	
loop:
	ldr	X0, =ptrString		// load ptrString to address
	ldr	X0, [X0]		// load address stored
	add	X0, X0, X6		// add accumulator to address
	
	ldr	X1, =ptrSubString		// get ptrSubString address
	ldr	X1, [X1]		// get address from ptrLet

	ldrb W0, [X0]    	// load a byte from the address at X0 and move the address by 1
	ldrb W1, [X1]    	// get value from the address
	cmp	X0, X1			// compare the value at the two 
	beq	indexOf_equal	// branch to the index return
	
continue:
	cmp	X4, X6			// compare string length to accumulator
	beq	index_end		// if equal move over to function
	add	X6, X6, #1		// increment
	b	loop			// go back to the top
	
indexOf_equal:
	ldr	X0, =ptrString		// load pointer to address
	ldr	X0, [X0]		// load address stored
	add	X0, X0, X6		// add accumulator to address
	mov	X2, X0			// move address of fullstring into X2
	add	X2, X2, #1		// accumulate by 1
	
	ldr	X1, =ptrSubString		// get ptrSubString address
	ldr	X1, [X1]		// get address from ptrLet
	add	X1, X1, #1		// accumulate by 1

loop2:
	
	str X2, [sp, #-16]!	// push X2 to the stack
	ldrb W0, [X2]    	// get the value
	ldrb W1, [X1]		// get the value
 	cmp	W1, W0			// compare the two values
	bne	end_loop		// get out of loop until the correct combo is reached
	add	X3, X3, #1		// add one to accumulator
	cmp	X7, X3			// compare the length of the substring to the accumulator
	beq	loop3	// go the correct condition
	
	ldr	X1, =ptrSubString		// get ptrSubString address
	ldr	X1, [X1]		// get address from ptrLet
	
	ldr	X2, [sp], #16	// load X2 from substring from the stack
	add	X2, X2, X3		// add the value of X3 to the initial pointer string
	sub	X2, X2, #1		// subtract by 1
	add	X1, X1, X3		// add the value of X3 to the pointer string
	b loop			// go back to top of loop
	
index_end:
	ret	LR				// return link register

loop3:
	mov	X1, X6		    // subtract the initial loop index by the 
	ret	LR
	
end_loop:
	mov	X3, #0			// reset the accumulator for inside loop
	b continue		// branch back to rest of loop
	
	.end
	