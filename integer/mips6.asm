#Nhập số nguyên dương N ở hệ cơ số10 từ bàn phím, in ra biểu diễn của N ở hệ cơ số 8
.data 
	arr: .space 1000
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 
solve:	li $s1, 8
	li $t0, 0 # $t0 = cnt = 0
	la $s2, arr # $s2 = địa chỉ cơ sở của arr
	
	while:	beqz $s0, print
		div $s0, $s1 
		mflo $s0
		mfhi $t3
		
		sll $t1, $t0, 2 # $t1 = 4 * $t0
		add $t1, $t1, $s2 # $t1 = địa chỉ của arr[i]
		sw $t3, 0($t1)
		addi $t0, $t0, 1
		j while
print:	addi $t0, $t0, -1
	while_print:	bltz $t0, exit
			sll $t1, $t0, 2 # $t1 = 4 * $t0
			add $t1, $t1, $s2 # $t1 = địa chỉ của arr[i]
			lw $a0, 0($t1)
			li $v0, 1
			syscall
			
			addi $t0, $t0, -1
			j while_print
exit: 	li $v0, 10
	syscall	