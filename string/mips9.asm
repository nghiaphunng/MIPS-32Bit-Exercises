#Nhập vào xâu ký tự. Đếm số nguyên âm trong câu. (Các nguyên âm là a, i, u, e, o)
.data
	str: .space 1000
.text
input:	#nhập chuỗi
	li $v0, 8
	la $a0, str
	li $a1, 1000
	syscall
	add $s0, $zero, $a0 # $s0 = địa chỉ cơ sở của str
	nop
solve:	li $s7, 10
	li $s1, 'a'
	li $s2, 'i'
	li $s3, 'u'
	li $s4, 'e'
	li $s5, 'u'
	li $s6, 10 # $s6 : kí tự xuống dòng
	li $t8, 65
	li $t9, 90
	li $a0, 0 # $a0 = cnt = số kí tự nguyên âm
	low_str: #chuyển hết chữ cái sang in thường trong str
		add $t0, $zero, $s0 # $t0 : con trỏ chạy của str
		while:	lb $t1, 0($t0) # $t1 = str[i]
			beq $t1, $s7, while_solve
			#tìm kí tự là chữ cái hoa
			sge $t2, $t1, $t8
			sle $t3, $t1, $t9
			and $t6, $t2, $t3 # $t6 = (str[i] >= 65 && str[i] <= 90)
			beqz $t6, update
			add $t1, $t1, 32 # str[i] += 32;
			sb $t1, 0($t0)
		update:
			addi $t0, $t0, 1
			j while
	while_solve:	
		lb $t1, 0($s0)
		beq $t1, $s7, print
		#tìm kí tự nguyên âm
		seq $t2, $t1, $s1
		seq $t3, $t1, $s2
		or $t4, $t2, $t3 # $t4 = (str[i] == 'a' || str[i] == 'i')
		seq $t2, $t1, $s3
		or $t4, $t2, $t4 # $t4 = (str[i] == 'a' || str[i] == 'i' || str[i] == 'u' )
		seq $t2, $t1, $s4
		or $t4, $t2, $t4 #$t4 = (str[i] == 'a' || str[i] == 'i' || str[i] == 'u' || str[i] == 'e')
		seq $t2, $t1, $s5
		or $t4, $t2, $t4 # $t4 = (str[i] == 'a' || str[i] == 'i' || str[i] == 'u' || str[i] == 'e' || str[i] == 'o')
		beqz $t4, update_pointer
		addi $a0, $a0, 1
		
	update_pointer:	
		addi $s0, $s0, 1
		j while_solve
	
print:
	li $v0, 1
	syscall
exit:
	li $v0, 10
	syscall
	