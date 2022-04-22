	.data	
szTestExample: .asciz "Cat in the Hat hat"
szTestExample2: .asciz "HAT"
cLF: .byte 10 //char value of new line
chLet:		.skip	1
chLetter:	.byte	'g'
indexResult: .quad 0
szResult:	.skip 24
	.global _start // provide program starting point
	
	.text
	
_start:

	//Display Intro Message
	LDR X0, =szTestExample //load strIntro
	BL putstring //Display String
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
//test lowercase
	LDR X0, =szTestExample
	bl Str_toLowerCase	
	LDR X0, =szTestExample
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
//test uppercase
	LDR X0, =szTestExample
	bl Str_toUpperCase	
	LDR X0, =szTestExample
	bl putstring 
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char

//test indexof1	
	LDR X0, =szTestExample
	LDR X1, =chLet
	mov X6, 'H'
	strb W6, [X1]
	bl String_indexOf_1
	ldr X0, =indexResult
	STR X1, [X0]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
//test indexof2
	LDR X0, =szTestExample
	LDR X1, =chLet
	mov X3, 'A'
	strb W3, [X1]
	MOV X2, #5
	bl String_indexOf_2
	LDR X0, =indexResult
	STR X1, [X0]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	

//test indexof3
	LDR X0, =szTestExample
	LDR X1, =szTestExample2
	bl String_indexOf_3
	LDR X0, =indexResult
	STR X1, [X0]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
//test String_lastIndexof_1
	LDR X0, =szTestExample
	LDR X1, =chLet
	mov X6, 'H'
	strb W6, [X1]
	bl String_lastIndexOf_1
	ldr X0, =indexResult
	STR X1, [X0]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
		
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
//test lastindexof2
	LDR X0, =szTestExample
	LDR X1, =chLet
	mov X3, 'A'
	strb W3, [X1]
	MOV X2, #5
	bl String_lastIndexOf_2
	LDR X0, =indexResult
	STR X1, [X0]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
//test indexof3
	LDR X0, =szTestExample
	LDR X1, =szTestExample2
	bl String_lastIndexOf_3
	LDR X0, =indexResult
	STR X1, [X0]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char


	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char

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
	