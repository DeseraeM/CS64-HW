.text
main:
    li $t0, 22
    li $t1,1
    li $v0, 1
loop:
    beq $t0, $t1,exit
    move $a0,$t0
    syscall
    addi $t0, $t0, -3
    j loop
exit:
    move $a0,$t1
    syscall
    li $v0,10
    syscall
