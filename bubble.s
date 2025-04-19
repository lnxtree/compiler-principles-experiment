        .text
        .align  1
        .globl  bubblesort
        .type   bubblesort, @function
bubblesort:
        addi    sp, sp, -64
        sd      s0, 56(sp)
        sd      s1, 48(sp)
        # mv      s10, s0
        # mv      s11, s1
        mv      s0, a0 # s0 = arr
        mv      s1, a1 # s1 = n

        addi    t0, zero, 0 # i = 0
        addi    s1, s1, -1

outer_loop:
        ble     s1, t0, end # if i >= n - 1; exit

        addi    t1, zero, 0 # j = 0
inner_loop:
        addi    t2, s1, -1
        sub     t2, t2, t0 # n - j - 2

        blt     t2, t1, outer_continue # if j >= n - i - 1: continue outer

        slli    t3, t1, 2
        add     t4, s0, t3
        lw      t5, 0(t4)
        lw      t6, 4(t4)

        ble     t5, t6, skip_swap

        sw      t6, 0(t4)
        sw      t5, 4(t4)

skip_swap:
        addi    t1, t1, 1
        j       inner_loop

outer_continue:
        addi    t0, t0, 1
        j       outer_loop

end:
        # mv      s0, s10
        # mv      s1, s11
        ld      s0, 56(sp)
        ld      s1, 48(sp)
        addi    sp, sp, 64

        li      a0,0
        ret
        .size   bubblesort, .-bubblesort
