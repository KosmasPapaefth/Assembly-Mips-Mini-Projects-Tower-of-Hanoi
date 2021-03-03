.data 
msg1: .asciiz "Please give me an integer:"
result: .asciiz "Here are the numbers summed:"
Vector: .space 24 #4bytes x 6 = 24

.text
main:

for: 
	bge $t0,24,endfor 

	li $v0,4
	la $a0,msg1
	syscall


	li $v0,5
	syscall #reads the 1st number from the user

	sw $v0,Vector($t0) #inserts $the numbers  in the array 



	addi $t0,$t0,4
	j for #jumps back to the start of the loop
endfor:

	li $t2,0

	li $t3,24

	li $t0,0

do:

	lw $t4,Vector($t0) #we take the numbers from the array to make the sums
	add $t2,$t2,$t4

	addi $t0,$t0,4
	#statement 
	blt $t0,$t3,do

	li $v0,4
	la $a0,result
	syscall

	li $v0,1
	move $a0,$t2
	syscall #prints the result numbers 

end:
li $v0,10
syscall