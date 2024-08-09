#Nhập 2 số nguyên dương M và N từ bàn phím. In ra ước số chung lớn nhất của M
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = m
	li $v0, 5
	syscall 
	add $s1, $v0, $zero # $s1 = n 
solve:	
	while:	beqz $s1, exit
		add $t0, $zero, $s1 #$t0 = tmp = n
		div $s0, $s1
		mfhi $s1  #$s1 = m % n
		add $s0, $zero, $t0 # $s0 = m = tmp
		j while
exit:
	li $v0, 1
	add $a0, $s0, $zero
	syscall
	li $v0, 10
	syscall