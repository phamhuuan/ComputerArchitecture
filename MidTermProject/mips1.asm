.data
Message:	.asciiz "Nhap vao ten sinh vien:"
Message2:	.asciiz "Ten sinh vien la:"
space:	.word ' '
A:	.space	100
B:	.space	100
li	$t3 0	#k
li	$s4 0	#j
li	$t5 0
.text
li	$s0 ' '
li	$s1 0
li	$s7 0
li	$v0 54
la	$a0 Message
la	$a1 A
la	$a2 B
syscall
get_length:
la	$a1 A
xor	$v1 $zero $zero
xor	$t0 $zero $zero
check_char:
add	$t1 $a1 $t0
lb	$t2 0($t1)
beq	$t2 $0 end
addi	$t0 $t0 1
beq	$t2 $s0 check_char2
j	check_char
check_char2:
addi	$s1 $t0 -1
j	check_char
end:
addi	$v1 $t0 0
addi	$s4 $s1 0
khoi_tao_loop:
addi	$t5 $v1 -2
loop:
slt	$s2 $t5 $s1
bne	$s2 $0 end_loop
add	$s6 $s1 $a1
lb	$s3 0($s6)
add	$s5 $s7 $a2
sb	$s3 0($s5)
addi	$s1 $s1 1
addi	$s7 $s7 1
j	loop
end_loop:
add	$s5 $s7 $a2
sb	$s0 0($s5)
addi	$s7 $s7 1
init_loop2:
addi	$t9 $0 0
loop2:
slt	$s2 $t9 $s4
beq	$s2 $0 end_loop2
add	$s6 $t9 $a1
lb	$s3 0($s6)
add	$s5 $s7 $a2
sb	$s3 0($s5)
addi	$t9 $t9 1
addi	$s7 $s7 1
j	loop2
end_loop2:
print_length:
li	$v0 59
la	$a0 Message2
la	$a1 B
syscall
