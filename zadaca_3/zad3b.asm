

/*
for(int i = 1; i < 7; i++)
	for(int j = 6; j >= i; j--)
		if(A[j-1] > A[j])
			std::swap(A[j-1],A[j]);
			
*/

// i = 1



@i
M = 1

(LOOP_START)
// i - R0 >= 0
@i
D = M
@R0
D = D - M 
@LOOP_END
D; JGE

	@R0
	D = M
	@j
	M = D - 1
	
	// second loop 
	(LOOP_2_START) 
	@j
	D = M
	@i
	D = D - M
	@LOOP_2_END
	D; JLT
	
	
		@99
		D = A
		@j
		A = D + M // 100 + j - 1 = 99 + j
		D = M
		@e1    // A[100+j-1]
		M = D

		@100
		D = A
		@j
		A = D + M // 100 + j
		D = M
		@e2   // A[100+j]
		M = D


		@e1
		D = M
		@e2
		D = D - M

		@CONTINUE
		D; JLE

			// swap(A[j-1], A[j])
			@100
			D = A
			@j
			D = D + M

			$SWP(D-1, D)
			
		

	(CONTINUE)
	@j
	M = M - 1

	@LOOP_2_START
	0; JMP
	(LOOP_2_END)

@i
M = M + 1

@LOOP_START
0; JMP
(LOOP_END)

(END)
@END
0; JMP
