#n ra các số nguyên tố nhỏ hơn N.
.data 
	str: .asciiz " "
.text
input:	li $v0, 5
	syscall
	add $s0, $v0, $zero # $s0 = N 
	nop

print:  li $t0, 2 # i = 2
	loop_solve: 	beq $t0, $s0, exit
		jal isPrime
		nop
		beq $v1, $zero, update_i
		#in ra số nguyên tố thỏa mãn
		li $v0, 1
		add $a0, $zero, $t0
		syscall
		li $v0, 4
		la $a0, str
		syscall
		
	update_i: addi $t0, $t0, 1
		  j loop_solve
isPrime: #đầu vào là $t0 = i, kết quả trả về là $v1
	li $t1, 2 # $t1 = j = 2
	li $s1, 1 #kiểm tra điều kiện đầu vào
	bgt $t0, $s1, loop
	li $v1, 0
	jr $ra #return 0
	
	loop:	beq $t1, $t0, return
		div $t0, $t1
		mfhi $t2 # $t2 = $t0 % $t1
		bne $t2, $zero, update_j
		li $v1, 0
		jr $ra #return 0
		update_j: addi $t1, $t1, 1
			j loop
return: 
	li $v1, 1#return 1
	jr $ra
	
exit:  li $v0, 10
       syscall