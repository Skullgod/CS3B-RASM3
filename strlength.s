//strlength
//Subroutine strlength returns an integer number which
//			 represents the number of characters (length)
//			in a given string including white spaces.
// X0: Points to first byte of a CString
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	
//		X0, X1, X2, and X7 are modified and not preserved
	.data
	
	.global strlength			//Provide program starting address to linker
	
	.text
strlength:
	// AAPCS REGISTERS AS PRESERVED DUE TO NOT BEING USED
	
	// We need a do while
	mov X7, X0		//point to first digit (leftmost) of CString
	mov X2, #0		//Counter
	
topLoop:
	ldrb W1, [X7], #1	//indirect addressing X1 = X0
	cmp W1, #0 			//if (W1 == NULL CHARACTER)
	beq botLoop			// jump to bottom of subroutine
	add X2, X2, #1		// increment the counter
	b topLoop
	
botLoop:
	mov X0, X2 // return address to length of string to X2	
	RET LR		// return to Link Register
	
	.end
	