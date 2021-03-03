.data
VECTOR: .space 24
msg1: .asciiz "Please give 6 integers:"
result: .asciiz "The array is:"
insertionsort: .asciiz "The sorted array is:"
maxis: .asciiz "The max element is:"
minis: .asciiz "The min element is:"
menu_m: .asciiz "Menu:"
menu_0: .asciiz "Give 0 to show array."
menu_1: .asciiz "Give 1 to find max."
menu_2: .asciiz "Give 2 to find min."
menu_3: .asciiz "Give 3 to sort the array."
menu_4: .asciiz "Give 4 to exit."
space: .asciiz " "
line_feed: .asciiz "\n"

.text
main:
				#reads the array
	li $v0,4
	la $a0,msg1
	syscall

	li $v0,4
	la $a0,line_feed
	syscall

	li $t0,0
	li $t1,20

	for:
	bgt $t0,$t1,endfor

	li $v0,5
	syscall
	sw $v0,VECTOR($t0)

	addi $t0,$t0,4#counter
j for
endfor:


loop:

#menu:
	li $v0,4
	la $a0,line_feed
	syscall

	li $v0,4
	la $a0,menu_m
	syscall

	#menu_0
	li $v0,4
	la $a0,line_feed
	syscall

	li $v0,4
	la $a0,menu_0
	syscall

	#menu_1
	li $v0,4
	la $a0,line_feed
	syscall

	li $v0,4
	la $a0,menu_1
	syscall

	#menu_2
	li $v0,4
	la $a0,line_feed
	syscall

	li $v0,4
	la $a0,menu_2
	syscall

	#menu_3
	li $v0,4
	la $a0,line_feed
	syscall

	li $v0,4
	la $a0,menu_3
	syscall

	#menu_4
	li $v0,4
	la $a0,line_feed
	syscall


	li $v0,4
	la $a0,menu_4
	syscall

#reads the number that the user gives
	li $v0,4
	la $a0,line_feed
	syscall

	li $v0,4
	la $a0,line_feed
	syscall

	li $v0,5
	syscall

	move $t0,$v0



	li $t1,4
	beq $t0,$t1,endloop


	li $t1,0
	beq $t0,$t1,if0
j endif0
if0:

	li $v0,4
	la $a0,result
	syscall

	li $t0,0 
	li $t1,20
jal printarr #goes to constructor

endif0:

	li $t1,1
	beq $t0,$t1,if1
j endif1
if1:

	lw $t2,VECTOR($zero)
	li $t0,4
	li $t1,20
maxloop: #finds max
	bgt $t0,$t1,endmaxloop

	lw $t3,VECTOR($t0)

	bgt $t3,$t2,maxif
j endmaxif
maxif:
	lw $t2,VECTOR($t0)

endmaxif:

    addi $t0,$t0,4#counter
j maxloop
endmaxloop:

	li $v0,4
	la $a0,maxis
	syscall

	li $v0,1
	move $a0,$t2
	syscall

	li $v0,4
	la $a0,line_feed
	syscall

endif1:


	li $t1,2
	beq $t0,$t1,if2
j endif2
if2:

	lw $t2,VECTOR($zero)
	li $t0,4
	li $t1,20
minloop:
	bgt $t0,$t1,endminloop

	lw $t3,VECTOR($t0)

	blt $t3,$t2,minif
j endminif
minif:
 lw $t2,VECTOR($t0)

endminif:

 addi $t0,$t0,4#counter
j minloop
endminloop:

	li $v0,4
	la $a0,minis
	syscall

	li $v0,1
	move $a0,$t2
	syscall

	li $v0,4
	la $a0,line_feed
	syscall

endif2:


	li $t1,3
	beq $t0,$t1,if3
j endif3
if3:

	li $t3,0
	li $t2,0
	li $t0,4					
	li $t1,20
jal sortarr #goes to sort array in function

	li $v0,4
	la $a0,insertionsort
	syscall

	li $t0,0 
	li $t1,20
jal printarr #prints array



endif3:





j loop
endloop:

end:#ends programme
 li $v0,10
syscall




#constructors
printarr:


printloop:
	bgt $t0,$t1,endprintloop

	lw $s2,VECTOR($t0)
	li $v0,1
	move $a0,$s2
	syscall

	li $v0,4
	la $a0,space
	syscall

	addi $t0,$t0,4 #counter
j printloop
endprintloop:

	li $v0,4
	la $a0,line_feed
	syscall


jr $ra #jumps back to jal



sortarr: #sorts array
	

forsortone:

	bgt $t0,$t1,endloopone


	move $t2,$t0

forsorttwo:

 bgt $t2,$zero,ifsort
j endlooptwo
ifsort:

	lw $t3,VECTOR($t2)

	addi $t5,$t2,-4

	lw $t4,VECTOR($t5)

	bgt $t3,$t4,endifsort
j endlooptwo
endifsort:

	move $t6,$t3
	move $t3,$t4
	move $t4,$t6
	sw $t3,VECTOR($t2)
	sw $t4,VECTOR($t5)


 addi $t2,$t2,-4 #counter
j forsorttwo 
endlooptwo:


 addi $t0,$t0,4 #counter
j forsortone
endloopone:

jr $ra #jumps back to jal

#finish

