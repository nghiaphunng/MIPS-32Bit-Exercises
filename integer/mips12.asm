#Nhập số nguyên dương N từ bàn phím, in ra chữ số lớn nhất của N
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 	
solve:	li $s1, 10	
	li $s2, -10	#$s2 = res
	while:	beqz $s0, exit
		div $s0, $s1
		mfhi $t0 # $t0 = d = n % 10
		mflo $s0 # $s0 = n = n/10
		seq $t3, $t0, $s2 # $t3 = (d == res)
		slt $t4, $t0, $s2 # $t4 = (d < res)
		or $t5, $t3, $t4
		bnez $t5, while
		add $s2, $t0, $zero
		j while
exit:	li $v0, 1
	add $a0, $s2, $zero
	syscall
	li $v0, 10
	syscall 