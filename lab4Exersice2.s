.data
VECTOR: .space 24
msg1: .asciiz "Give the numbers  for the array:"
result: .asciiz "The array after  insertion sort is:"
linefeed: .asciiz "\n"

.text
main:
	li $v0,4
	la $a0,msg1
	syscall #message  appears

	li $v0,4
	la $a0,linefeed
	syscall #new line command

	li $t0,0
	li $t1,20
for:
	bgt $t0,$t1,endfor

	li $v0,5
	syscall
	sw $v0,VECTOR($t0) #reads the numbers and stores them in to the array for 1st time

	addi $t0,$t0,4
j for
endfor:

	li $t0,4					

	li $t1,20	

forsortone:

	bgt $t0,$t1,endloopone #if we have completed the reading of all the numbers we go to the next step

	move $t2,$t0 #we put t0 into t2 to campare it 

forsorttwo:

	bgt $t2,$zero,if #if t2 is bigger than 0

j endlooptwo

if:

	lw $t3,VECTOR($t2)

	addi $t5,$t2,-4 #afairw gia na paw ston epomeno arithmo pou thelw na sugkrinw 

	lw $t4,VECTOR($t5) #load $t4 in  order to compare it 

	bgt $t3,$t4,endif #compatre $t3 to $t4

j endlooptwo

endif:

	move $t6,$t3  #we swap them 
	move $t3,$t4
	move $t4,$t6
	sw $t3,VECTOR($t2) 
	sw $t4,VECTOR($t5)#we save t3 and t4 into the array


	addi $t2,$t2,-4

j forsorttwo 
endlooptwo:

	addi $t0,$t0,4 #counter


j forsortone
endloopone:


	li $v0,4
	la $a0,result
	syscall

	li $v0,4
	la $a0,linefeed
	syscall

	li $t0,0
	li $t1,20
	loop:
	bgt $t0,$t1,end_loop

	lw $t2,VECTOR($t0)
	li $v0,1
	move $a0,$t2
	syscall #we load the numbers from the array to print them

	li $v0,4
	la $a0,linefeed
	syscall

	addi $t0,$t0,4 #counter 
j loop
end_loop:


end:
li $v0,10
syscall