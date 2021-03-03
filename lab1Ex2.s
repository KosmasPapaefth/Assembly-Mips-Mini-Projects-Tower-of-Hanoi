 .data
msg1: .asciiz "Give me the integer: "
orderStr: .asciiz "The integers ordered from least to greatest: "
linefeed: .asciiz "\n"
space: .asciiz " "

    .text
main:
    
    li $v0, 4          
    la $a0, msg1    
    syscall

    # get the first integer
    li $v0, 5           
    syscall            
    move $t0, $v0       

   
    li $v0, 4           
    la $a0, msg1  
    syscall

    # get the second integer
    li $v0, 5           
    syscall             
    move $t1, $v0       

    
    li $v0, 4          
    la $a0, msg1    
    syscall

    # get the third integer
    li $v0, 5          
    syscall             
    move $t2, $v0       

if1:
    # if $t0 < $t2, go to second if condition
    blt $t0, $t2, if2

    # else swap(a, c)
    move $t3, $t0
    move $t0, $t2
    move $t2, $t3

if2:
    # if $t0 < $t1, go to third if condition
    blt $t0, $t1, if3

    # else swap(a, b)
    move $t3, $t0
    move $t0, $t1
    move $t1, $t3

if3:
    # if $t1 < $t2, go to final step
    blt $t1, $t2, endif

    # else swap(b, c)
    move $t3, $t1
    move $t1, $t2
    move $t1, $t3

endif:
    li $v0, 4
    la $a0, linefeed
    syscall

    li $v0, 4
    la $a0, orderStr
    syscall

    li $v0, 1
    move $a0, $t0
    syscall
    
    li $v0, 4
    la $a0, space
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, space
    syscall

    li $v0, 1
    move $a0, $t2
    syscall
end:
    li $v0, 10
    syscall