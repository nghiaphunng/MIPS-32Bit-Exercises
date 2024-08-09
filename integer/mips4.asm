#Số hoàn hảo là số có giá trị bằng tổng các ước số không kể chính nó. Nhập số nguyên dương N
#từ bàn phím, in ra các số hoàn hảo nhỏ hơn N.
.data 
	str: .asciiz " "
.text
init:	#nhập số nguyên N 
	li $v0, 5
	syscall
	add $s0, $v0, $zero #sử dụng $s0 = N 
	jal solve
	nop
	
solve:	li $t0, 1 # $t0 = i = 1 -> n - 1
	loop:	beq $t0, $s0, exit
		jal isPerfect
		nop
		beqz $v1, update_i
		#in ra số hoàn hảo thỏa mãn
		li $v0, 1
		add $a0, $zero, $t0
		syscall
		li $v0, 4
		la $a0, str
		syscall
		
	update_i:	addi $t0, $t0, 1
			j loop
			
isPerfect:	#đầu vào là i = $t0, giá trị trả về là $v1
	li $s1, 0 # $s1 = sum = 0
	li $t1, 1 # $t1 = j = 1
	li $t4, 2
	div $t0, $t4
	li $v1, 0 #giá trị trả về
	mflo $t2 # $t2 = i/2
	loop_check:	bgt $t1, $t2, return 
			div $t0, $t1
			mfhi $t3 # $t3 = $t0 % $t1 = i % j
			bnez $t3, update_j
			add $s1, $s1, $t1 # sum = sum + j
	 update_j:	addi $t1, $t1, 1
	 		j loop_check
	 
	  
	return:	seq $v1, $s1, $t0
		jr $ra
		 
exit: 	li $v0, 10
	syscall
