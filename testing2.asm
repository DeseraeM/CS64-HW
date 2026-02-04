.data
.text


main: 
 
     li $a0,0
     li $t0,5

loop:
     #blt $a0,$t0,loop --- this is the right idea but in assembly we do the oppostie
      bge $a0,$t0, exit 
      addi $a0,$a0, 1
      li $v0, 1
      syscall
      j loop
  addi $a0,$a0,5

exit:
  li $v0, 10
    syscall



# TODO: implement the arithmetic function: 2*a - b + c, where a = 100, b = -18, c = -222.
#	Variables a, b, c, MUST be stored in registers $t0, $t1, $t2, respectively.
#	Think about which register the result should be stored in.
# YOUR ADDED LINES GO HERE:
        #Stores the registers 
       # li $t0, 25
       # li $t1, -18
       # li $t
# DO NOT EDIT THE FOLLOWING INSTRUCTIONS!
# Print to std.output
       # li $v0, 1
        #syscall

# End program
#	li $v0, 10
       # syscall
