.data 
	str: .asciiz " "
	str1: .asciiz "\nNhap lai: "
.text 
	#lưu $s0 = M, $s1 = N, $s2 = Q 
	# nhập $s0 = M
input:	li $v0, 5
	syscall
	add $s0, $v0, $zero
	# nhập $s1 = N
	li $v0, 5
	syscall
	add $s1, $v0, $zero
	# nhập $s2 = Q
	li $v0, 5
	syscall
	add $s2, $v0, $zero
	nop
check_exp:	bge $s0, $s1, error_input #m >= N nhập lại
		mul $t0, $s0, $s1 #$t0 = M * N 
		bgt $t0, $s2, error_input # M * N > Q nhập lại 
		j solve
		nop
error_input: #thông báo nhập sai 
	li $v0, 4
	la $a0, str1
	syscall
	j input

solve:		add $t0, $s0, $zero #$to = i = M 
		li $s3, 0#$s3 = check
	while_loop:	bgt $t0, $s1, end_loop #nếu i > N thoát vòng lặp
			#kiểm tra i có phải ước của Q 
			div $s2, $t0 
			mfhi $t1 #$t1 là phần dư 
			beqz $t1, print
			j update
		print: #đã tìm thấy ước
			li $v0, 1
			add $a0, $t0, $zero
			syscall
			li $v0, 4
			la $a0, str
			syscall
			addi $s3, $zero, 1
		update: addi $t0, $t0, 1
			j while_loop		
		
end_loop: 
	#kiểm tra check
	beqz $s3, notfound
finish:	li $v0, 10
	syscall
notfound:
	li $t0, -1
	li $v0, 1
	add $a0, $t0, $zero
	syscall	 
	j finish