#Một số gọi là số may mắn nếu tổng các chữ số ở nửa bên trái bẳng tổng các chữ số ở nửa còn lại
#bên phải. Nhập một số nguyên dương N từ bàn phím, kiểm tra số đó có phải là số may mắn không.
#Ví dụ: Nhập N= 1230 có 1 + 2 = 3 + 0 => là số may mắn
#Nhập N= 239017 có 2 + 3 + 9 > 0 + 1 + 7 => không phải là số may mắn
.data
	str1: .asciiz "La so may man"
	str2: .asciiz "Khong phai so may man"
.text
input:	li $v0, 5
	syscall 
	add $s0, $v0, $zero # $s0 = N 
init:	add $t0, $s0, $zero #t0 = temp = N
	li $t1, 10 # $t1 = 10
	li $s1, 0 # $s1 = N đảo
	li $s2, 0 # $s2 = cnt = 0
	while:	beqz $t0, solve
		div $t0, $t1
		mfhi $t2 # $t2 = d
		mflo $t0 # $t0 /= 10
		mult  $s1, $t1
		mflo $s1 #$s1 *= 10
		add $s1, $s1, $t2
		addi $s2, $s2, 1
		j while
solve:	
	li $t0, 0 # $t0 = tổng trái
	li $t1, 0 # $t1 = tổng phải
	li $t2, 2 
	div $s2, $t2 
	mflo $t2 # $t2 = i = cnt/2
	li $t3, 0 # $t3 = j = 0
	li $t4, 10
	while_solve:	beq $t3, $t2, finish
			div $s0, $t4
			mfhi $t5
			mflo $s0 # $s0 /= 10
			add $t1, $t1, $t5
			
			div $s1, $t4
			mfhi $t5
			mflo $s1 # $s1 /= 10
			add $t0, $t0, $t5
			
			addi $t3, $t3, 1 # j += 1
			j while_solve
	
finish:	beq $t0, $t1, correct
	li $v0, 4
	la $a0, str2
	syscall
	j exit
correct:li $v0, 4
	la $a0, str1
	syscall	
exit: li $v0, 10
	syscall