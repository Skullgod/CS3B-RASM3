//str_EqualsIgnoreCase
// X3: Points to first byte of a CString
// X4: Points to the first byte of a string
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.

	.data
	ptrString:  .quad 0	
	ptrString2: .quad 0
	

	.global str_EqualsIgnoreCase
	
	.text	
	
str_EqualsIgnoreCase:
	break24:
	STR	LR, [sp, #-16]!
	STR	X8, [sp, #-16]!
    STR	X9, [sp, #-16]!
	MOV X0, #21			//Move 15 into X0
	BL malloc			//Branch and link to Malloc
	LDR	X8, [sp], #16	
    LDR	X9, [sp], #16
	
	LDR X1, =ptrString	//Load the address of ptrString
	STR X0, [X1]		//Dereference
	
	MOV X2, #13			//Move 4 into X2
	LDR X1,[X1]			//Save the address of X1
	
///////////////////////////////////////////////////////////////
top1:					//Top of the first function
	
	LDRB W4, [X8],#1	//Load the first byte
	CMP X4, #0			//Compare X2 to 0
	BEQ bot1
	STRB W4, [X1],#1	//Store the first byte
	b top1				//Branch to top
	
bot1:			//Bottom of first function
///////////////////////////////////////////////////////////////

	LDR X0, =ptrString	//Load the ptrString into X0
	LDR X0, [X0]		//Store the address of X0
	
    STR	X9, [sp, #-16]!
	bl Str_toUpperCase		//Call toUpper
    LDR	X9, [sp], #16
	MOV X3, X1
///////////////////////////////////////////////////////////////
	
	
///////////////////////////////////////////////////////////////
	STR	X3, [sp, #-16]!
    STR	X9, [sp, #-16]!
	MOV X0, #21			//Move 15 into X0
	BL malloc			//Branch and link to Malloc
	LDR	X9, [sp], #16
	LDR	X3, [sp], #16
	
	LDR X1, =ptrString2	//Load the address of ptrString
	STR X0, [X1]		//Dereference
	
	MOV X2, #13			//Move 4 into X2
	LDR X1,[X1]			//Save the address of X1
	
///////////////////////////////////////////////////////////////
top2:					//Top of the first function
	
	LDRB W4, [X9],#1	//Load the first byte
	CMP X4, #0			//Compare X2 to 0
	BEQ bot2
	STRB W4, [X1],#1	//Store the first byte
	b top2				//Branch to top
	
bot2:			//Bottom of first function
///////////////////////////////////////////////////////////////

	LDR X0, =ptrString2	//Load the ptrString into X0
	LDR X0, [X0]		//Store the address of X0
	
	STR	X3, [sp, #-16]!
	bl Str_toUpperCase		//Call toUpper
	LDR	X3, [sp], #16
	
	MOV X4, X1
	BL str_Equals

exit:
	LDR	LR, [sp], #16
	RET		LR				// return to Link Register
	
	.end
