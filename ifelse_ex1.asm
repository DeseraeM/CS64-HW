# ifelse_ex1.asm
# Demo to do a simple if-else:
#   int a = 5, user;    cin >> user;
#   if (user >= a) { cout << a; }
#   else { cout << 0; }
#
# For CMPSC 64, (c) 2026, Matni

# Assembly Program Plan (algorithm):
#   Make $a0 = 5
#   Get user input (ends up in $v0)
#   (using slt) set $t0 = 1, if v0 < a0 ; $t0 = 0 if not
#   (using bne) if $t0 ≠ 0 (that is, t0=1) then go to ELSE:
#   OTHERWISE:
#       print a0
#       jump to the end of program
#   ELSE: (that is, if v0 < a0)
#       print 0
#       jump to the end of program (necessary?)
#   END OF PROGRAM

.text
main:
	# Make $a0 = 5
    li $a0, 5  # a0 = 5

	# Get user input and place in $v0
    li $v0, 5
    syscall

	# (using slt) set $t0 = 1, if v0 < a0 ; $t0 = 0 if not
    # i.e.,  t0=1 if user<a, t0=0 if user>=a
    slt $t0, $v0, $a0 

	# (using bne) if $t0 ≠ 0 (that is, t0=1, that is, user<a), 
    # then go to ELSE:
    bne $t0, $zero, else

    # ALTERNATIVES TO ABOVE:
    # 1. we could utilize the logic of beq instead, 
    #    but it would require an extra line of code:
    #
    # li $t1, 1
    # beq $t0, $t1, else
    #
    # 2. instead of slt + bne, we could use the pseudoinstruction blt:
    #    (blt = branch on less-than)
    # blt $v0, $a0, else

 	# OTHERWISE (i.e., the "if" part), print a0
    li $v0, 1
    syscall

	# jump to the end of program (to avoid the ELSE part below)
    j exit

else:
	# ELSE: (that is, if user >= a0), print 0:
    li $v0, 1
    li $a0, 0   # move $a0, $zero
    syscall

	# jump to the end of program (is that necessary?)
	# END OF PROGRAM
    
exit: 
    li $v0, 10
    syscall
