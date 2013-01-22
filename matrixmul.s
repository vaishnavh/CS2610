	;; for i = 1 to 10
	;; 	for j = 1 to 30
	;; 		C[i, j] = 0
	;; 		for k = 1 to 20
	;; 			C[i,j] = C[i,j] + A[i,k] * B[k, j]

	;; Initialise the matrix C to 0.
	MOV EBP, 3200
L1:				
	MOV [EBP], 0
	ADD EBP, 4
	CMP EBP, 5200
	JNE L1

	;;  Initializing i to 0, out side the first loop.
	MOV EBP, 0		;i
	
Iloop:	
	MOV ESP, 0		;j initialized to 0, each time I loop is iterated.
	
Jloop:
	MOV EDI, 0		;k initialized to 0, each time J loop is iterated. 
;;	IMUL EBX, EBP, 30   	;EBX address of C[i,j]
;;	ADD EBX, ESP
;;	IMUL EBX, 8		;check this
;;	ADD 
	
Kloop:
	IMUL ESI, EBP, 20	;ESI address of A[i,k]
	ADD ESI, EDI
	IMUL ESI, 4
	MOV ECX, [ESI]		;A[i,k] stored at ECX
	
	IMUL ESI, EDI, 30	;ESI overwritten with address of B[k,j]
	ADD ESI, ESP
	IMUL ESI, 4
	ADD ESI, 800
	MOV EAX, [ESI]		;B[k,j] stored at EAX

	IMUL ECX		;EAX = EAX * ECX =>> EAX = B[k,j] * A[i, k]
	ADD EAX, [(EBP*30 + ESP)*8+3200]
	MOV [(EBP*30 + ESP)*8+3200], EAX
	ADD EBX, [(EBP*30 + ESP)*8+3204]
	MOV [(EBP*30 + ESP)*8+3200+4], EBX

	ADD EDI, 1
	CMP EDI, 20
	JNE Kloop

	ADD ESP, 1
	CMP ESP, 30
	JNE Jloop

	ADD EBP, 1
	CMP EBP, 10
	JNE Iloop

	
	
	

	
	
	
	
	