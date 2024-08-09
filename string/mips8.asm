#Nhập vào xâu ký tự. Đếm số ký tự chữ hoa, chữ thường và chữ số có trong xâu.
.data
	str: .space 1000
	str1: .asciiz "So chu cai in hoa: "
	str2: .asciiz "\nSo chu cai in thuong "
	str3: .asciiz "\nSo chu so: "
.text
input:	#nhập chuỗi
	li $v0, 8
	la $a0, str
	li $a1, 1000
	syscall
	add $s0, $zero, $a0 # $s0 = địa chỉ cơ sở của str
	nop

solve:	li $s1, 10 # $s1 = kí tự xuống dòng
	li $s2, 65
	li $s3, 90
	li $s4, 97
	li $s5, 122
	li $s6, 48
	li $s7, 57
	add $t0, $zero, $s0 # $t0 = con trỏ chạy của str
	li $t1, 0 # $t1 = số chữ cái in hoa 
	li $t2, 0 # $t2 = số chữ cái in thường
	li $t8, 0 # $t8 = số chữ số 
	while:
		lb $t3, 0($t0) # $t3 = str[i]
		beq $t3, $s1, print
	cnt_up:	#đếm chữ cái in hoa
		sge $t4, $t3, $s2
		sle $t5, $t3, $s3
		and $t6, $t4, $t5 # $t6 = (str[i] >= 65 && str[i] <= 90)
		beqz $t6, cnt_low
		addi $t1, $t1, 1
		j update_pointer
	cnt_low: #đếm chữ cái in thường
		sge $t4, $t3, $s4
		sle $t5, $t3, $s5
		and $t6, $t4, $t5 # $t6 = (str[i] >= 97 && str[i] <= 122)
		beqz $t6, cnt_num
		addi $t2, $t2, 1
		j update_pointer
	cnt_num: #đếm chữ số
		sge $t4, $t3, $s6
		sle $t5, $t3, $s7
		and $t6, $t4, $t5 # $t6 = (str[i] >= 48 && str[i] <= 57)
		beqz $t6, update_pointer
		addi $t8, $t8, 1
	update_pointer:
		addi $t0, $t0, 1
		j while

 print:	 #in số chữ cái in hoa
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 1
	add $a0, $zero, $t1
	syscall
	 #in số chữ cái in thường
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	 #in số chữ số
	li $v0, 4
	la $a0, str3
	syscall
	li $v0, 1
	add $a0, $zero, $t8
	syscall
exit:
	li $v0, 10
	syscall