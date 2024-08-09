#in ra dãy số Fibonacci nhỏ hơn N
.data 
	str: .asciiz " "
.text
input:	#nhập N
	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 
init:	li $t0, 0 #a = 0
	li $t1, 1 #b = 1
	li $s1, 1
	li $s2, 2
solve:	#nếu N < 1 ->thoát 
	blt $s0, $s1, exit
	#in ra 0
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	li $v0, 4
	la $a0, str
	syscall
	#nếu N < 2 
	blt $s0, $s2, exit
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	li $v0, 4
	la $a0, str
	syscall
	#nếu N > 2 
	add $t2, $t0,$t1 # $t2 = $t0 + $t1 = a + b = c
	loop:	sgt $t5, $t2, $s0	# $t5 = (c > N)
		seq $t6, $t2, $s0      # $t6 = (c == N)
		or $t7, $t5, $t6
		bne $t7, $zero, exit # nếu c >= N ->exit
		li $v0, 1
		add $a0, $t2, $zero
		syscall	
		li $v0, 4
		la $a0, str
		syscall
	
		add $t0, $zero, $t1 # a = b 
		add $t1, $zero, $t2 # b = c 
		add $t2, $t0, $t1 # c = a + b
		j loop
exit: li $v0, 10
      syscall 
