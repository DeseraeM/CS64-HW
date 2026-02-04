# DEMO FILE FOR CMSPC 64
# (c) Z. Matni, 2025
######################################
# simpleArithmetic1.asm
######################################

.text
main:

# TODO: implement the arithmetic function: 2*a - b + c, where a = 100, b = -18, c = -222.
#       Variables a, b, c, MUST be stored in registers $t0, $t1, $t2, respectively.
#       Think about which register the result should be stored in.
# YOUR ADDED LINES GO HERE:
        #Stores the registers 
	li $t0, 25
	li $t1, -18
	li $t2, -10

        #Here  it does the arithmetic stuff
	sll $t3, $t0, 2
        add $t3, $t3, $t1
        sub $t3, $t3, $t2
        move $a0, $t3

# DO NOT EDIT THE FOLLOWING INSTRUCTIONS!
# Print to std.output
        li $v0, 1
        syscall

# End program
        li $v0, 10
        syscall
		
