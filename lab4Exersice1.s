.data
Vector: .space 32
msg1: .asciiz "Please give the  number you want to change to binary:"
result: .asciiz "The result is:"

.text
main:
	li $v0,4
	la $a0,msg1
	syscall #shows the message

	li $v0,5
	syscall #reads the number
	move $s0,$v0

	li $t1,32 
	li $t0,0
while: #while loop to fill the array
	beq $t0,$t1,end_while
	sw $zero,Vector($t0) 
	addi $t0,$t0,4
j while
end_while:

	li $t6,1
	li $t0,0 #do it again 0 for further use
	li $t4,2
do:
	rem $t2,$s0,$t4 #mods
	div $t3,$s0,$t4 #divides


	beq $t2,$zero,if #if it is 0 stops the loop

	j endif
if:
	sw $zero,Vector($t0) 
	j end_endif

endif:
	sw $t6,Vector($t0) #store the numbers

end_endif:


	addi $t0,$t0,4 
	move $s0,$t3
	bgt $t3,0,do

	li $v0,4
	la $a0,result
	syscall #message for result 

	li $t0,28 
for:
	blt $t0,0,endfor
	li $v0,1
	lw $a0,Vector($t0) # print the numbers
syscall
	addi $t0,$t0,-4
j for
endfor:


end: #the end
li $v0,10	
syscall