	@i
	M=1

	@sum
	M=0

(LOOP)
	@i
	D=M

	// if(i>R1) goto STOP
	@R1
	D=D-M
	@STOP
	D;JGT

	// sum = sum + R0
	@sum
	D=M
	@R0
	D=D+M
	@sum
	M=D

	// i=i+1
	@i
	M=M+1

	//goto LOOP
	@LOOP
	0;JMP

(STOP)
	// R2 = sum
	@sum
	D=M
	@R2
	M=D

	// Infinite loop
(END)
	@END
	0;JMP