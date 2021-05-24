 #Input format:  Enter the value of n on line 1.
 #Output format:  The list will be printed on line 1.
 #Install spim: `sudo apt-get install spim` for linux `brew install spim` for mac
 #Run file:  `spim -f <file>`
    .globl main
    .text

main:
    # Output hdr
    la $a0, hdr
    li $v0, 4
    syscall

    # Read n
    li $v0, 5
    syscall
    move $a0, $v0

    # Call procedure fib
    jal fib
    move $s1, $v0


    # Terminate program
    li $v0, 10
    syscall 

# Procedure to calculate fib(n) while printing data
fib:

    # Store the registers in stack
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 4($sp)
    sw $s0, 0($sp)

    # Check for n < 3
    slti $t0, $a0, 3
    beq $t0, $zero, L1

    addi $t0, $zero, 1
    beq $a0, $t0, print1

    add $a0, $a0, -1
    jal fib

    # Print comma if it is not the first number in the list
    la $a0, comma
    li $v0, 4
    syscall

print1:
    # Print the number
    li $v0, 1
    move $a0, $t0
    syscall

    j next 

next:
    # Return value 1
    addi $v0, $zero, 1

    # Reload stored registers
    lw $s0, 0($sp)
    lw $a0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12

    jr $ra

L1:
    # For n >= 3
    addi $s0, $zero, 0

    # Call fib(n-1)
    addi $a0, $a0, -1
    jal fib
    add $s0, $s0, $v0

    # Call fib1(n-2) (because we do not want to print the values)
    addi $a0, $a0, -1
    jal fib1
    add $s0, $s0, $v0

    # Print comma
    la $a0, comma
    li $v0, 4
    syscall

    # Print value
    li $v0, 1
    move $a0, $s0
    syscall

    # Return fib(n-1) + fib1(n-2)
    move $v0, $s0

    # Reload stored registers
    lw $s0, 0($sp)
    lw $a0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12

    jr $ra

# Calculate fibonacci n without printing values
fib1:

    # Store the registers in stack
    addi $sp, $sp, -12
    sw $ra, 8($sp)
    sw $a0, 4($sp)
    sw $s0, 0($sp)

    # Check for n < 3
    slti $t0, $a0, 3
    beq $t0, $zero, L2

    # Return 1
    addi $v0, $zero, 1

    # Reload stored registers
    lw $s0, 0($sp)
    lw $a0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12

    jr $ra

L2:

    addi $s0, $zero, 0

    # Call fib1(n-1)
    addi $a0, $a0, -1
    jal fib1
    add $s0, $s0, $v0

    # Call fib1(n-1)
    addi $a0, $a0, -1
    jal fib1
    add $s0, $s0, $v0

    # Return fib1(n-1) + fib2(n-2)
    move $v0, $s0

    # Reload stored registers
    lw $s0, 0($sp)
    lw $a0, 4($sp)
    lw $ra, 8($sp)
    addi $sp, $sp, 12

    jr $ra


.data
    hdr: .asciiz "Enter the value of n: "
    comma: .asciiz ", "