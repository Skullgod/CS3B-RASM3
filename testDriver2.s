//Author:	Dawson Graf
//Lab:		Exam 2
//Purpose: 	Store two strings and convert to upper case
//Modified:	4/20/2022	
	
	
	.data
szStr1: .skip 21		//Second Input Buffer
szStr2: .skip 21		//First Input Buffer
szStr3: .skip 21		//First Input Buffer
szStr4: .skip 21
szStr5: .skip 21
chLet:		.skip	1
chLetter:	.byte	'g'
indexResult: .quad 0
szResult:	.skip 24
szTemp1: .asciz " hat."
szTemp2: .asciz "Cat"
szTemp3: .asciz "in the hat."
szTemp4: .asciz "g"
szTemp5: .asciz "eggs"
szTemp6: .asciz "egg"
szTemp7: .asciz "a"
szTemp8: .asciz "o"
szTemp9: .asciz " "
ptrString3: .quad 0		//First Input Buffer
ptrString:  .quad 0		//Pointer for the final string
ptrString2: .quad 0
	
szMsg4: .asciz "Enter String 1: "
szMsg5: .asciz "Enter String 2: "
szMsg6: .asciz "Enter String 3: "
szMsg7: .asciz "True"
szMsg8: .asciz "False"



szMsg10: .asciz "String_equals(s1,s3) = "
szMsg11: .asciz "String_equals(s1,s1) = "
szMsg12: .asciz "String_equalsIgnoreCase(s1,s3) = "
szMsg13: .asciz "String_equalsIgnoreCase(s1,s2) = "
szMsg14: .asciz "String_substring_1(s3,4,14) = "
szMsg15: .asciz "String_substring_2(s3,7) = "
szMsg16: .asciz "String_charAt(s2,4) = "
szMsg17: .asciz "String_startsWith_1(s1,11,'hat.') = "
szMsg18: .asciz "String_startsWith_2(s1,'Cat') = "
szMsg19: .asciz "String_endsWith(s1,'in the hat.') = "
szMsg20: .asciz "String_indexOf_1(s2,'g') = "
szMsg21: .asciz "String_indexOf_2(s2,'g',9) = "
szMsg22: .asciz "String_indexOf_3(s2,'eggs') = "
szMsg23: .asciz "String_lastIndexOf_1(s2,'g') = "
szMsg24: .asciz "String_lastIndexOf_2(s2,'g',6) = "
szMsg25: .asciz "String_lastIndexOf_3(s2,'egg') = "
szMsg26: .asciz "String_replace(s1,'a','o') = "
szMsg27: .asciz "String_toLowerCase(s1) = "
szMsg28: .asciz "String_toUpperCase(s1) = "
szMsg29: .asciz "String_concat(s1, ' ');"
szMsg30: .asciz "String_concat(s1, s2) = "
szMsg31: .asciz "s1.length() = "
szMsg32: .asciz "s2.length() = "
szMsg33: .asciz "s3.length() = "
cLF: .byte 10 //char value of new line

	.global _start // provide program starting point
	
	.text
	
_start:

	LDR X0, =szMsg4
	bl putstring

	LDR X0,=szStr1		//Specify where to store
	MOV X1,#21		//Specify string length
	BL getstring	//Call getstring
	
	LDR X0, =szMsg5
	bl putstring

	LDR X0,=szStr2		//Specify where to store
	MOV X1,#21		//Specify string length
	BL getstring	//Call getstring
	
	LDR X0, =szMsg6
	bl putstring

	LDR X0,=szStr3		//Specify where to store
	MOV X1,#21		//Specify string length
	BL getstring	//Call getstring
	
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	
///////////////////////////////////////////////////////////////////////
	LDR X0, =szStr1
	//LDR X0, =szStr4

	bl String_copy
	
	break1:

	LDR X0, =szStr1
	bl putstring

	break2:

	LDR X0, =szStr4
	
	
	bl putstring

	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char

///////////////////////////////////////////////////////////////////////
	
	
	
