.data
	str1: .space 1000
	str2: .space 1000
	str3: .asciiz "Giong nhau"
	str4: .asciiz "Khong giong nhau"
.text
#kí tự dấu xuống dòng 
li $s2, 10
input:	li $v0, 8
	la $a0, str1
	li $a1, 1000
	syscall
	add $s0, $a0, $zero #s0 = địa chỉ cơ sở của str1
	li $v0, 8
	la $a0, str2
	li $a1, 1000
	syscall
	add $s1, $a0, $zero #s1 = địa chỉ cơ sở của str2
	nop
tolower:	
	#đối với str1
	add $t0, $s0, $zero # $t0 con trỏ chạy của str1
	li $t5, 65
	li $t6, 90
	li $t7, 32
	#strlen của str1 và str2
	li $s3, 0 # $s3 = strlen(str1)
	li $s4, 0  #  $s4 = strlen(str2)
	while_1: 
		lb $t1, 0($t0) # $t1 = str1[i]
		beq $t1, $s2, next
		sge $t2, $t1, $t5
		sle $t3, $t1, $t6
		and $t4, $t2, $t3 #$t4 = (str1[i] >= 65 && str1[i] <= 90)
		beqz $t4, update_pointer_1
		add $t1, $t1, $t7 # str1[i] = str1[i] + 32
		sb $t1, 0($t0)
	update_pointer_1:	
		addi $t0, $t0, 1
		addi $s3, $s3, 1
		j while_1
	nop
	next:
	add $t0, $s1, $zero # $t0 con trỏ chạy của str2
	while_2:
		lb $t1, 0($t0) # $t1 = str2[i]
		beq $t1, $s2, solve
		sge $t2, $t1, $t5
		sle $t3, $t1, $t6
		and $t4, $t2, $t3 #$t4 = (str1[i] >= 65 && str1[i] <= 90)
		beqz $t4, update_pointer_2
		add $t1, $t1, $t7 # str1[i] = str1[i] + 32
		sb $t1, 0($t0)
	update_pointer_2:	
		addi $t0, $t0, 1
		addi $s4, $s4, 1
		j while_2
solve:	
	#Nếu str1 và str2 khác độ dài 
	bne $s3, $s4, print_str4
	li $t0, 0 # $t0 = i
	while_solve:
		beq $t0, $s3, print_str3
		add $t1, $s0, $t0
		lb $t2, 0($t1) # $t2 = str1[i]
		add $t3, $s1, $t0
		lb $t4, 0($t3) # $t4 = str2[i]
		beq $t2, $t4, update_i
		j print_str4
	update_i:
		addi $t0, $t0, 1
		j while_solve

print_str3:
	li $v0, 4
	la $a0, str3
	syscall
	j exit	
print_str4:
	li $v0, 4
	la $a0, str4
	syscall
exit:	
	li $v0, 10
	syscall	