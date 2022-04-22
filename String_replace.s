//String_replace
//Subroutine String__replace returns the new updated string after changing all the occurrences of oldChar with the newChar.
// X0: Contains the first string, returns new string
// X1: contains the old char to be removed
// X2: contains the new char to be added
// LR: Contains the return address
// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, X3, X4, X5, and X6 are modified and not preserved

	.data


	.global String_replace
	
	.text

String_replace:
    
	str	X0, [sp, #-16]!	// push String to the stack
	str	X1, [sp, #-16]!	// push byte to the stack
	str	X2, [sp, #-16]!	// push replacement byte to the stack	
	str	lr, [sp, #-16]!	// push lr to the stack
	bl	strlength		// run strlength for X0
	ldr	lr, [sp], #16	// load lr fropm stack	
	mov	X6, X2			// push strlength into X6

	ldr	X2, [sp], #16	// load X2 back again from stack
	ldr	X1, [sp], #16	//load X2 back again from stack
	ldr	X0, [sp], #16	// load X0 back again from stack

loop:
	ldrb W4, [X0]    	// load a byte from the address at X0 and move the address by 1
	cmp	X4, X1			// compare to the user inputed byte
	beq	change			// branch to change
    
continue:
	cmp	X6, #0			// check to see if loop is over
	beq	exit			// branch to exit11
	sub	X6, X6, #1		// subtract by 1 to move loop
	add	X0, X0, #1		// add 1 to the address
	b loop				// loop back
	
change:
	strb W2, [X0], #1	// store the value of the replacement byte into pointer than progress address by 1
	b continue	

exit:
	ret		LR				// return to Link Register	
	.end
	