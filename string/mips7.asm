#Nhập vào xâu ký tự. Đổi các ký tự chữ hoa thành chữ thường và chữ thường thành chữ hoa. Các
#ký tự khác giữ nguyên.
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
solve:	li $s1, 10 # $s1 = kí tự xuống dòng
	li $s2, 65
	li $s3, 90
	li $s4, 97
	li $s5, 122
	add $t0, $s0, $zero # $t0 = con trỏ cơ sở của str
	while:
		lb $t1, 0($t0) # $t1 = str[i]
		beq $t1, $s1, print
		sge $t2, $t1, $s2
		sle $t3, $t1, $s3
		and $t4, $t2, $t3 # $t4 = (str[i] >= 65 && str[i] <= 90)
	lower:	
		beqz $t4, upper
		addi $t1, $t1, 32
		sb $t1, 0($t0)
		j update_pointer
	upper:	
		sge $t2, $t1, $s4
		sle $t3, $t1, $s5
		and $t4, $t2, $t3 # $t4 = (str[i] >= 90 && str[i] <= 122)
		beqz $t4, update_pointer
		addi $t1, $t1, -32
		sb $t1, 0($t0)
	update_pointer:	
		addi $t0, $t0, 1
		j while

print:	
	li $v0, 4
	la $a0, str
	syscall
exit:
	li $v0, 10
	syscall