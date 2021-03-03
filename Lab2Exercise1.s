.data

	msg1: .asciiz "Please give me an integer:"
	space: .asciiz ", "
	linefeed: .asciiz "\n\n"
	result: .asciiz "Here are the numbers reversed:"

.text
main: 


	do:

	#ask for 1st integer
	li $v0,4
	la $a0,msg1
	syscall

	#read 1st integer
	li $v0,5
	syscall
	move $t0,$v0

	#ask for 2nd integer
	li $v0,4
	la $a0,msg1
	syscall

	#read 2nd integer
	li $v0,5
	syscall
	move $t1,$v0


	li $v0,4
	la $a0,result
	syscall #prints the result to the user 

	#swap
	move $t2,$t0
	move $t0,$t1
	move $t1,$t2


	li $v0,1
	move $a0,$t0
	syscall #prints the numbers

	li $v0,4
	la $a0,space
	syscall

	li $v0,1
	move $a0,$t1
	syscall

	#newline
	li $v0,4
	la $a0,linefeed
	syscall

	#swap again to the original row
	move $t2,$t0
	move $t0,$t1
	move $t1,$t2

	#be not equal condition in order to finish the loop when 0 is given
	bne $t0,0,do

	#end program
	end_while:
end:
	li $v0,10
	syscall




