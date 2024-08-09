#nguyên dương N từ bàn phím, in ra tổng các chữ số trong biểu diễn nhị phân của N.
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 
solve:	li $s1, 0 # $s1 = sum = 0
	li $s2, 2
	while:	beqz $s0, exit
		div $s0, $s2
		mfhi $t0 # $t0 = n % 2
		mflo $s0 # $s0 = n =  n/2
		add $s1, $s1, $t0
		j while
exit:	li $v0, 1
	add $a0, $s1, $zero
	syscall
	li $v0, 10
	syscall	
	