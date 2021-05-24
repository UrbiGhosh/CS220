#Input: Line 1 - n
        #Next n lines: element
        #Next line: k
 
 #Output: Element index if found, otherwise error message
 
 #Run file: spim -f <file>
 #
        .globl main
        .text

main:
    # Output message
    la $a0, message1
    li $v0, 4
    syscall
    
    # Read n
    li $v0, 5
    syscall
    move $s0, $v0
    
    # Input numbers in the array
    la $a0, message2
    li $v0, 4
    syscall
    
    #array address
    la $s1, arr
    move $t1, $s1
    move $t0, $s0

    # Loop for reading elements
L1:
    #Element message
    la $a0, message3
    li $v0, 4
    syscall
    
    # read element
    li $v0, 5
    syscall
    
    # store element
    sw $v0, 0($t1)
    
    addi $t1, $t1, 4
    #substract 1 from n

    addi $t0, $t0, -1
    #check if n numbers have been inputted, otherwise go back to L1
    bne $t0, $0, L1
    
    #  message for k
    la $a0, message4
    li $v0, 4
    syscall
    
    # read k
    li $v0, 5
    syscall
    
    move $s2, $v0
    move $a0, $s1
    xor $a1, $a1, $a1
    move $a2, $s0
    move $a3, $s2
    
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    #binary search call
    jal binarysearch

    lw $ra, 0($sp)
    addi $sp, $sp, 4
    move $a0, $v0

    move $t0, $a0

    #Output if element found
    la $a0, output1
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    #terminate
    li $v0, 10
    syscall

    # return

binarysearch:
    #checking for high and low
    sltu $t0, $a2, $a1
    beq $t0, $0, L2
    
    #if element not found
    li $v0, -1
    la $a0, output2
    li $v0, 4
    syscall
    #terminate
    li $v0, 10
    syscall

L2:
    add $t0, $a1, $a2
    srl $t0, $t0, 1
    sll $t1, $t0, 2
    add $t1, $a0, $t1
    lw $t1, 0($t1)
    bne $t1, $a3, L3
    move $v0, $t0
    jr $ra

#following calls binary search on the appropriate low and high values
L3:
    sltu $t1, $a3, $t1
    beq $t1, $0, L4
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    addi $a2, $t0, -1
    jal binarysearch
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

L4:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    addi $a1, $t0, 1
    jal binarysearch
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

.data
    arr: .space 48
    message1: .asciiz "Enter n: "
    message2: .asciiz "Input numbers in ascending order"
    message3: .asciiz "Input number: "
    message4: .asciiz "Enter number to search: "
    output1: .asciiz "Found element at index: "
    output2: .asciiz "Element not found"
