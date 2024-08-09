#Nhập mảng số nguyên từ bàn phím. Sắp xếp các phần tử có giá trị dương tăng dần (các phần tử
#khác giữ nguyên vị trí)
.data 
	arr: .space 1000
	str: .asciiz " "
	str1: .asciiz "Nhap lai: "
.text
init:	la $s1, arr #$s1 = địa chỉ cơ sở của mảng
	li $v0, 5
	syscall
	add $s0, $v0, $zero # $s0 = n
	li $t0, 0 #$t0 = i = 0
#xử lý ngoại lệ: n <= 0
excep:	ble $s0, $zero, error_input
	j input
error_input:	
	li $v0, 4
	la $a0, str1
	syscall
	j init
	
input:  beq $t0, $s0, solve
	#tính địa chỉ của phần tử arr[i]
	sll $t1, $t0, 2
	add $t2, $s1, $t1
        li $v0, 5
	syscall
	sw $v0, 0($t2)
	#i = i + 1
	addi $t0, $t0, 1
	j input
solve:
	add $t0, $zero, $zero # $t0 = i = 0
for_ngoai:	beq $t0, $s0, finish
		#so sánh arr[i] <= 0 
		sll $t1, $t0, 2
		add $t2, $s1, $t1
		lw $t1, 0($t2) # $t1 = arr[i]
		bltz $t1, update_i
		
		#khởi tạo vòng lặp con 
		addi $t3, $t0, 1 # $t3 = j = i + 1
for_trong: 	beq $t3, $s0, update_i #đảm bảo j < n 
		#so sánh arr[j] > 0 
		sll $t4, $t3, 2
		add $t5, $s1, $t4
		lw $t4, 0($t5) # $t4 = arr[j]
		sgt $s2, $t4, $zero
		sgt $s3, $t1, $t4
		and $s4, $s2, $s3 #kiểm tra arr[j] > 0 && arr[i] > arr[j]
		bne $s4, 1, update_j
		#thực hiện hoán đổi 
		#arr[i] = arr[j]
		sw $t4, 0($t2)
		#arr[j] = arr[i]
		sw $t1, 0($t5)
update_j:	addi $t3, $t3, 1
		j for_trong		 
	 
update_i:	add $t0, $t0, 1 
		j for_ngoai


finish: add $t0, $zero, $zero	
	print:	beq $t0, $s0, exit
		#tính địa chỉ của phần tử arr[i]
		sll $t1, $t0, 2
		add $t2, $s1, $t1
		lw $a0, 0($t2)
		li $v0, 1
		syscall
		
		li $v0, 4
		la $a0, str
		syscall 
		#i = i + 1
		addi $t0, $t0, 1
		j print

exit: 	li $v0, 10
	syscall
