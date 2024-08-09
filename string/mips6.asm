#Nhập vào xâu ký tự và ký tự C. In ra số lần xuất hiện ký tự C trong xâu (không phân biệt chữ hoa
#hay chữ thường).
.data
	str: .space 1000
	str1: .asciiz "Nhap chuoi: "
	str2: .asciiz "Nhap ki tu: "
	str3: .asciiz "\n"
.text
input:	#nhập chuỗi
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 8
	la $a0, str
	li $a1, 1000
	syscall
	add $s0, $zero, $a0 # $s0 = địa chỉ cơ sở của str
	#nhập kí tự 
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 12
	syscall
	add $s1, $zero, $v0 # $s1 = kí tự c
	nop
solve:	
	init:	li $s3, 65
		li $s4, 90
		li $s5, 10 # kí tự xuống dòng
		
	lower_char:
		sge $t0, $s1, $s3
		sle $t1, $s1, $s4
		and $t2, $t0, $t1 # $t2 = (65 <= c && c <= 90)
		beqz $t2, upper_char
		add $s2, $s1, 32 # $s2 = c_ (in thường của c)
		j count
	upper_char:	
		li $s3, 97
		li $s4, 122
		sge $t0, $s1, $s3
		sle $t1, $s1, $s4
		and $t2, $t0, $t1 # $t2 = (97 <= c && c <= 122)
		beqz $t2, count
		add $s2, $s1, -32 # $s2 = c_ (in hoa của c)
	count:	li $t0, 0 # $t0 = cnt = 0
		add $t1, $s0, $zero # $t1 là con trỏ chạy của str
		while:
			lb $t2, 0($t1) # $t2 = str[i]
			beq $t2, $s5, print
			seq $t3, $s1, $t2
			seq $t4, $s2, $t2
			or $t5, $t3, $t4 # $t5 = (str[i] == c || str[i] == c_)
			beqz $t5, update_pointer
			addi $t0, $t0, 1
		update_pointer:
			addi $t1, $t1, 1
			j while
print:		
	li $v0, 4
	la $a0, str3
	syscall
	li $v0, 1
	add $a0, $zero, $t0
	syscall
exit:
	li $v0, 10
	syscall	