///////////////////////////////////////////////////////////////////////
	LDR X0, =szMsg31
	bl putstring

	
	LDR X0, =szStr1
	BL stringLength
	ldr X1, =indexResult
	STR X2, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg32
	bl putstring
	
	
	LDR X0, =szStr2
	BL stringLength
	ldr X1, =indexResult
	STR X2, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	
	LDR X0, =szMsg33
	bl putstring
	
	LDR X0, =szStr3
	BL stringLength
	ldr X1, =indexResult
	STR X2, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	

///////////////////////////////////////////////////////////////////////	

	
///////////////////////////////////////////////////////////////////////	
	LDR X0, =szMsg10
	bl putstring
	
	LDR X3, =szStr1
	LDR X4, =szStr3
	
	bl str_Equals
	
	CMP X0, #1
	BNE notEqual
	
	LDR X0, =szMsg7
	bl putstring
	b equalCase
	
	notEqual:
	
	LDR X0, =szMsg8
	bl putstring
	
	
	equalCase:
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////	
	
	
///////////////////////////////////////////////////////////////////////	
	LDR X0, =szMsg11
	bl putstring
		
	LDR X3, =szStr1
	LDR X4, =szStr1
	
	bl str_Equals
	
	CMP X0, #1
	BNE notEqual1
	
	LDR X0, =szMsg7
	bl putstring
	b equalCase1
	
	notEqual1:
	
	LDR X0, =szMsg8
	bl putstring
	
	
	equalCase1:
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////	


///////////////////////////////////////////////////////////////////////	
	LDR X0, =szMsg12
	bl putstring


	LDR X8, =szStr1
	LDR X9, =szStr3
	
	bl str_EqualsIgnoreCase
	
	CMP X0, #1
	BNE notEqual2
	
	LDR X0, =szMsg7
	bl putstring
	b equalCase2
	
	notEqual2:
	
	LDR X0, =szMsg8
	bl putstring
	
	
	equalCase2:
///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg13
	bl putstring


	LDR X8, =szStr1
	LDR X9, =szStr2
	
	bl str_EqualsIgnoreCase
	
	CMP X0, #1
	BNE notEqual3
	
	LDR X0, =szMsg7
	bl putstring
	b equalCase3
	
	notEqual3:
	
	LDR X0, =szMsg8
	bl putstring
	
	
	equalCase3:
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg14
	bl putstring

	LDR X3, =szStr3
	LDR X1, =ptrString
	MOV X12, #4
	MOV X14, #14

	bl str_substring_1
	
	MOV X1, #0
	MOV X0, #0
	
	LDR X0, =ptrString
	LDR X0, [X0]
	bl putstring
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg15
	bl putstring

	LDR X3, =szStr3
	LDR X1, =ptrString
	MOV X12, #7

	bl str_substring_2
	
	
	MOV X1, #0
	MOV X0, #0
	
	LDR X0, =ptrString
	LDR X0, [X0]
	bl putstring
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg16
	bl putstring

	LDR X3, =szStr2
	LDR X1, =ptrString2
	MOV X13, #4

	bl str_charAt
	
	LDR X0, =ptrString2
	bl putstring
	
	
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg17
	bl putstring

	LDR X3, =szStr1
	LDR X4, =szTemp1
	MOV X13, #11

	bl str_startsWith_1
	
	
	
	CMP X0, #1
	BNE notEqual4
	
	LDR X0, =szMsg7
	bl putstring
	b equalCase4
	
	notEqual4:
	
	LDR X0, =szMsg8
	bl putstring
	
	
	equalCase4:
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg18
	bl putstring

	LDR X3, =szStr1
	LDR X4, =szTemp2


	bl str_startsWith_2
	
	
	
	CMP X0, #1
	BNE notEqual5
	
	LDR X0, =szMsg7
	bl putstring
	b equalCase5
	
	notEqual5:
	
	LDR X0, =szMsg8
	bl putstring
	
	
	equalCase5:
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg19
	bl putstring


	LDR X3, =szStr1
	LDR X4, =szTemp3
	
	
	bl str_endsWith
	
	CMP X0, #1
	BNE notEqual6
	
	LDR X0, =szMsg7
	bl putstring
	b equalCase6
	
	notEqual6:
	
	LDR X0, =szMsg8
	bl putstring
	
	
	equalCase6:
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
///////////////////////////////////////////////////////////////////////	
///////////////////////////////////////////////////////////////////////	





