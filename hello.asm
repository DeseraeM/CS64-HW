# hello.asm
#
# for CS 64
# (c) 2025 by Ziad Matni

# This program prints a string that's pre-saved in data memory

# We'll start with a ".data" directive 
# This is for when we want to pre-define values in memory 
# (that is, not in registers)

.data  	  
	mystr: .asciiz "Hello World!\n"  
	# The address of this string is handled by spim
	# spim will reference it using the label “mystr”


.text
main:

# Print string to std.output 
# (Note: not an int!! So, we have to use a different code!) 
# Making $v0 = 4 tells syscall to expect a string to be printed...

	li $v0, 4	

# Since a string is an array of characters, 
# and we can’t add the value of the whole array!
# So, we load the address of that array into $a0 
# (we’ll use a new instruction here: la)

	la $a0, mystr   	# la = load memory address
	syscall

# End program
	li $v0, 10
	syscall
