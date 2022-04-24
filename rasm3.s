//Author:	Dawson Graf & Andrew Hua
//Lab:		RASM 3
//Purpose: 	Preform various string operations
//Modified:	4/24/2022	
	
	
	.data
szStr1: .skip 21		
szStr2: .skip 21		
szStr3: .skip 21		
szStr4: .skip 21
szStr5: .skip 21
szStr6: .quad 0

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
ptrString3: .quad 0		
ptrString:  .quad 0		
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
szMsg34: .asciz "s4 = String_copy(s1)"
szMsg35: .asciz "s1 = "
szMsg36: .asciz "s4 = "
cLF: .byte 10 //char value of new line

	.global _start // provide program starting point
	
	.text
	
_start:

	LDR X0, =szMsg4		//Load Msg4
	bl putstring		//Output X0

	LDR X0,=szStr1		//Specify where to store
	MOV X1,#21			//Specify string length
	BL getstring		//Call getstring
	
	LDR X0, =szMsg5		//Load szMsg
	bl putstring		//Output X0

	LDR X0,=szStr2		//Specify where to store
	MOV X1,#21			//Specify string length
	BL getstring		//Call getstring
	
	LDR X0, =szMsg6		//Load szMsg
	bl putstring		//Output X0

	LDR X0,=szStr3		//Specify where to store
	MOV X1,#21			//Specify string length
	BL getstring		//Call getstring
	
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
	LDR X0, =szMsg31		//Load szMsg
	bl putstring			//Output X0

	
	LDR X0, =szStr1			//load szStr
	BL stringLength			//Branch
	ldr X1, =indexResult	//Load into szResult
	STR X2, [X1]			//Store X1
	
	LDR X1, =szResult		//Load into szResult
	LDR X0, =indexResult	//Load indexResult
	LDR X0, [X0]			//Dereference
	bl int64asc				//Branch
	
	LDR X0, =szResult
	bl putstring			//Output X0
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
	LDR X0, =szMsg32		//Load szMsg
	bl putstring			//Output X0
	
	
	
	LDR X0, =szStr2			//load szStr
	BL stringLength			//Branch
	ldr X1, =indexResult	//Load into X1
	STR X2, [X1]			//Load into X1
	
	LDR X1, =szResult		//Load into szResult
	LDR X0, =indexResult	//Load indexResult
	LDR X0, [X0]			//Dereference
	bl int64asc				//Branch
	
	LDR X0, =szResult		//Load indexResult
	bl putstring			//Output X0
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
	LDR X0, =szMsg33		//Load szMsg
	bl putstring			//Output X0
	
	
	
	LDR X0, =szStr3			//load szStr
	BL stringLength			//Branch
	ldr X1, =indexResult	//Load into X1
	STR X2, [X1]			//Load into X1
	
	LDR X1, =szResult		//Load into szResult
	LDR X0, =indexResult	//Load indexResult
	LDR X0, [X0]			//Dereference
	bl int64asc				//Branch
	
	LDR X0, =szResult
	bl putstring			//Output X0
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
///////////////////////////////////////////////////////////////////////	

	
///////////////////////////////////////////////////////////////////////	
	LDR X0, =szMsg10		//Load szMsg
	bl putstring			//Output X0
	
	LDR X3, =szStr1			//load szStr
	LDR X4, =szStr3			//load szStr
	bl str_Equals			//Branch
	
	CMP X0, #1				//Compare
	BNE notEqual			//Branch
	
	LDR X0, =szMsg7			//Load szMsg
	bl putstring			//Output X0
	b equalCase				//Branch
	
	notEqual:				//not Equal
	LDR X0, =szMsg8			//Load szMsg
	bl putstring			//Output X0
	
	equalCase:				//Equal Case
	
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
///////////////////////////////////////////////////////////////////////	
	
	
///////////////////////////////////////////////////////////////////////	
	LDR X0, =szMsg11		//Load szMsg
	bl putstring			//Output X0
		
	LDR X3, =szStr1			//load szStr
	LDR X4, =szStr1			//load szStr
	bl str_Equals			//Branch
	
	CMP X0, #1				//Compare
	BNE notEqual1			//Branch
	
	LDR X0, =szMsg7			//Load szMsg
	bl putstring			//Output X0
	b equalCase1			//Branch
	
	notEqual1:				//Not Equal
	LDR X0, =szMsg8			//Load szMsg
	bl putstring			//Output X0
	
	
	equalCase1:				//Equal Case
	
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
///////////////////////////////////////////////////////////////////////	