///////////////////////////////////////////////////////////////////////	
///////////////////////////////////////////////////////////////////////	
//test indexof1	
	
	LDR X0, =szMsg20
	bl putstring

	LDR X0, =szStr2
	LDR X1, =chLet
	mov X6, 'g'
	strb W6, [X1]
	bl String_indexOf_1
	ldr X1, =indexResult
	STR X0, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////	


///////////////////////////////////////////////////////////////////////	
//test indexof2

	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	LDR X0, =szMsg21
	bl putstring

	LDR X0, =szStr2
	LDR X1, =chLet
	mov X3, 'g'
	strb W3, [X1]
	MOV X2, #9
	bl String_indexOf_2
	LDR X1, =indexResult
	STR X0, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////	
	
	
///////////////////////////////////////////////////////////////////////	
//test indexof3
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	LDR X0, =szMsg22
	bl putstring


	LDR X0, =szStr2
	LDR X1, =szTemp5
	bl String_indexOf_3
	LDR X1, =indexResult
	STR X0, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////	
	
	
///////////////////////////////////////////////////////////////////////	
//test String_lastIndexof_1
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	LDR X0, =szMsg23
	bl putstring

	LDR X0, =szStr2
	LDR X1, =chLet
	mov X6, 'g'
	strb W6, [X1]
	bl String_lastIndexOf_1
	ldr X1, =indexResult
	STR X0, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
		
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////		

	
///////////////////////////////////////////////////////////////////////		
//test lastindexof2

	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	LDR X0, =szMsg24
	bl putstring
	
	
	LDR X0, =szStr2
	LDR X1, =chLet
	mov X3, 'g'
	strb W3, [X1]
	MOV X2, #6
	bl String_lastIndexOf_2
	LDR X1, =indexResult
	STR X0, [X1]
	
	LDR X1, =szResult
	LDR X0, =indexResult
	LDR X0, [X0]
	bl int64asc
	
	LDR X0, =szResult
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////		
	
	
///////////////////////////////////////////////////////////////////////		
//test lastIndexOf_3

	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	LDR X0, =szMsg25
	bl putstring

	LDR X0, =szStr2
	LDR X1, =szTemp6
	bl String_lastIndexOf_3
	LDR X1, =indexResult
	STR X0, [X1]
	
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
///////////////////////////////////////////////////////////////////////	


///////////////////////////////////////////////////////////////////////
	
	LDR X0, =szMsg26
	bl putstring

	LDR X0, =szStr1
	MOV X1, 'a'
	MOV X2, 'o'
	bl String_replace

	LDR X0, =szStr1
	bl putstring
	
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////

	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	LDR X0, =szMsg27
	bl putstring
	
//test lowercase
	LDR X0, =szStr1
	bl Str_toLowerCase	
	LDR X0, =szStr1
	bl putstring
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF //load new line feed
	BL putch //print char
	
	LDR X0, =szMsg28
	bl putstring
	
	LDR X0, =szStr1
	bl Str_toUpperCase	
	LDR X0, =szStr1
	bl putstring 
	
	//Print Line Feed
	LDR X0, =cLF //load new line feed
	BL putch //print char
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF //load new line feed
	BL putch //print char

	LDR X0, =szMsg29
	bl putstring

	LDR X0, =szStr1
	LDR X1, =szTemp9
	bl String_concat

	LDR X1, =szResult
	STR X0, [X1]
	
	LDR X0, =cLF //load new line feed
	BL putch //print char
	

///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =szMsg30
	bl putstring

	LDR X0, =szResult
	LDR X0, [X0]
	LDR X1, =szStr2
	bl String_concat
	
	LDR X1, =szResult
	STR X0, [X1]

	LDR X0, =szResult
	LDR X0, [X0]
	bl putstring

///////////////////////////////////////////////////////////////////////
	
	
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	// Standard exit sequence
	// Setup the parameters to exit the program
	MOV X0, #0	// Use 0 return code
	MOV X8, #93 //Service command code 93 terminates this program
	SVC 0		//Call linux to terminate the program
	.end
