// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(RESETWHITE)

	@SCREEN
	D=A
	@addr
	M=D
	@WHITELOOP
	0;JMP

(RESETBLACK)

	@SCREEN
	D=A
	@addr
	M=D
	@BLACKLOOP
	0;JMP

(WHITELOOP)

	// Get value of KBD (determine if a key is pressed)
	@KBD
	D=M
	// If a key is pressed, go to RESET BLACK instruction to reset counter
	@RESETBLACK
	D;JGT

	@addr
	A=M
	M=0	// Flip pixels to white

	@addr
	M=M+1

	@WHITELOOP
	0;JMP

(BLACKLOOP)

	@KBD
	D=M
	// If no key is pressed, go to RESET WHITE instruction to reset counter
	@RESETWHITE
	D;JEQ

	@addr
	A=M
	M=-1	// Flip pixels to black
	
	@addr
	M=M+1

	@BLACKLOOP
	0;JMP

(END)

	@END
	0;JMP