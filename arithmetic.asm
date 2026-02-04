# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 16*( a - 8*b) + 7*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!
        #user input 
          li $v0, 5
          syscall
          move $t0, $v0

         li $v0, 5
         syscall          
         move $t1, $v0

         li $v0, 5
         syscall
         move $t2,$v0
 
#         li $t0, a
        # li $t1, b
        # li $t2, c
         li $t3, 5
 #        li $t4, 8
#         li $t5, 64

         mult $t1, $t3
         mflo $t1

         sub $t0, $t0, $t1

         sll $t0, $t0, 3

         sll $t2, $t2, 6

         add $t0, $t0, $t2

         #printing
         li $v0, 1
         move $a0, $t0
         syscall
exit:
	# Exit SPIM: Write your code here!
        li $v0, 10
         syscall
