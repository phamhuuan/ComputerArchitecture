.data
A: .word 7, -2, 5, 1, 5,6,7,3,6,8,8,59,5
Aend: .word
.text
main:
la	$a0 A #$a0 = Address(A[0])
la	$a1 Aend
addi	$a1 $a1 -4 #$a1 = Address(A[n-1])
j	sort #sort
after_sort:
li	$v0 10 #exit
syscall
end_main:
sort:
beq	$a0 $a1 done
j	max
after_max:
lw	$t0,0($a1)
sw	$t0,0($v0)
sw	$v1,0($a1)
addi	$a1,$a1,-4
j	sort
done:
j	after_sort
max:
addi	$v0,$a0,0				#max pointer = first
lw	$v1,0($v0)				#max = first
addi	$t0,$a0,0				#next pointer = first
loop:
beq	$t0,$a1,ret				#if next pointer = last => return
addi	$t0,$t0,4				#go to next element
lw	$t1,0($t0)				#tmp = next element
slt	$t2,$t1,$v1				#t2 = max < next element ? 1 : 0
bne	$t2,$zero,loop				#if t2 = 0 else go to loop
addi	$v0,$t0,0				#max pointer = current
addi	$v1,$t1,0				#max = current
j	loop
ret:
j	after_max
