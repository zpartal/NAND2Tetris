// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
	@2  // Reset R2
	M=0
	@0  // Create copy of R0 at R3
	D=M
	@3
	M=D
(LOOP)
	@3 // Jump to end when R3 = 0
	D=M
	@END
	D;JEQ
	@1 // Load R1 and add it to R2
	D=M
	@2
	M=D+M
	@3 // R3 = R3 -1 -> 0
	M=M-1
	@LOOP
	0;JMP
(END)
	@END
	0;JMP