///////////////////////////////////////////////////////////////////////	
	LDR X0, =szMsg12		//Load szMsg
	bl putstring			//Output X0


	LDR X8, =szStr1			//load szStr
	LDR X9, =szStr3			//load szStr
	
	bl str_EqualsIgnoreCase	//Branch
	
	CMP X0, #1				//Cpmpare
	BNE notEqual2			//Branch
	
	LDR X0, =szMsg7			//Load szMsg
	bl putstring			//Output X0
	b equalCase2			//Branch
	
	notEqual2:
	LDR X0, =szMsg8			//Load szMsg
	bl putstring			//Output X0
	equalCase2:				//Equal Case
///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////	
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
	LDR X0, =cLF 			//load new line feed
	BL putch 				//print char
	
	LDR X0, =szMsg13		//Load szMsg
	bl putstring			//Output X0


	LDR X8, =szStr1			//load szStr
	LDR X9, =szStr2			//load szStr
	bl str_EqualsIgnoreCase	//Branch
	
	CMP X0, #1				//Compare
	BNE notEqual3			//Branch
	
	LDR X0, =szMsg7			//Load szMsg
	bl putstring			//Output X0
	b equalCase3
	
	notEqual3:				//Not equal
	LDR X0, =szMsg8			//Load szMsg
	bl putstring			//Output X0
	
	
	equalCase3:				//Equal case
///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg34	//Load szMsg
	bl putstring		//Output X0

	LDR X3, =szStr1		//load szStr
	LDR X1, =szStr6		//load szStr
	bl String_copy		//Branch
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg35  	//Load szMsg
	bl putstring		//Output X0
	LDR X0, =szStr1		//load szStr
	bl putstring		//Output X0
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =szMsg36	//Load szMsg
	bl putstring		//Output X0
	LDR X0, =szStr6		//load szStr
	LDR X0, [X0]		//Dereference
	bl putstring		//Output X0

///////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg14	//Load szMsg
	bl putstring		//Output X0

	LDR X3, =szStr3		//load szStr
	LDR X1, =ptrString	//Load ptrString
	MOV X12, #4			//set begining index
	MOV X14, #14		//set end index

	bl str_substring_1	//Branch
	
	MOV X1, #0			//Set X1 0
	MOV X0, #0			//Set X0 0
	
	LDR X0, =ptrString	//Load ptrString
	LDR X0, [X0]		//Dereference
	bl putstring		//Output X0
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg15	//Load szMsg
	bl putstring		//Output X0

	LDR X3, =szStr3		//load szStr
	LDR X1, =ptrString	//Load ptrString
	MOV X12, #7			//Move X12, 7

	bl str_substring_2	//Branch
	
	
	MOV X1, #0			//Set X1 0
	MOV X0, #0			//Set X0 0
	
	LDR X0, =ptrString	//Load ptrString
	LDR X0, [X0]		//Dereference
	bl putstring		//Output X0
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg16	//Load szMsg
	bl putstring		//Output X0

	LDR X3, =szStr2		//load szStr
	LDR X1, =ptrString2	//Load ptrString2
	MOV X13, #4			//Load index

	bl str_charAt		//Branch
	
	LDR X0, =ptrString2	//Load ptrString2
	bl putstring		//Output X0
	
	
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg17	//Load szMsg
	bl putstring		//Output X0

	LDR X3, =szStr1		//load szStr
	LDR X4, =szTemp1	//Load szTemp
	MOV X13, #11		//Load index

	bl str_startsWith_1	//Branch
	
	
	
	CMP X0, #1			//Compare X0
	BNE notEqual4		//Branch
	
	LDR X0, =szMsg7		//Load szMsg
	bl putstring		//Output X0
	b equalCase4		//Branch
	
	notEqual4:			//Not Equal
	
	LDR X0, =szMsg8		//Load szMsg
	bl putstring		//Output X0
	
	
	equalCase4:			//EqualCase
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg18	//Load szMsg
	bl putstring		//Output X0

	LDR X3, =szStr1		//load szStr
	LDR X4, =szTemp2	//load szStr


	bl str_startsWith_2	//Branch
	
	
	
	CMP X0, #1			//Compare X0
	BNE notEqual5		//Branch
	
	LDR X0, =szMsg7		//Load szMsg
	bl putstring		//Output X0
	b equalCase5		//Branch
	
	notEqual5:			//notEqual
	
	LDR X0, =szMsg8		//Load szMsg
	bl putstring		//Output X0
	
	
	equalCase5:			//equalCase
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg19	//Load szMsg
	bl putstring		//Output X0


	LDR X3, =szStr1		//load szStr
	LDR X4, =szTemp3	//Load szTemp
	
	
	bl str_endsWith		//Branch
	
	CMP X0, #1			//Compare X0
	BNE notEqual6		//Branch
	
	LDR X0, =szMsg7		//Load szMsg
	bl putstring		//Output X0
	b equalCase6		//Branch
	
	notEqual6:			//Not equal case
	
	LDR X0, =szMsg8		//Load szMsg
	bl putstring		//Output X0
	
	
	equalCase6:			//Equal case
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
///////////////////////////////////////////////////////////////////////	
///////////////////////////////////////////////////////////////////////	





