.data
	arr: .space 10000
	str1: .asciiz "\nTong chan: "
	str2: .asciiz "\nTong duong: "
	str3: .asciiz "\nNhap lai: "
.text
input:	li $v0, 5
	syscall
	add $s0, $v0, $zero # $s0 = n
	nop
excep:#đầu vào n <= 0
	while:	beqz $s0, error_input
		bltz $s0, error_input
		j solve 
	nop
	
error_input:	#thông báo và nhập lại
	li $v0, 4
	la $a0, str3
	syscall
	j input 

solve:	#nhập phần tử
	li $t0, 0 # $t0 = i = 0
	la $s1, arr # $s1 = địa chỉ cơ sở của arr
	li $s2, 0 # $s2 = tổng chẵn
	li $s3, 0 # $s3 = tổng dương
	li $s4, 2
	while_solve:	beq $t0, $s0, print
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		
		li $v0, 5
		syscall
		sw $v0, 0($t2)
		
		#kiểm tra điều kiện
		div $v0, $s4 #kiểm tra arr[i] % 2
		mfhi $t3 # $t3 = arr[i] % 2
		bnez $t3, check_pos
		add $s2, $s2, $v0
	check_pos: #kiểm tra phần tử dương	
		blez $v0, update_i #kiểm tra arr[i] > 0
		add $s3, $s3, $v0
	update_i:
		addi $t0, $t0, 1
		j while_solve

print:	
	#in tổng dương
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	add $a0, $zero, $s3
	syscall
	#in tổng chẵn
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 1
	add $a0, $zero, $s2
	syscall

exit:
	li $v0, 10
	syscall
