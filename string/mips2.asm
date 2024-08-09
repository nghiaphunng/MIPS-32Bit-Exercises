.data
str: .space 100 # str[100]
freq: .space 1024 # freq[256] = {0}

.text
main:
# Nhập chuỗi từ người dùng
    li $v0, 8
    la $a0, str
    li $a1, 100
    syscall

    jal solve

exit:
    li $v0, 10
    syscall

solve:
    la $s0, str # con trỏ chạy
    la $s1, freq
loop_while:
    lb $t0, 0($s0) # $t0 = str[i]
    beq $t0, $zero, return # thoát nếu kí tự null

    # Tính địa chỉ của phần tử freq[str[i]]
    sll $t2, $t0, 2
    add $t2, $s1, $t2 # địa chỉ tại freq cho kí tự này
    lw $t1, 0($t2) # $t1 = freq[str[i]]

    bnez $t1, update_pointer # kiểm tra freq[str[i]] đã cập nhật chưa
    # khi freq[str[i]] = 0
    li $v0, 11
    move $a0, $t0 # Sử dụng kí tự từ $t0
    syscall

    li $t1, 1

    sw $t1, 0($t2) # freq[str[i]] = 1

update_pointer:
    addi $s0, $s0, 1 #cập nhật con trỏ chạy
    j loop_while

return:
    jr $ra
