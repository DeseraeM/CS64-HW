.text
main:
	li $t0, 2
	li $t1, 66
	li $t2, 19

       sll $t3, $t2, 2
       add $t3, $t1, $t3
       addi $t4,$t3, 10
       sub $t3,$t0,$t3
	
	#Print it out!
	#li $v0, 1
        #move $a0, $t3
	#syscall
 
       #Print out t4
       li $v0, 1
       move $a0, $t4
       syscall
	#Quit 
	li $v0,10
	syscall
 
