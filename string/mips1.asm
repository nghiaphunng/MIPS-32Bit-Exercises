#Nhập vào một xâu ký tự, kiểm tra đó có phải là một xâu đối xứng hay không?
#Ví dụ: “abc121cba” là một xâu đối xứng
.data
	str: .space 10000
	str1: .asciiz "Doi xung"
	str2: .asciiz "Khong doi xung"
.text
input:	li $v0, 8
	la $a0, str # $a0 = địa chỉ cơ sở của str
	li $a1, 1000
	syscall
strlen:	li $s0, 0 # $s0 = độ dài chuỗi = strlen(str)
	add $t0, $a0, $zero # $t0 = con trỏ chạy của str
	lb $t1, ($t0)
	while:	beq $t1, $zero, count_finish
		addi $t0, $t0, 1 # cập nhật con trỏ chạy
		addi $s0, $s0, 1 #cập nhất biến đếm kí tự
		lb $t1, ($t0)
		j while
count_finish:	addi $s0, $s0, -1 # bỏ kí tự xuống dòng khi nhập chuỗi
solve:	li $s1, 1 # $s1 = check = 1 (giả sử ban đầu là đối xứng)
	li $s2, 2
	div $s0, $s2
	mflo $s2 # $s2 = $s0/2 = strlen(Str)/2
	li $t0, 0 # $t0 = i 
	while_solve: 	beq $t0, $s2, finish
		#tính str[strlen(str) - i - 1]
		sub $t1, $s0, $t0
		addi $t1, $t1, -1
		add $t2, $t1, $a0
		lb $t2, 0($t2) # $t2 = str[strlen(str) - i - 1]
		add $t3, $t0, $a0
		lb $t3, 0($t3) # $t3 = str[i]
		beq $t2, $t3, update_i
		li $s1, 0
		j finish
	update_i: 	addi $t0, $t0, 1
		j while_solve
finish:
	beqz $s1, print_str2
	#thỏa mãn -> in str1
	li $v0, 4
	la $a0, str1
	syscall
	j exit
print_str2: 	li $v0, 4
		la $a0, str2
		syscall
exit:   li $v0, 10
	syscall