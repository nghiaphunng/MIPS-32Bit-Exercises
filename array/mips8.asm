#Nhập mảng số nguyên từ bàn phím. In ra vị trí và giá trị của phần tử âm lớn nhất trong mảng.
.data
	arr: .space 10000
	str1: .asciiz "\nVi tri: "
	str2: .asciiz "\nGia tri: "
	str3: .asciiz "\nNhap lai: "
	str4: .asciiz"\nKhong co phan tu am"
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
	li $s2, 0 # $s2 = res_value = 0
	li $s3, -1 # $s3 = res_index = -1
	li $s4, -1 #check index 
	while_solve:	beq $t0, $s0, print
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		
		li $v0, 5
		syscall
		sw $v0, 0($t2)
		
		#kiểm tra điều kiện
		slt $t3, $v0, $zero # $t3 = (arr[i] < 0)
		seq $t4, $s3, $s4   # $t4 = (res_index == -1)
		sgt $t5, $v0, $s2   # $t5 = (arr[i] > res_value)
		or $t6, $t4, $t5 # $t6 = (res_index == -1 || arr[i] > res_value)
		and $t7, $t3, $t6
		beqz $t7, update_i
		add $s2, $zero, $v0 # res_value = arr[i]
		add $s3, $zero, $t0 # res_index = i
	update_i:
		addi $t0, $t0, 1
		j while_solve
print:
	beq $s3, $s4, not_find	# res_index == -1
	#in Vị trí: 
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 1
	add $a0, $zero, $s3
	syscall
	#in Giá trị
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	add $a0, $zero, $s2
	syscall
	j exit
not_find:
	li $v0, 4
	la $a0, str4
	syscall
exit:
	li $v0, 10
	syscall