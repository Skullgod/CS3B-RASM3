//str_startsWith_2
// X3: Points to first byte of a CString
// X4: Points to first byte of a CString
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	

	.data

	.global str_startsWith_2
	
	.text	
str_startsWith_2:
	STR	LR, [sp, #-16]! 	//Push LR to stack
	
	MOV X0, X4		//Move X4 to X0
	bl stringLength	//Branch to string length
	MOV X12, X2		//Set X12 to 0
	MOV X13, #0		//Set X13 to 0
	
	
///////////////////////////////////////////////////////////////
	top:	//InputCheck1 function
	CMP X12, #0			//Compare X12 to 0
	BEQ equalCase		//Branch if Equal
	
	LDRB W0, [X3, X13]	//Load the current increment
	LDRB W1, [X4, X13]	//Load the current increment
	
	CMP X0, X1			//Compare X0 to X1
	BNE notEqual		//Branch if not Equal
	
	internalSkipCheck:	//skipMinusCheck1
	
	SUB X12, X12, #1	//Decrement X12
	ADD X13, X13, #1	//Decrement X12
	B top	//End of subLoop
///////////////////////////////////////////////////////////////

	notEqual:		//Not equal
	MOV X0, #0		//Set X0 to Zero
	b exit			//Branch to Exit
	
	equalCase:		//Equal Case
	MOV X0, #1		//Set X0 to One
	b exit			//Branch to Exit
	
	
	
exit:
	LDR	LR, [sp], #16		//restore from stack
	RET		LR				// return to Link Register
	
	.end
