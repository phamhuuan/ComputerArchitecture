start:
addi	$s1, $0, 5	# $s1 = 5
addi	$s2, $0, 4	# $s2 = 4
slt	$t0, $s1, $s1	# set less than if $s2 < $s1 => $t0 = 1 else $t0 = 0
bne	$t0, $0, else	#branch if not equal if $t0 != 0 => branch to else
addi	$t3, $0, 1
j	endif
else:
addi	$s2, $s2, 1
endif: