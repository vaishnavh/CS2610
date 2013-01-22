	;; for i = 1 to 10
	;; 	for j = 1 to 30
	;; 		C[i, j] = 0
	;; 		for k = 1 to 20
	;; 			C[i,j] = C[i,j] + A[i,k] * B[k, j]
	MOV EBP, 3200
L1:	MOV [EBP], 0
	ADD EBP, 4
	CMP EBP, 5200
	JNE L1

	MOV EBP, 0		;i
	
Iloop:	
	MOV ESP, 0		;j
	
Jloop:
	MOV EDI, 0		;k	
	IMUL EBX, EBP, 30   	;EBX address of C[i,j]
	ADD EBX, ESP
	IMUL EBX, 8		;check this
	ADD EBX, 3200
	MOV [EBX], 0
	
Kloop:
	IMUL ESI, EBP, 20	;ESI address of A[i,k]
	ADD ESI, EDI
	IMUL ESI, 4
	MOV ECX, [ESI]		;A[i,k] stored at ECX
	IMUL ESI, EDI, 30	;ESI overwritten with address of B[k,j]
	ADD ESI, ESP
	IMUL ESI, 4
	ADD ESI, 800
	MOV 
	
	
	