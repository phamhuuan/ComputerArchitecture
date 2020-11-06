.eqv	HEADING	0xffff8010
.eqv	MOVING	0xffff8050
.eqv	LEAVETRACK	0xffff8020
.eqv	WHEREX	0xffff8030
.eqv	WHEREY	0xffff8040
.text
main:
jal	TRACK
addi	$a0, $zero, 90
jal	ROTATE
jal	GO
sleep1:
addi	$v0,$zero,32
li	$a0,1000
syscall
jal	UNTRACK
jal	TRACK
goDOWN:
addi	$a0, $zero, 180
jal	ROTATE
sleep2:
addi	$v0,$zero,32
li	$a0,2000
syscall
jal	UNTRACK
jal	TRACK
goLEFT:
addi	$a0, $zero, 270
jal	ROTATE
sleep3:
addi	$v0,$zero,32
li	$a0,1000
syscall
jal	UNTRACK
jal	TRACK
goASKEW:
addi	$a0, $zero, 120
jal	ROTATE
sleep4:
addi	$v0,$zero,32
li	$a0,2000
syscall
jal	UNTRACK
jal	TRACK
end_main:
GO:
li	$at, MOVING
addi	$k0, $zero,1
sb	$k0, 0($at)
jr	$ra
STOP:
li	$at, MOVING
sb	$zero, 0($at)
jr	$ra
TRACK:
li	$at, LEAVETRACK
addi	$k0, $zero,1
sb	$k0, 0($at)
jr	$ra
UNTRACK:
li	$at, LEAVETRACK
sb	$zero, 0($at)
jr	$ra