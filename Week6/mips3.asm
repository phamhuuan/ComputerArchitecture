.data
A:	.word 2 -9 0 3 -1 -5 -69
.text
main :
li	$a1 6					# $a1 = n-1
li	$t0 0					# i = 0
begin_loop1:
slt	$t1 $t0 $a1				# check i < n-1
beq	$t1 $zero end_loop1			# 
li	$t2 0					# j = 0
begin_loop2:
sub	$t3 $a1 $t0				# $s3 = n-1-j
slt	$t4 $t2 $t3				# check j < n-1-j
beq	$t4 $zero end_loop2			# if j >= n-1-j end_loop2
add	$t5 $t2 $t2
add	$t5 $t5 $t5				# $t5 = j*4
lw	$t6 A($t5)				# $t6 = A[j]
addi	$t7 $t2 1
add	$t7 $t7 $t7
add	$t7 $t7 $t7				# $t7 = (j+1)*4
lw	$t8 A($t7)				# $t8 = A[j+1}
slt	$t9 $t8 $t6				# check A[j+1] < A[j]
beq	$t9 $zero noswap			# if A[j+1] >= A[j] noswap
sw	$t8 A($t5)
sw	$t6 A($t7)				# swap A[j] and A[j+1]
noswap:
addi $t2 $t2 1					# j =j+1
j begin_loop2						#
end_loop2:
addi $t0 $t0 1					# i= i+1
j begin_loop1						# 
end_loop1:

#--------------------------------------------------------

# Y tuong thuat toan

# 	for_loop1 i = 0 to n - 1

#		for_loop2 j = 0 to(n - i - 1)

#			if (arr[j] > arr[j + 1]) swap

#		end_loop2

#	end_loop1

#--------------------------------------------------------
