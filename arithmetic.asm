# arithmetic.asm program
# CS 64, Z.Matni
#
# 1. Prompt the user for 3 inputs: a, b, c
# 2. Calculate 16*( a - 8*b) + 7*c using only one mult instruction
# 3. Print out the result

.text
main:
	# TODO: Write your code here!
       li $v0, 4
       move $t0, $v0 
       syscall
      
      #li $t1 b 
      #li $t2 c

      li $t3, 5
      li $t4, 64
      li $t5, 8 

      mult $t3, $t1
      mflo $t3
      sub $t0, $t0, $t3
     
     sll $t0, $t0, 3

     sll $t2, $t2, 6
     
     add $t7, $t0, $t2

     #here it prints out the stuff

     li $v0, 10
     move $a0, $t0
     syscall

     li $v0, 10
     move $a0, $t1
     syscall




     li $v0, 10
     move $a0, $t7
     syscall
exit:
	# Exit SPIM: Write your code here!
    li $v0, 10
    syscall