///////////////////////////////////////////////////////////////////////	
///////////////////////////////////////////////////////////////////////	
//test indexof1	
	
	LDR X0, =szMsg20	//Load szMsg
	bl putstring		//Output X0

	LDR X0, =szStr2		//load szStr
	LDR X1, =chLet		//Load chLet
	mov X6, 'g'			//Load X6
	strb W6, [X1]		//Load X6
	bl String_indexOf_1	//Branch
	ldr X1, =indexResult//Load szResult
	STR X0, [X1]		//Load szResult
	
	LDR X1, =szResult	//Load szResult
	LDR X0, =indexResult//Load szResult
	LDR X0, [X0]		//Dereference
	bl int64asc			//Branch
	
	LDR X0, =szResult	//Load szResult
	bl putstring		//Output X0
	
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////	


///////////////////////////////////////////////////////////////////////	
//test indexof2

	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg21	//Load szMsg
	bl putstring		//Output X0

	LDR X0, =szStr2		//load szStr
	LDR X1, =chLet		//Load chLet
	mov X3, 'g'			//Load X3
	strb W3, [X1]		//Load X3
	MOV X2, #9			//Load X2 #9
	bl String_indexOf_2	//Branch
	LDR X1, =indexResult//Load szResult
	STR X0, [X1]		//Load szResult
	
	LDR X1, =szResult	//Load szResult
	LDR X0, =indexResult//Load szResult
	LDR X0, [X0]		//Dereference
	bl int64asc
	
	LDR X0, =szResult	//Load szResult
	bl putstring		//Output X0
	
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////	
	
	
///////////////////////////////////////////////////////////////////////	
//test indexof3
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg22	//Load szMsg
	bl putstring		//Output X0


	LDR X0, =szStr2		//load szStr
	LDR X1, =szTemp5	//load szStr
	bl String_indexOf_3	//Branch
	LDR X1, =indexResult//Load szResult
	STR X0, [X1]		//Load szResult
	
	LDR X1, =szResult	//Load szResult
	LDR X0, =indexResult//Load szResult
	LDR X0, [X0]		//Dereference
	bl int64asc			//Branch
	
	LDR X0, =szResult	//Load szResult
	bl putstring		//Output X0
	
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////	
	
	
///////////////////////////////////////////////////////////////////////	
//test String_lastIndexof_1
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg23	//Load szMsg
	bl putstring		//Output X0

	LDR X0, =szStr2		//load szStr
	LDR X1, =chLet		//Load chlet
	mov X6, 'g'			//Move X6 g
	strb W6, [X1]		//Store W6
	bl String_lastIndexOf_1	//Branch
	ldr X1, =indexResult	//Load szResult
	STR X0, [X1]			//Load szResult
	
	LDR X1, =szResult	//Load szResult
	LDR X0, =indexResult//Load szResult
	LDR X0, [X0]		//Dereference
	bl int64asc			//Branch
	
	LDR X0, =szResult
	bl putstring		//Output X0
		
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////		

	
///////////////////////////////////////////////////////////////////////		
//test lastindexof2

	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg24	//Load szMsg
	bl putstring		//Output X0
	
	
	LDR X0, =szStr2		//load szStr
	LDR X1, =chLet		//Load X1 chlet
	mov X3, 'g'				//set X3, g
	strb W3, [X1]			//store W3
	MOV X2, #6				//Set X2 6
	bl String_lastIndexOf_2	//Branch
	LDR X1, =indexResult	//Load szResult
	STR X0, [X1]			//Load szResult
	
	LDR X1, =szResult	//Load szResult
	LDR X0, =indexResult//Load indexResult
	LDR X0, [X0]		//Dereference
	bl int64asc			//Branch
	
	LDR X0, =szResult	//Load szResult
	bl putstring		//Output X0
	
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////		
	
	
///////////////////////////////////////////////////////////////////////		
//test lastIndexOf_3

	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg25	//Load szMsg
	bl putstring		//Output X0

	LDR X0, =szStr2		//load szStr
	LDR X1, =szTemp6	//load szStr
	bl String_lastIndexOf_3	//Branch
	LDR X1, =indexResult	//Load indexResult
	STR X0, [X1]			//Str X0
	
	LDR X1, =szResult	//Load szResult
	LDR X0, =indexResult//Load X0
	LDR X0, [X0]		//Dereference
	bl int64asc			//Branch
		
	LDR X0, =szResult	//Load szResult
	bl putstring		//Output X0
	
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char


	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////	


