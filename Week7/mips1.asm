.text
main:
li	$a0 -100
jal	abs
nop
add	$s0 $0 $v0
li	$v0 10
syscall
endmain:
abs:
sub	$v0 $0 $a0
blez	$a0 done
nop
add	$v0 $a0 $0
done:
jr	$ra
