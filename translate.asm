# DEMO FILE FOR CMSPC 64
# (c) Z. Matni, 2025
######################################
# translate.asm
#
# For use in HW3
######################################

# DO NOT EDIT THE NEXT 5 LINES
.data
newline:    .asciiz "\n"

.text
main:


# TODO: See description in Homework Assignment 3
# YOUR ADDED LINES GO HERE:
   li $a0,3
   li $v0, 5
   syscall
  
   #prints the value
   add $a0,$a0,$v0
   li $v0, 1
   move $a0, $a0
   syscall
   

   move $t0, $a0 
  #prints the newline
   li $v0, 11
   li $a0, 10
   syscall

   move $a0, $t0
   bgt $a0,$zero,if
if:
   addi $a0,$a0,-1
   li $v0, 1
   move $a0, $a0
   syscall 

   li $v0, 11
   li $a0, 10
   syscall


# DO NOT EDIT THE LAST 3 LINES
exit:
	li $v0, 10
	syscall	
