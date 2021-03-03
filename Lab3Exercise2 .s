.data 
Vector: .space 20
AskInt: .asciiz "Please give me an integer: "
linefeed: .asciiz "\n"
max_: .asciiz "max: "
.text
main:

	li $t0,0
	#starts for loop

for:
	bgt $t0,16,endfor

	#asks for number
	li $v0,4
	la $a0,AskInt
	syscall

	#reads number
	li $v0,5
	syscall

	#inserts values in the array
	sw $v0,Vector($t0)

	#changes line
	li $v0,4
	la $a0,linefeed
	syscall

	#i++
	addi $t0,$t0,4
	j for
endfor: 

	li $t0,0
	sw $t1,Vector($t0)
	li $t0,4
	li $t3,16

	#starts do-while loop
do:

	lw $t2,Vector($t0)
	#Array[i]>max compares
	bgt $t2,$t1,if

	j endif

if:

	move $t1,$t2

	endif:
	addi $t0,$t0,4
	#statement
	ble $t0,$t3,do	

	#max:
	li $v0,4
	la $a0,max_
	syscall

	#prints max number
	li $v0,1
	move $a0,$t1
	syscall

	#ends programme
end:
li $v0,10
syscall