start:
	addi $s1, $0, 8 # i
	add $s2, $0, 6 # j
	slt $t0,$s1,$s2 # i<j
	bne $t0,$zero,else # branch to else if j<i
	slt $t0,$s2,$s1 # i>=j
	bne $t0,$zero,else
	addi $s3,$s1,$s2
	slt $t0,$t3,$0, #i+j < 0
	bne $t0,$zero,else
	addi $t1,$t1,1 # then part: x=x+1
	addi $t3,$zero,1 # z=1
	j endif # skip “else” part
else:
	addi $t2,$t2,-1 # begin else part: y=y-1
	add $t3,$t3,$t3 # z=2*z
endif: