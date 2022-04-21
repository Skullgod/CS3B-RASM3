//String_copy
//Subroutine String_copy copies string
// X0: Points to first byte of a CString
// LR: Contains the return address

// Return register contents:
// All AAPCS registers are preserved.	
//	X0, X1, and X2 are modified and not preserved

.global String_copy             //Provide program starting address to linker

    .text

String_copy:
        str LR, [SP, #-16]! //moving registers to stack
        str X0, [SP, #-16]! //move SP by 16 bytes
        bl strlength		//get string length
        add X0, X0, #1	    //add 1 to string length to account for null
        str X0, [SP, #-16]!  //store X0 into SP

        bl malloc			//malloc

        ldr X1, [SP], #16  //load from sp
        ldr X2, [SP], #16  //load from sp
        str X1, [SP, #-16]! //store into sp

loop:
        ldrb W3, [X2], #1  //loading w3 with the next bye from string
        strb W3, [X0], #1  //storing w3 onto next byte into x0

        cmp W3, #0  //compare if null character
        b.eq stop  //if contains null, end loop

        b loop   //loop

stop:
        ldr X1, [SP], #16  //load from sp
        sub X0, X0, X1     //moving character pointer to start of the string

        ldr LR, [SP], #16  //restore from stack
        ret                         // return to Link Register
		