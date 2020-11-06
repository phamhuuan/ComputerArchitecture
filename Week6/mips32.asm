.data
array:		.word	5 1 2 9 6 3 8 -5 -10 -3 21
arrayEnd:	.word
.text
la	$a0 array
la	$a1 arrayEnd
sub	$a2 $a1 $a0
div	$a3 $a2 4
addi	$a3 $a3 -1
li	$t0 0						#i = 0
begin_loop1:
slt	$t9 $t0 $a3
beq	$t9 $0 end_loop1
li	$t1 0
begin_loop2:
sub	$t5 $a3 $t0
slt	$t4 $t1 $t5
beq	$t4 $0 end_loop2
mul	$s0 $t1 4
addi	$s1 $s0 4
lw	$s2 array($s0)
lw	$s3 array($s1)
slt	$t2 $s3 $s2
beq	$t2 $0 next
sw	$s3 array($s0)
sw	$s2 array($s1)
next:
addi	$t1 $t1 1
j	begin_loop2
end_loop2:
addi	$t0 $t0 1					# i= i+1
j	begin_loop1
end_loop1: