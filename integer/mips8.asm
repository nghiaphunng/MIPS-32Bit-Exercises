#Nhập số nguyên dương N từbàn phím, in ra các số chính phương nhỏ hơn N
.data
	str: .asciiz " "
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 
solve:	li $t0, 1  #$t0 = i = 1
	while:	beq $t0, $s0, exit
		mult $t0, $t0
		mflo $t1 # $t1 = i * i 
		seq $t2, $t1, $s0 # $t2 = (i * i == n)
		sgt $t3, $t1, $s0 # $t3 = (i * i > n)
		or $t4, $t2, $t3
		bnez $t4, update_i
		li $v0, 1
		add $a0, $t1, $zero
		syscall
		li $v0, 4
		la $a0, str
		syscall
	update_i: addi $t0, $t0, 1
		  j while
exit:	li $v0, 10
	syscall