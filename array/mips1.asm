.data
	arr: .space 1000
	str1: .asciiz "Nhap lai: "
	str2: .asciiz "\nNhap cac phan tu: "
	str3: .asciiz "\nNhap m va n: "
.text
input:	li $v0, 5
	syscall
	add $s0, $v0, $zero #$s0 = n
#xử lý ngoại lệ: n <= 0
excep:	ble $s0, $zero, error_input
	j input_arr
error_input:	
	li $v0, 4
	la $a0, str1
	syscall
	j input
	
input_arr: #nhập mảng
	li $v0, 4
	la $a0, str2
	syscall
	li $t0, 0 # $t0 = i = 0
	la $s1, arr # $s1 = địa chỉ cơ sở của arr
	while_input:	
		beq $s0, $t0, solve
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		li $v0, 5
		syscall
		sw $v0, 0($t2)
		addi $t0, $t0, 1 # i = i + 1
		j while_input
	
solve:	
	#nhập m, n
	li $v0, 4
	la $a0, str3
	syscall
	li $v0, 5
	syscall
	add $s2, $v0, $zero # $s2 = m
	li $v0, 5
	syscall
	add $s3, $v0, $zero # $s3 = n
	#duyệt mảng arr
	li $t0, 0 # $t0 = i = 0
	li $s4, 0 # $s4 = cnt
	while:	
		beq $s0, $t0, print
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		lw $t1, 0($t2) # $t1 = str[i]
		sge $t3, $t1, $s2
		sle $t4, $t1, $s3
		and $t5, $t3, $t4 # $t5 = (arr[i] >= m && arr[i] <= n)
		beqz $t5, update_i
		addi $s4, $s4, 1
	update_i:	
		addi $t0, $t0, 1
		j while
		
print:
	li $v0, 1
	add $a0, $s4, $zero
	syscall
exit:
	li $v0, 10
	syscall