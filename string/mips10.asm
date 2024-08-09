.data
	str: .space 1000
	str1: .asciiz "\nTong cac chu so: "
	str2: .asciiz "\nTong ascii cac chu cai: "
	
.text
input:	li $v0, 8
	la $a0, str
	li $a1, 1000
	syscall
	add $s0, $zero, $a0 # $s0 = địa chỉ cơ sở của str
	nop
solve:	li $s1, 0 # $s1 = sum_char
	li $s2, 0 # $s2 = sum_num
	li $s3, 10 # kí tự xuống dòng
	add $t0, $zero, $s0 # $t0 = con trỏ chạy của str
	
	li $s4, 65
	li $s5, 90
	li $s6, 97
	li $s7, 122
	li $t8, 48
	li $t9, 57
	while:	
		lb $t1, 0($t0) # $t1 = str[i]
		beq $t1, $s3, print
		
	check_char: #kiểm tra kí tự chữ cái
		sge $t2, $t1, $s4
		sle  $t3, $t1, $s5
		and $t4, $t2, $t3 # $t4 = (str[i] >= 65 && str[i] <= 90)
		sge $t2, $t1, $s6
		sle $t3, $t1, $s7
		and $t5, $t2, $t3 # $t5 = (str[i] >= 97 && str[i] <= 122)
		or $t6, $t4, $t5
		beqz $t6, check_num
		add $s1, $s1, $t1
		j update_pointer
	check_num: #kiểm cho ksi tự chữ số
		sge $t2, $t1, $t8
		sle $t3, $t1, $t9
		and $t4, $t2, $t3 # $t4 = (str[i] >= 48 && str[i] <= 57)
		beqz $t4, update_pointer
		add $s2, $s2, $t1
		addi $s2, $s2, -48
	update_pointer:
		addi $t0, $t0, 1
		j while

print:
	#in tổng kí tự chữ số
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 1
	add $a0, $zero, $s2
	syscall
	#in tổng kí tự chữ cái
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	add $a0, $zero, $s1
	syscall
exit:
	li $v0, 10
	syscall