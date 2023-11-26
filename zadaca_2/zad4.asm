@SCREEN
D = A

@c
M = D

@i
M = 0

(FIRST_VERTICAL_START)
	@128
	D = A
	
	@i
	D = M - D
	
	@FIRST_VERTICAL_END
	D; JGE

	@1
	D = A

	@c
	A = M
	M = D
	
	@i
	M = M + 1
	
	@32
	D = A
	@c
	M = M + D

	@FIRST_VERTICAL_START
	0; JMP

(FIRST_VERTICAL_END)

@i
M = 0

(FIRST_HORIZONTAL_START)
	@8
	D = A
	
	@i
	D = M - D
	
	@FIRST_HORIZONTAL_END
	D; JGE

	@c
	A = M
	M = -1
	
	@i
	M = M + 1

	@c
	M = M + 1

	@FIRST_HORIZONTAL_START
	0; JMP

(FIRST_HORIZONTAL_END)

@i
M = 0

(SECOND_HORIZONTAL_START)
    @i
    D = M;
    @8
    D = D - A;
    @SECOND_HORIZONTAL_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = -1;
    
    @1
    D = A;
    @i
    M = M + D;
    
    @SECOND_HORIZONTAL_START
    0; JMP
(SECOND_HORIZONTAL_END)

@8
D = A;
@i
M = D;

(SECOND_VERTICAL_START)
    @i
    D = M;
    @4096
    D = D - A;
    @SECOND_VERTICAL_END
    D; JGE
    
    @i
    D = M;
    @SCREEN
    A = A + D;
    M = 1;
    
    @32
    D = A;
    @i
    M = M + D;
    
    @SECOND_VERTICAL_START
    0; JMP
(SECOND_VERTICAL_END)

(END)
@END
0; JMP