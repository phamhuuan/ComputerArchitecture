.text
li	$s0 13
li	$s1 23
push:
addi	$sp $sp -8
sw	$a0 4($sp)
sw	$s1 8($sp)
work:
nop
nop
nop
pop:
lw	$s0 0($sp)
lw	$s1 4($sp)
addi	$sp $sp 8