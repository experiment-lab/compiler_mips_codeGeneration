.globl main:
	li $a0 70
	sw $a0 0($sp)
	addiu $sp $sp -4
	li $a0 3
	sw $a0 0($sp)
	addiu $sp $sp -4
	li $a0 10
	lw $t0 4($sp)
	addiu $sp $sp  4
	mul $a0 $t0 $a0
	lw $t0 4($sp)
	addiu $sp $sp  4
	sub $a0 $t0 $a0
	la $t0 vars
	sw $a0 12($t0)
	li	$v0 10	# Code for syscall: exit
	syscall
