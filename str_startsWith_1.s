//str_startsWith_1
// X3: Points to first byte of a CString
// X4: Points to first byte of a CString
// X13: Contains the begining index
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	

	.data

	.global str_startsWith_1
	
	.text
str_startsWith_1:
	STR	LR, [sp, #-16]!
	
	MOV X0, X4		//Move X4 to X0
	bl stringLength	//Branch to stringLength
	MOV X12, X2		//Set X12 to 0
	
	MOV X15, #0
	SUB X13, X13, #1
///////////////////////////////////////////////////////////////
	top:	//Top of function
	CMP X12, #0
	BEQ equalCase
	
	LDRB W0, [X3, X13]	//Load the current increment
	LDRB W1, [X4, X15]	//Load the current increment
	
	CMP X0, X1
	BNE notEqual
	
	SUB X12, X12, #1	//Decrement X12
	ADD X13, X13, #1	//Decrement X12
	ADD X15, X15, #1	//Decrement X12
	B top	//End of subLoop
///////////////////////////////////////////////////////////////
	
	notEqual:
	MOV X0, #0
	b exit
	
	equalCase:
	MOV X0, #1
	b exit
	
	
	
	
exit:
	LDR	LR, [sp], #16
	RET		LR				// return to Link Register
	
	.end
