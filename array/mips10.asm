#Nhập mảng số nguyên từ bàn phím. In ra màn hình số lẻ lớn nhất nhỏ hơn mọi số chẵn trong
#mảng.
.data
	arr: .space 10000
	str1: .asciiz "\nSo le lon nhat thoa man: "
	str2: .asciiz "\nKhong tim thay"
	str3: .asciiz "\nNhap lai: "
.text
input:	li $v0, 5
	syscall
	add $s0, $v0, $zero # $s0 = n
	nop
excep:#đầu vào n <= 0
	while:	beqz $s0, error_input
		bltz $s0, error_input
		j input_arr
	nop
	
error_input:	#thông báo và nhập lại
	li $v0, 4
	la $a0, str3
	syscall
	j input 
	
input_arr:#nhập phần tử
	li $t0, 0 # $t0 = i = 0
	la $s1, arr # $s1 = địa chỉ cơ sở của arr
	while_input:	beq $t0, $s0, find_min_even
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		li $v0, 5
		syscall
		sw $v0, 0($t2)
		addi $t0, $t0, 1 # i = i + 1
		j while_input
find_min_even:
	li $t0, 0 # $t0 = i = 0
	li $s2, 2
	li $s3, 100000 #coi tương đương 1e9 $s3 = minEven
	while_find:
		beq $t0, $s0, find_max_odd
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		lw $t1, 0($t2) # $t1 = arr[i]
		div $t1, $s2
		mfhi $t3 
		seq $t3, $t3, $zero # $t3 = (arr[i] % 2) == 0
		slt $t4, $t1, $s3 # $t4 = arr[i] < minEven
		and $t5, $t3, $t4
		beqz $t5, update_i
		add $s3, $zero, $t1 # minEven = arr[i]
	update_i:
		addi $t0, $t0, 1
		j while_find	
		
find_max_odd:
	li $s4, -100000 #coi tương đương 1-e9 $s4 = maxOdd
	li $t0, 0 # $t0 = i = 0
	while_solve:
		beq $t0, $s0, print
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		lw $t1, 0($t2) # $t1 = arr[i]
		div $t1, $s2
		mfhi $t3 
		sne $t3, $t3, $zero # $t3 = (arr[i] % 2) != 0
		sgt $t4, $t1, $s4 # $t4 = arr[i] > maxOdd
		and $t5, $t3, $t4
		slt $t6, $t1, $s3 # $t6 = arr[i] < minEven
		and $t7, $t5, $t6
		beqz $t7, update
		add $s4, $zero, $t1 # maxOdd = arr[i]
	update:
		addi $t0, $t0, 1
		j while_solve
		
print:	li $t0, -100000
	beq $s4, $t0, not_find
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 1
	add $a0, $zero, $s4
	syscall
	j exit
not_find:
	li $v0, 4
	la $a0, str2
	syscall
exit:	
	li $v0, 10
	syscall
	
