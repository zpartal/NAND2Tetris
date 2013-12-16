// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

(LOOP)
	@0 // Reset screen position counter
	M=0
	@24576 // If key pressed
	D=M
	@FW
	D;JEQ // 0, go to fw
	@FB
	0;JMP // anything else go to fb
(FB)
	@SCREEN // load screen address
	D=A
	@0 // move to screen address + R0
	D=D+M
	A=D // load updated screen address
	M=1 // set to black
	@0 // increment screen pos
	M=M+1
	@0
	D=M
	@8000
	D=D-A
	@FB
	D;JLT
	@LOOP
	0;JMP
(FW)
	@SCREEN // load screen address
	D=A
	@0 // move to screen address + R0
	D=D+M
	A=D // load updated screen address
	M=0 // set to white
	@0 // increment screen pos
	M=M+1
	@0
	D=M
	@8000
	D=D-A
	@FW
	D;JLT
	@LOOP
	0;JMP
(END)
	@END
	0;JMP