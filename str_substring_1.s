//str_substring_1
// X3: Points to first byte of a CString
// X1: Points to first byte of a CString to return to
// X12: Contains the index
// X14: Contains the index
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	

.global str_substring_1            //Provide program starting address to linker

    .text

str_substring_1:

        STR	LR, [sp, #-16]!    //Push LR to stack
        STR	X14, [sp, #-16]!   //Push X14 to stack
        STR	X12, [sp, #-16]!   //Push X12 to stack
        STR	X3, [sp, #-16]!    //Push X3 to stack
        STR	X1, [sp, #-16]!    //Push X1 to stack
        MOV X0, #21		   //Move 21 into X0
	BL malloc                  //Branch to malloc
        LDR	X1, [sp], #16	   //Load X1 From the stack 
        LDR	X3, [sp], #16	   //Load X3 From the stack 
        LDR	X12, [sp], #16     //Load X12 From the stack 
        LDR	X14, [sp], #16     //Load X14 From the stack 
        break19:
	
        
	STR X0, [X1]		//Dereference
	MOV X15, #0             //Move 0 into X15
        SUB X12, X12, #1        //Decrement X12
	MOV X2, #13		//Move 4 into X2
	LDR X1,[X1]		//Save the address of X1
	
///////////////////////////////////////////////////////////////
top1:	                        //Top of the first function
	CMP X12, X14		//Compare X2 to 0
	BEQ bot1		//if X2 = 0 branch
	LDRB W4, [X3, X12]	//Load the first byte
	STRB W4, [X1, X15]	//Store the first byte
	ADD X12, X12, #1	//Decrement X12
        ADD X15, X15, #1	//Decrement X15
	b top1			//Branch to top
	
bot1:			//Bottom of first function
///////////////////////////////////////////////////////////////

stop:

        ldr LR, [SP], #16  //restore from stack
        ret                // return to Link Register
