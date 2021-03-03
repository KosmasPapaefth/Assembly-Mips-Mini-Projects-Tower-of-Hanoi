.data
msg1: .asciiz "Please give an integer:"
linefeed: .asciiz ","

.text
main:
li $v0,4 
la$a0,msg1
syscall #message appears to user

li $v0,5 #reads the integer
syscall 
move $t0,$v0 #clears the memory of $v0 for other use

li $v0,4
la $a0,msg1
syscall #message appears to user

li $v0,5
syscall
move $t1,$v0 #clears the memory of $v0 for other use

move $t2,$t0
move $t0,$t1
move $t1,$t2 #antimetathesis

li $v0,1
move $a0,$t0
syscall #prints the integer to user

li $v0,4
la $a0,linefeed
syscall #puts the "," between numbers 

li $v0,1
move $a0,$t1
syscall #prints the integer to user 



end:
li $v0,10
syscall #ends programme