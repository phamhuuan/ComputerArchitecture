.data
Message1:	.asciiz "Nhap so luong sinh vien: "
Message2:	.asciiz "Nhap ten sinh vien: "
Message3:	.asciiz "Nhap diem sinh vien: "
temp2:	.space 3
name:	.space 40
temp:	.space 4
point:	.word
.text
li	$v0 4
la	$a0 Message1
syscall
li	$v0 5
syscall
addi	$t0 $v0 0						# So luong sinh vien = t0
li	$t1 0							# i = 0 (inputLoop)
li	$t8 0							# i = 0
la	$t2 name						# Dia chi cua name
la	$t3 point						# Dia chi cua point
inputLoop:
slt	$t4 $t1 $t0						# Kiem tra i < tong so luong sinh vien
beqz	$t4 endInputLoop
li	$v0 4
la	$a0 Message2
syscall								# Nhap ten sinh vien: 
li	$v0 8
li	$a1 38
addi	$a0 $t2 0
syscall								# Nhap ten
li	$v0 4
la	$a0 Message3
syscall
li	$v0 5
syscall								# Nhap diem
sw	$v0 0($t3)
addi	$t1 $t1 1
addi	$t2 $t2 80						# t2 = t2 + 80
addi	$t3 $t3 80						# t3 = t3 + 80
j	inputLoop
endInputLoop:
la	$t2 name
la	$t3 point
addi	$t0 $t0 -1
sortLoop1:
slt	$s5 $t8 $t0
beqz	$s5 endSortLoop1
addi	$t4 $t2 0
addi	$t5 $t3 0
li	$t9 0							# j = 0
sortLoop2:
sub	$s7 $t0 $t8
slt	$s5 $t9 $s7
beqz	$s5 endSortLoop2
addi	$t6 $t5 80
lw	$s2 0($t5)
lw	$s3 0($t6)
slt	$s4 $s2 $s3
beqz	$s4 next
jal	swap
next:
addi	$t9 $t9 1
addi	$t4 $t4 80
addi	$t5 $t5 80
j	sortLoop2
endSortLoop2:
addi	$t8 $t8 1
addi	$t2 $t2 80
addi	$t3 $t3 80
j	sortLoop1
endSortLoop1:
j	printResult
swap:
sw	$s2 0($t6)
sw	$s3 0($t5)
addi	$s6 $t4 0
addi	$t7 $t4 80
li	$s4 0
swapName:
beq	$s4 2 endSwapName
lb	$s2 0($s6)
lb	$s3 0($t7)
sb	$s3 0($s6)
sb	$s2 0($t7)
addi	$s6 $s6 1
addi	$t7 $t7 1
beq	$s2 '\n' checkWord1
beq	$s3 '\n' checkWord2
j	swapName
checkWord1:
addi	$s4 $s4 1
beq	$s3 '\n' checkWord2
j	swapName
checkWord2:
addi	$s4 $s4 1
j	swapName
endSwapName:
jr	$ra
printResult:
la	$t1 name
la	$t2 point
li	$t3 0
addi	$t0 $t0 1
printLoop:
beq	$t3 $t0 endPrintLoop
li	$v0 4
addi	$a0 $t1 0
syscall
li	$v0 1
lw	$a0 0($t2)
syscall
li	$v0 11
li	$a0 '\n'
syscall
addi	$t3 $t3 1
addi	$t1 $t1 80
addi	$t2 $t2 80
j	printLoop
endPrintLoop:
end:
