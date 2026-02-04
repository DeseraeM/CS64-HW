# ifelse_ex2.asm
# Demo to do a nested if-else:
# int x, y;    cin >> x;
# if (x == 5) { y = 0; } 
# else if (x < 5) { y = 2*x; } 
# else { y = -1; }
# cout << y;
#
# For CMPSC 64, (c) 2026, Matni

.text
main:
    # Get user input x:
    li $v0, 5
    syscall # x = $v0

    li $t0, 5
    # beq: Branch-on-equal, a core instruction:
    beq $v0, $t0, make_zero   # if (x==5) go to make_zero

    # blt: Branch-on-less-than, a pseudo-instruction that we are allowed to use:
    blt $v0, $t0, double_x    # if (x < 5) go to double_x

    # Otherwise, set y = -1
    li $a0, -1   # y = a0
    j print_y

make_zero:
    li $a0, 0
    j printy

double_x:
    sll $a0, $v0, 1

print_y:
    li $v0, 1
    syscall

exit:
    li $v0, 10
    syscall

