//str_Equals
// X3: Points to first byte of a CString
// X4: Points to first byte of a CString
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	

	.data

	.global str_Equals
	
	.text	
str_Equals:

	MOV X12, #0		//Set X12 to 0
	
///////////////////////////////////////////////////////////////
	top:	//top of function
	
	LDRB W0, [X3, X12]	//Load the current increment
	LDRB W1, [X4, X12]	//Load the current increment
	
	CMP X0, X1			//Compare X0 and X1
	BNE notEqual		//If they are not equal, branch
	
	CMP X0, #0			//Compare X0 to null
	BEQ equalCase		//If X0 is equal to null, stop loop

	ADD X12, X12, #1	//Increment X12
	B top		//End of subLoop
///////////////////////////////////////////////////////////////	

	notEqual:		//Not Equal Case
	MOV X0, #0		//Set X0 to 0
	b exit			//Branch to Exit
	
	equalCase:		//Equal Case
	MOV X0, #1		//Set X0 to 1
	b exit			//Branch to Exit
	
exit:
	RET		LR				// return to Link Register
	
	.end
