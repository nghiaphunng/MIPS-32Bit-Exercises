.data
    str: .space 100
    freq: .space 1024 #freq[256] int

.text
init:
    la $s1, freq
    li $v0, 8
    la $a0, str
    li $a1, 100
    syscall
    jal solve
    nop

exit:
    li $v0, 10
    syscall
solve: 
	la $s0, str #con trỏ chạy trong chuỗi str
	la $s1, freq #địa chỉ cơ sở của freq
	li $s2, 0 #kết quả $s2 = max_freq
	
	loop:	lb $t1, 0($s0) #$t1 = str[i]
    		beq $t1, $zero, return  # thoát nếu kí tự null
    		
    		#địa chỉ của phần tử freq[str[i]]
    		sll $t2, $t1, 2 #$t2 = 4 * $t1 
    		add $t2, $t2, $s1 
    		lw $t3, 0($t2)	#$t2 = đọa chỉ của freq[str[i]]
    		addi $t3, $t3, 1 #cập nhật tuấn suất của kí tự str[i]
    		sw $t3, 0($t2)
    		bge $s2, $t3, update_pointer 
    		add $s2, $t3, $zero
    		add $s3, $s0, $zero #địa chỉ kí tự nhiều nhất hiện tại vào $s3 
    	update_pointer:	#cập nhật con trỏ chạy 	
    		addi $s0, $s0, 1
    		j loop
    	return: 
    		li $v0, 11
    		lb $a0, 0($s3)
    		syscall
    		jr $ra

		
