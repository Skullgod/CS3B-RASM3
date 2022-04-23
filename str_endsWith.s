//str_endsWith
// X3: Points to first byte of a CString
// X4: Points to first byte of a CString
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	

	.data

	.global str_endsWith
	
	.text	
str_endsWith:
	STR	LR, [sp, #-16]!
	
	MOV X0, X4		//Move X4 to X0
	bl stringLength	//Branch to String length
	MOV X12, X2		//Set X12 to 0
	
	
	MOV X0, X3		//Move X3 to X0
	bl stringLength	//Branch to String length
	MOV X13, X2		//Set X12 to 0
	
///////////////////////////////////////////////////////////////
	top:	//Top of function
	
	LDRB W0, [X3, X13]	//Load the current increment
	LDRB W1, [X4, X12]	//Load the current increment
	
	CMP X0, X1
	BNE notEqual
	
	CMP X12, #0
	BEQ equalCase
	
	
	SUB X12, X12, #1	//Decrement X12
	SUB X13, X13, #1	//Decrement X12
	B top	//End of subLoop
///////////////////////////////////////////////////////////////
	
	notEqual:		//Not equal
	MOV X0, #0		//Set X0 to Zero
	b exit			//Branch to Exit
	
	equalCase:		//Equal Case
	MOV X0, #1		//Set X0 to One
	b exit			//Branch to Exit
	
	
exit:
	LDR	LR, [sp], #16
	RET		LR				// return to Link Register
	
	.end
