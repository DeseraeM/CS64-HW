# maximum.asm program
# CS 64, Z.Matni
#
# Get 3 integer inputs from the user (std.in)
# Reveal the maximum absolute value (e.g., entering -3, 2, 1 will give the answer 3)
# See assignment description for details

#Data Area (i.e. memory setup directive)
.data
	# TODO: Complete these incomplete declarations / initializations

enter:      .asciiz "Enter number:\n"
newline:    .asciiz "\n"
max:        .asciiz "Maximum: "

#Text Area (i.e. instructions/code directive)
.text

main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to

      #taking user input:
      la $v0, 4
      la $a0,enter 
      syscall

      li $v0, 5
      syscall
      move $t0, $v0
      
      la $v0, 4
      la $a0,enter 
      syscall
      
      li $v0, 5
      syscall
      move $t1, $v0
      
      la $v0, 4
      la $a0,enter 
      syscall

      li $v0, 5
      syscall
      move $t2, $v0      
convertA:
      #checks if nums are positive
      srl $t3, $t0, 31       
      beq $t3, 1, positive  
      j convertB
convertB: 
      srl $t3, $t1, 31       
      beq $t3, 1, positivieB
      j convertC
convertC: 
      srl $t3, $t2, 31       
      beq $t3, 1, positivieC
      j compare
compare:
      slt $t3, $t0, $t1
      #check if (a>b)
      beq $t3, $zero, check_c
        j check_B

check_c: 
       bgt $t0, $t2, printA 
        j printc
        j exit
 

check_B:
      bgt $t1, $t2, printB
      j printc
printA:
      li $v0, 4
      la $a0, max
      syscall

      li $v0, 1
      move $a0, $t0
      syscall


      li $v0, 4
      la $a0, newline
      syscall 

      j exit
printB:
      li $v0, 4
      la $a0, max
      syscall

      li $v0, 1
      move $a0, $t1
      syscall
      
      li $v0, 4
      la $a0, newline
      syscall 
      j exit

printc:
      li $v0, 4
      la $a0, max
      syscall

      li $v0, 1
      move $a0, $t2
      syscall
       
      li $v0, 4
      la $a0, newline
      syscall 
      j exit
positive:
      nor $t0, $t0, $zero  
      addi $t0, $t0, 1      
       j convertB
positivieB:
       nor $t1, $t1, $zero
       addi $t1, $t1, 1
       j convertC
positivieC:
       nor $t2, $t2, $zero
       addi $t2, $t2, 1
      j  compare 
exit:
	# TODO: Write code to properly exit a SPIM simulation
       li $v0, 10
       syscall
