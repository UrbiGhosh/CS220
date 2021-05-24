 #Input format: Enter the value of n on line 1. Enter the values of array A on the next n lines. Enter the values of array B on the next n lines.
 #Output format:  The answer will be printed on line 1.
 #Install spim: `sudo apt-get install spim` for linux `brew install spim` for mac
 #Run file:  `spim -f <file>`
    .globl main
    .text

main:
    # Output hdr
    la $a0, hdr #load address , argument , enter value of n
    li $v0, 4 #load immediate , return value . load register v0 with value 4/ 4 is the system call code for print_str
    syscall

    # Read n
    li $v0, 5 
    syscall
    move $s0, $v0 #move the value to $s0

    # $t0 is the loop counter
    addi $t0, $zero, 0

check1:

    # Check whether $t0 is equal to n
    slt $t1, $t0, $s0
    bne $t1, $zero, loop1
    j next1

loop1:

    # If $t0 < n take an input float
    li $v0, 6
    syscall
    
    # Load array A and store the input at appropriate index
    la $t7, A
    mul $t6, $t0, 4
    add $t6, $t6, $t7
    s.s $f0, 0($t6)

    # Increment $t0
    addi $t0, $t0, 1
    j check1

next1:

    # Reset loop counter for next array input
    addi $t0, $zero, 0

check2:

    # Check whether $t0 is equal to n
    slt $t1, $t0, $s0
    bne $t1, $zero, loop2
    j next2

loop2:

    # If $t0 < n take an input float
    li $v0, 6
    syscall
    
    # Load array B and store the input at appropriate index
    la $t7, B
    mul $t6, $t0, 4
    add $t6, $t6, $t7
    s.s $f0, 0($t6)

    # Increment $t0
    addi $t0, $t0, 1
    j check2

next2:

    # $f31 will hold the sum, reset loop counter
    l.s $f31, zero
    addi $t0, $zero, 0

check3:

    # Check whether $t0 is equal to n
    slt $t1, $t0, $s0
    bne $t1, $zero, loop3
    j next3

loop3:

    # Load values from A and B at index $t0
    la $t7, A
    la $t8, B

    mul $t6, $t0, 4
    add $t4, $t6, $t7
    add $t5, $t6, $t8

    l.s $f0, 0($t4)
    l.s $f1, 0($t5)
     
    # Multiply the values and add to $f31
    mul.s $f2, $f0, $f1
    add.s $f31, $f31, $f2

    # Increment loop counter
    addi $t0, $t0, 1
    j check3

next3:

    # Print output message
    la $a0, hdr1
    li $v0, 4
    syscall

    # Print answer
    li $v0, 2
    mov.s $f12, $f31
    syscall

    # Terminate program
    li $v0, 10
    syscall 

.data
    A: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
    B: .float 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0
    zero: .float 0.0
    hdr: .asciiz "Enter the value of n: "
    hdr1: .asciiz "Ans: "