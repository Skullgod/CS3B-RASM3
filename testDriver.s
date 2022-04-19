	.data	
szTestExample: .asciz "Cat in the Hat"
cLF: .byte 10 //char value of new line

	.global _start // provide program starting point
	
	.text
	
_start:

	//Display Intro Message
	LDR X0, =szTestExample //load strIntro
	BL putstring //Display String
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	

	LDR X0, =szTestExample
	bl Str_toLowerCase	
	LDR X0, =szTestExample
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	

	LDR X0, =szTestExample
	bl Str_toUpperCase	
	LDR X0, =szTestExample
	bl putstring

exit:
	
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	// Standard exit sequence
	// Setup the parameters to exit the program
	// and then call Linux to do it.
	MOV X0, #0	// Use 0 return code
	MOV X8, #93 //Service command code 93 terminates this program
	SVC 0		//Call linux to terminate the program
	.end
	