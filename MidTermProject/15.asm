.data
Message:	.asciiz "Nhap vao mot dinh danh:"
Message2:	.asciiz "Dinh danh khong hop le: "
Message3:	.asciiz "Dinh danh hop le: "
Message4:	.asciiz "Ban co muon tiep tuc khong?"
A:	.space 100
B:	.space 100
.text
li	$s0 '_'
li	$s1 'A'
li	$s2 'Z'
li	$s3 'a'
li	$s4 'z'
li	$s5 '0'
li	$s6 '9'
li	$s7 '\n'
start:
li	$v0 54
la	$a0 Message
la	$a1 A
la	$a2 B
syscall
get_length:
la	$a1 A
xor	$t0 $zero $zero					# i = 0
add	$t1 $a1 $t0
lb	$t2 0($t1)
addi	$t0 $t0 1
slt	$t3 $t2 $s1
slt	$t4 $s2 $t2
add	$t5 $t3 $t4
beqz	$t5 check_char
slt	$t3 $t2 $s3
slt	$t4 $s4 $t2
add	$t5 $t3 $t4
beqz	$t5 check_char
beq	$t2 $s0 check_char
j	print_false
check_char:
add	$t1 $a1 $t0
lb	$t2 0($t1)
beq	$t2 $s7 print_true
addi	$t0 $t0 1
slt	$t3 $t2 $s1
slt	$t4 $s2 $t2
add	$t5 $t3 $t4
beqz	$t5 check_char
slt	$t3 $t2 $s3
slt	$t4 $s4 $t2
add	$t5 $t3 $t4
beqz	$t5 check_char
slt	$t3 $t2 $s5
slt	$t4 $s6 $t2
add	$t5 $t3 $t4
beqz	$t5 check_char
beq	$t2 $s0 check_char
j	print_false
print_false:
li	$v0 59
la	$a0 Message2
j	end
print_true:
li	$v0 59
la	$a0 Message3
j	end
end:
syscall
try_again:
li	$v0 50
la	$a0 Message4
syscall
beq	$a0 0 start
beq	$a0 2 try_again
exit:
