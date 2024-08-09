#Nhập mảng số nguyên từ bàn phím. In ra cặp phần tử liền kề có tích lớn nhất.
.data
	arr: .space 1000
	str1: .asciiz "Nhap lai: "
	str2: .asciiz "Nhap cac phan tu: "
	str3: .asciiz "\nKet qua: "
	str4: .asciiz " va " 
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

solve:	addi $s0, $s0, -1 # n -= 1
	li $t0, 0 # $t0 = i = 0
	li $s2, -100 # $s2 = res
	li $s3, 0 # $s3 = res_index
	while:
		beq $s0, $t0, print
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t2, $t1, $s1 # $t2 = địa chỉ của arr[i]
		lw $t4, 0($t2) # $t4 = arr[i] 
		lw $t5, 4($t2) # $t5 = arr[i+1]
		mult  $t4, $t5 
		mflo $t6 # $t6 = $t4 * $t5 = d
		ble $t6, $s2, update_i
		#d > res
		add $s2, $zero, $t6 # res = d;
		add $s3, $zero, $t0 # res_index = i
	update_i:
		addi $t0, $t0, 1 # i+= 1
		j while
print:
	li $v0, 4
	la $a0, str3
	syscall	
	li $v0, 1
	sll $t0, $s3, 2 #$t0 = 4 * i
	add $t0, $t0, $s1 #$t0 = địa chỉ arr[i]
	lw $a0, 0($t0)
	syscall
	li $v0, 4
	la $a0, str4
	syscall
	li $v0, 1
	lw $a0, 4($t0)
	syscall
exit: li $v0, 10
	syscall