#Nhập số nguyên dương N từ bàn phím, in ra số N theo chiều ngược lại (kể cả chữ số 0 ở đầu)
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 
solve:	li $s1, 10
	while: beqz $s0, exit
		div $s0, $s1
		mflo $s0
		mfhi $a0
		li $v0, 1
		syscall
		j while
	
exit:	li $v0, 10
	syscall