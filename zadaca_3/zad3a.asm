
@R1 // EKPONENT
D = M

@R2
M = 1
@i
M = 0
(LOOP_START)
// i < n -> i - n >= 0
@i
D = M
@R1
D = D - M
@LOOP_END
D; JGE
	
	@R0
	D = M
	@n
	M = D
	@c
	M = 0
	$WHILE(n)
		@n
		M = M - 1
		$SUM(R2, c, c)
	$END
	
	$MV(c,R2)
	
@i
M = M + 1

@LOOP_START
0; JMP
(LOOP_END)

(END)
@END
0; JMP
