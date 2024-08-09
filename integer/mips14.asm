#Nhập 2 số nguyên dương M và N từ bàn phím. In ra bội số chung nhỏ nhất của M và N.
#Lời giải: BCNN(m, n) = (m * n) / UCLN(m, n)
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = m (= giá trị UCLN)
	li $v0, 5
	syscall 
	add $s1, $v0, $zero # $s1 = n 
	
solve:	add $t1, $s0, $zero # $t1 = m
	add $t2, $s1, $zero # $t2 = n
	while:	beqz $s1, finish
		add $t0, $zero, $s1 #$t0 = tmp = n
		div $s0, $s1
		mfhi $s1  #$s1 = m % n
		add $s0, $zero, $t0 # $s0 = m = tmp
		j while
finish:	# $s0 = UCLN(m, n)
	mult $t1, $t2
	mflo $t3 # $t3 = m * n
	div $t3, $s0
	mflo $a0 # $a0 = BCNN
exit:
	li $v0, 1
	syscall
	li $v0, 10
	syscall