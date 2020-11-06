.data
Message:	.asciiz "Nhap vao mot tu"
Message2:	.asciiz "Strings have "
Message3:	.asciiz " common characters: "
Message4:	.asciiz " and "
A:	.space 100
temp:	.space 4
count:	.word 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.text
start:
li	$s7 'a'
li	$v0 54
la	$a0 Message
la	$t1 A
la	$t2 count
li	$t4 2
inputLoop:
addi	$a1 $t1 0
la	$a2 temp
syscall
la	$t0 A
countLoop:
lb	$s0 0($t0)
beq	$s0 '\n' endCountLoop
sub	$s0 $s0 'A'
slti	$s1 $s0 31
bnez	$s1 next
addi	$s0 $s0 -32
next:
mul	$t3 $s0 4
add	$t3 $t2 $t3
lw	$s3 0($t3)
addi	$s3 $s3 1
sw	$s3 0($t3)
addi	$t0 $t0 1
j	countLoop
endCountLoop:
addi	$t4 $t4 -1
beqz	$t4 endInputLoop
addi	$t2 $t2 104
j	inputLoop
endInputLoop:
la	$t0 count
addi	$t1 $t0 104
addi	$t2 $t1 104
li	$t5 27
li	$s5 0
li	$t6 0
li	$t7 0
countLoop2:
add	$t7 $t7 $t6
li	$t6 0
addi	$t5 $t5 -1
beqz	$t5 endCountLoop2
lw	$s0 0($t0)
lw	$s1 0($t1)
addi	$t0 $t0 4
addi	$t1 $t1 4
addi	$t2 $t2 4
beqz	$s0 countLoop2
beqz	$s1 countLoop2
addi	$s5 $s5 1
addi	$t2 $t2 -4
addi	$t6 $s0 0
sw	$s0 0($t2)
slt	$t4 $s0 $s1
addi	$t2 $t2 4
bnez	$t4 countLoop2
addi	$t2 $t2 -4
addi	$t6 $s1 0
sw	$s1 0($t2)
addi	$t2 $t2 4
j	countLoop2
endCountLoop2:
la	$t0 count
addi	$t0 $t0 208
li	$v0 4
la	$a0 Message2
syscall
li	$v0 1
addi	$a0 $t7 0
syscall
li	$v0 4
la	$a0 Message3
syscall
li	$t2 0
printLoop:
lw	$s0 0($t0)
addi	$t0 $t0 4
addi	$t2 $t2 1
beqz	$s0 printLoop
li	$v0 1
addi	$a0 $s0 0
syscall
li	$v0 11
addi	$a0 $t2 96
syscall
addi	$s5 $s5 -1
beqz	$s5 endPrintLoop
li	$v0 4
la	$a0 Message4
syscall
j	printLoop
endPrintLoop:

