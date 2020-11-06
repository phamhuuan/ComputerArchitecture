.text
main:
li	$a0 10
li	$a1 -50
li	$s2 15
jal	max
nop
add	$s0 $0 $v0
li	$v0 10
syscall
max:
add	$v0 $a0 $0
sub	$t0 $a1 $v0
bltz	$t0 okay
nop
add	$v0 $a1 $0
okay:
sub	$t0 $a2 $v0
blez	$t0 done
nop
add	$v0 $a2 $0
done:
jr	$ra
