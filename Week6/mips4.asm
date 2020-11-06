.data
A:	.word 2, -9, 0, 3, -1, -5, 69
length:	.word 7
.text
main: 
la	$v0, A			
addi	$v0, $v0, 4		
la	$a3, length		
sub	$a3, $a3, 4		
la	$t0, A			
for_loop: 
bgt	$v0, $a3, end_for	
sub	$v1, $v0, 4		
lw	$a0, 0($v0)		
while:
blt	$v1, $t0, end_while	
lw	$a1, 0($v1)		
ble	$a1, $a0, end_while	
sw	$a1, 4($v1)		
sub 	$v1, $v1, 4		
j	while
end_while:
sw	$a0, 4($v1)
addi	$v0, $v0, 4
j for_loop
end_for:
li $v0, 10		# Exit
syscall


# $v0 address of A[firstIndex]
# $v1 address of A[runIndex]
# $a0 insertValue
# $a1 value of A[run]
# $a2 address of A[run]
# $a3 address of A[length-1]

#-----------------------------------------------------------

# Y tuong thuat toan

# for 

#	firstIndex(Unsorted A) = 1 to (length-1)

# 	runIndex = firstIndex-1;

# 	insert = A[firstIndex];

# 	while

#		(runIndex >=0) && (A[runIndex] > insertValue)

#		{A[runIndex + 1] = A[runIndex];

#		runIndex = runIndex - 1;}

#	end_while

# 	A[runIndex + 1] = insert;

# end_for

#------------------------------------------------------------