//function Main 0
(main.Main)
//push constant 4
@4
D=A
@SP
M=M+1
A=M-1
M=D
//push constant 1
@1
D=A
@SP
M=M+1
A=M-1
M=D
//push constant 3
@3
D=A
@SP
M=M+1
A=M-1
M=D
//call Max 3
@Max$ret0
D=A
@SP
M=M+1
A=M-1
M=D
@LCL
D=M
@SP
M=M+1
A=M-1
M=D
@ARG
D=M
@SP
M=M+1
A=M-1
M=D
@THIS
D=M
@SP
M=M+1
A=M-1
M=D
@THAT
D=M
@SP
M=M+1
A=M-1
M=D
@8
D=A
@SP
D=M-D
@ARG
M=D
@SP
D=M
@LCL
M=D
@Max
0;JMP
(Max$ret0)
//return
@LCL
D=M
@R15
M=D
@5
D=A
@R15
A=M-D
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R15
AM=M-1
D=M
@THAT
M=D
@R15
AM=M-1
D=M
@THIS
M=D
@R15
AM=M-1
D=M
@ARG
M=D
@R15
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
//function Max 3
(max.Max)
@SP
M=M+1
A=M-1
M=0
@SP
M=M+1
A=M-1
M=0
@SP
M=M+1
A=M-1
M=0
//push argument 0
@0
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
//pop local 0
@0
D=A
@LCL
D=D+M
@R15
M=D
@SP
AM=M-1
D=M
@R15
A=M
M=D
//push argument 1
@1
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
//push local 0
@0
D=A
@LCL
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
//gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@LAB1
D;JGT
@LAB2
D=0;JMP
(LAB1)
D=-1
(LAB2)
@SP
A=M-1
M=D
//if-goto SET
@SP
AM=M-1
D=M+1
@max.Max$SET
D;JEQ
//push argument 2
@2
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
//push local 0
@0
D=A
@LCL
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
//gt
@SP
AM=M-1
D=M
A=A-1
D=M-D
@LAB3
D;JGT
@LAB4
D=0;JMP
(LAB3)
D=-1
(LAB4)
@SP
A=M-1
M=D
//if-goto SET
@SP
AM=M-1
D=M+1
@max.Max$SET
D;JEQ
//goto END
@max.Max$END
0;JMP
//label SET
(max.Max$SET)
//push argument 1
@1
D=A
@ARG
A=D+M
D=M
@SP
M=M+1
A=M-1
M=D
//pop local 0
@0
D=A
@LCL
D=D+M
@R15
M=D
@SP
AM=M-1
D=M
@R15
A=M
M=D
//label END
(max.Max$END)
//return
@LCL
D=M
@R15
M=D
@5
D=A
@R15
A=M-D
D=M
@R14
M=D
@SP
AM=M-1
D=M
@ARG
A=M
M=D
@ARG
D=M+1
@SP
M=D
@R15
AM=M-1
D=M
@THAT
M=D
@R15
AM=M-1
D=M
@THIS
M=D
@R15
AM=M-1
D=M
@ARG
M=D
@R15
AM=M-1
D=M
@LCL
M=D
@R14
A=M
0;JMP
