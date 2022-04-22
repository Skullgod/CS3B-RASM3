//String_concat
//Subroutine String__concat concatenates the specified string “str” at the end of the string.
// X0: Contains the first string
// X1: contains the second string, 
// LR: Contains the return address
// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, X3, and X4 are modified and not preserved

	.data

ptrA:	.quad	0
ptrB:   .quad	0
ptrStr:	.quad	0

	.global String_concat
	
	.text

String_concat:
    ldr X2, =ptrA           // load ptrA in X2
    str X0, [X2]            // store address of ptrA into X0
    ldr X3, =ptrB           // move ptrB into X3
    str X1, [X3]            // store address of ptrB into X1
    
	str	lr, [sp, #-16]!	    // push lr to the stack
    bl  strlength           // get strlength 
    ldr	lr, [sp], #16	    // load lr back from stack
    mov X4, X2              // mov strlength into X4
    
    ldr X0, =ptrB           // load ptrB in X0
    ldr X0, [X0]            // load variable from address
    str	lr, [sp, #-16]!	    // push lr to the stack
    bl strlength            // get strlength 
    ldr lr, [sp], #16	    // load lr back from stack
    add X4, X4, X2          //add 2 str lengths together
    

    mov X0, X4              // get str length for malloc
    str lr, [sp, #-16]!	    // push lr to the stack
    bl malloc               // call malloc
    ldr lr, [sp], #16	    // load lr back from stack

    ldr X1, =ptrStr      	// load ptrStr in X1
    str X0, [X1]            // store the value in X0 into address of X1

    ldr X0, =ptrA           // load ptrA in X0
    ldr X0, [X0]            // load variable from address
    ldr X3, =ptrB           // load ptrB into X3
    ldr X3, [X3]            // load variable from address
    ldr X1, [X1]          	// load into X1 the address pointed to by X1

next:
    ldrb W2, [X0], #1      // load the value at that address 
    cmp W2, #0             // check if end of string
    beq cont         	   // if it is move to the next one
    strb W2, [X1], #1      // put the value from X2 into X1
    b next                 // go back to the top
    
cont:
    ldrb W2, [X3], #1     // load the value at that address 
    cmp W2, #0            // compare to see if it is end of string
    beq exit	          // if it is move to the next one
    strb W2, [X1], #1     // put the value from X2 into X1
    b cont                // go back to the top  
    
exit:
	ldr X0, =ptrStr   	 //load ptrStr into X1
	ldr X0, [X0]          // load variable from address
    ret LR      		 // return link register
	