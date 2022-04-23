//str_charAt
// X3: Points to first byte of a CString
// X1: Points to first byte of a CString to return to
// X13: Contains the index
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	

.global str_charAt          //Provide program starting address to linker

    .text

str_charAt:
STR	LR, [sp, #-16]! //Push LR to stack

SUB X13, X13, #1    //Decrement X13

LDRB W0, [X3, X13]	//Load the current increment
STRB W0, [X1]       //Store W0

LDR	LR, [sp], #16  //restore from stack
ret                // return to Link Register
