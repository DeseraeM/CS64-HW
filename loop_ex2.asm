# loop_ex2.asm
# Demo to do a nested for-loop:
# for (int i = 0; i < 5; i++) {
#   for (int j = 1; j < 4; j++) {
#       cout << i << j << endl;
#       }
#   }
#
# For CMPSC 64, (c) 2026, Matni

.data
    newline: .asciiz "\n"

.text
main:
    # set values for loop comparisons
    # t1 = 5, t2 = 4, a1 = i, a2 = j
    li $t1, 5 
    li $t2, 4
    li $a1, 0  # this initialization is not necessary
    # li $a2, 1  # this initialization is best place elsewhere

loop_i:
# This is the start of the for-i (outer) loop:
    beq $a1, $t1, exitloops
# NOTE THAT j has to be redefined to be j=1 EVERY time you finish loop_j:
    li $a2, 1  # a2 = j

loop_j:
# This is the start of the for-j (inner) loop:
    beq $a2, $t2, endloop_i

    li $v0, 1
    move $a0, $a1
    syscall     # print i
    move $a0, $a2
    syscall     # print j

    li $v0, 4
    la $a0, newline
    syscall     # print newline

    addi $a2, $a2, 1    # j++
    j loop_j

endloop_i:
    addi $a1, $a1, 1    # i++
    j loop_i

exitloops:
    li $v0, 10
    syscall