///////////////////////////////////////////////////////////////////////
	
	LDR X0, =szMsg26	//Load szMsg
	bl putstring		//Output X0

	LDR X0, =szStr1		//load szStr
	MOV X1, 'a'			//set X1 a
	MOV X2, 'o'			//Set X2 o
	bl String_replace	//Branch

	LDR X0, =szStr1		//Load szStr
	bl putstring		//Output X0
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////

	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg27	//Load szMsg
	bl putstring		//Output X0
	
//test lowercase
	LDR X0, =szStr1		//load szStr
	bl Str_toLowerCase	//Branch
	LDR X0, =szStr1		//load szStr
	bl putstring		//Output X0
	
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	LDR X0, =szMsg28	//Load szMsg
	bl putstring		//Output X0
	
	LDR X0, =szStr1		//load szStr
	bl Str_toUpperCase	//Branch
	LDR X0, =szStr1		//load szStr
	bl putstring 		//Output X0
	
	//Print Line Feed
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char

	LDR X0, =szMsg29	//Load szMsg
	bl putstring		//Output X0

	LDR X0, =szStr1		//load szStr
	LDR X1, =szTemp9	//load szTemp9
	bl String_concat	//Branch

	LDR X1, =szResult	//Load szResult
	STR X0, [X1]		//Load szResult
	
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	

///////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////
	LDR X0, =szMsg30	//Load szMsg
	bl putstring		//Output X0

	LDR X0, =szResult
	LDR X0, [X0]		//Dereference
	LDR X1, =szStr2		//load szStr
	bl String_concat	//Branch
	
	LDR X1, =szResult	//Load szResult
	STR X0, [X1]		//Load szResult

	LDR X0, =szResult	//Load szResult
	LDR X0, [X0]		//Dereference
	bl putstring		//Output X0
///////////////////////////////////////////////////////////////////////
	LDR X0, =cLF 		//load new line feed
	BL putch 			//print char
	
	// Standard exit sequence
	// Setup the parameters to exit the program
	MOV X0, #0	// Use 0 return code
	MOV X8, #93 //Service command code 93 terminates this program
	SVC 0		//Call linux to terminate the program
	.end
