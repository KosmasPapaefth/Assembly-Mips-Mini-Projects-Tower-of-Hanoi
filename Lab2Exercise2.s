.data
	msg1: .asciiz "Please give an integer:"
	msg2: .asciiz "The result is:"
	

.text
main:


	li $v0,4 
	la $a0,msg1
	syscall #message appears to user

	li $v0,5 #reads the integer
	syscall 
	move $t0,$v0 #clears the memory of $v0 for further use

	li $t1,1 #counter
	li $t2,0 #sum
	li $t3,0 #mul
for:
	bgt $t1,$t0,endfor

	
	mul $t3,$t1,$t1
	add $t2,$t2,$t3 
	addi $t1,$t1,1  #counter++
	
j for

endfor:
	
	li $v0,4
	la $a0,msg2
	syscall #prints the message2
	
	li $v0,1
	move $a0,$t2
	syscall #prints the result




end:
	li $v0,10
	syscall #ends programme
