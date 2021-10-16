.data
arr: .word 3, 0, 1
len: .word 3
str: .string "The missing number is "

.text
# s1 = arr base address
# t0 = i
# t1 = nums[i]
# s2 = sum
# s3 = numsSize

main:
    la s1, arr        # s1 = pointer to nums[0]
    lw s2, len        # s2 = sum
    lw s3, len        # s3 = numsSize
    add t0, x0, x0    # i = 0
    jal ra, loop      # jump to foor loop
    jal ra, print     # jump to foor loop
    li a7, 10         # end program
    ecall
        
loop:
    add s2, s2, t0    # sum += i
    lw t1, 0(s1)      # t1 = nums[i]
    addi s1, s1, 4    # nums++ (address move forward)
    sub s2, s2, t1    # sum -= nums[i]
    addi t0, t0, 1    # i++
    blt t0, s3, loop  # if i < array length
    jr ra             # else, return to main

print:
    la a0, str        # load string
    li a7, 4          # print string
    ecall
    add a0, s2, x0    # load result
    li a7, 1          # print integer
    ecall
    jr ra             # go back to main