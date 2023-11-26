//RAM[5] = RAM[4] + RAM[3] + RAM[2] + RAM[1] + RAM[0]

@i
M = 0;

(LOOP_START)
// for(int i = 0; i < 5; i++) - RAM[RAM[i]] - 5 >= 0
@i
D = M;
@5
D = D - A;
@LOOP_END
D; JGE

@i
D = M;
A = D;
D = M;
@SKOK
D; JLT

@R5
M = D + M;

// i++
(SKOK)
@i
M = M + 1;


@LOOP_START
0;JMP

(LOOP_END)

(END)
@END
0;JMP