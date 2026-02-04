# simpleAdd.asm
# for CS 64
# (c) 2025 by Ziad Matni

.text		
# We always have to have this starting line
# to indicate that the following instructions
# should be place in the "text" part of CPU memory.

main:	
# “main:” is a label – it is also necessary
	addi $t0, $zero, 5  # Put the integer value 5 in register t0
	addi $t1, $zero, 7  # Put the integer value 7 in register t1
	add $t2, $t0, $t0   # Add the values in registers t0 and t1, 
                        # place the result in register t2

# Print the integer that’s in $t2 to std.output 
# MORE ON HOW THIS WORKS LATER!
	li $v0, 1
	move $a0, $t0
	syscall

# End program 
# MORE ON HOW THIS WORKS LATER!
	li $v0, 10
	syscall

