#in ra các số chia hết cho 3 hoặc cho 5 nhỏ hơn N 
.data 
	str: .asciiz " "
.text
input: #nhập N
	li $v0, 5
	syscall
	add $s0, $v0, $zero # $s0 = N 
	
solve:	li $t0, 0 # $t0 = i = 0
	li $s1, 3
	li $s2, 5
	loop:	beq $t0, $s0, end #i < N
		#i % 3 == 0
		div $t0, $s1
		mfhi $t1 # $t1 = i % 3 
		div $t0, $s2
		mfhi $t2 # $t2 = i % 5 
		seq $t1, $t1, $zero
		seq $t2, $t2, $zero
		or $s3, $t1, $t2 # $s3 = (i % 3 == 0 || i % 5 == 0)
		beq $s3, $zero, update_i
		#in ra i thỏa mãn
		li $v0, 1
		add $a0, $t0, $zero
		syscall
		li $v0, 4
		la $a0, str
		syscall
		
	update_i: addi $t0, $t0, 1
		  j loop
end:	li $v0, 10
	syscall
