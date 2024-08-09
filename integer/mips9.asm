.data 
	str1: .asciiz "Tong chan: "
	str2: "\nTong le: "
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 
solve:	li $s1, 10
	li $t1, 2
	li $s2, 0 # $s2 = tổng chẵn
	li $s3, 0 # $s3 = tổng lẻ
	while:	beqz $s0, exit
		div $s0, $s1
		mflo $s0 # $s0 /= 10
		mfhi $t0 # $t0 = n % 10 = d
		div $t0, $t1
		mfhi $t2
		beqz $t2, update_tong_chan
	update_tong_le:	
		add $s3, $s3, $t0
		j while
	update_tong_chan:	
		add $s2, $s2, $t0
		j while
exit: 	
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 1
	add $a0, $s2, $zero
	syscall
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	add $a0, $s3, $zero
	syscall
	li $v0, 10
	syscall