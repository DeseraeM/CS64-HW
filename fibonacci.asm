# fibonacci.asm program
# CMPSC 64, (c) 2025, Z.Matni
#
#    unsigned int n, f1 = 1, f2 = 1, i = 2, nextfib;
#    cout << "Enter a number:\n";
#    cin >> n;
#    if (n > 1) {
#        cout << "The first " << n << " numbers in the Fibonacci series are:\n";
#        cout << f1 << " " << f2;
#        while (i < n) {
#            nextfib = f1 + f2;
#            f1 = f2;
#            f2 = nextfib;
#            cout << " " << nextfib;
#            i++;
#        }
#    }
#   cout << endl;

.data
	prompt:     .asciiz "Enter a number:\n"
    first:      .asciiz "The first "
    numbers:    .asciiz " numbers in the Fibonacci series are:\n"
	spacech:    .asciiz " "
    newline:    .asciiz "\n"
	
.text
main:
# TODO: Follow the comments below, and the assignment description, 
#       as guides for how to write this assembly program.


# Print the prompt and get user input
    li $v0, 4
    la $a0, prompt
    syscall
    
     li $v0, 5
     syscall
     move $t0, $v0
	
# Initialize all registers needed in the program (as appropriate)
   # li $t0, 1 = n
    li $t1, 1
    li $t2, 1
    li $t3, 2
    #li $t4, nextfib
    #li $t6, i
# if (exit conditions are met) then go to exit
# otherwise:
# print "The first " n " numbers in the Fibonacci series are:\n"
    # print f1 " " f2

if:
    slt $t5, $t0, $t1

    bne $t5, $zero, exit
    li $v0, 4
    la $a0, first
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, numbers
    syscall

  #  li $v0, 4
 #   la $a0, newline
#    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, spacech
    syscall
 
    li $v0, 1
    move $a0, $t2
    syscall


    # while loop:
while:
    slt $t6,$t3, $t0
    beq $t6, $zero, exit

    add $t4, $t1, $t2

    move $t1, $t2
    move $t2, $t4


    li $v0, 4
    la $a0, spacech
    syscall

    li $v0, 1
    move $a0, $t4
    syscall
   
    addi $t3, $t3, 1 
    j while

exit:
# print newline
    li $v0, 4
    la $a0, newline
    syscall

# quit program
    li $v0, 10
    syscall
