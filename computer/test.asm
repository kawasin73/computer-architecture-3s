addi r1, r0, 5
addi r2, r0, 255
addi r3, r1, 2 ; test addi 0 == 32'b0000000000000111
add r4, r2, r1 ; test add  1 == 32'b0000000100000100
sub r5, r2, r1 ; test sub  2 == 32'b0000000011111010
lui r6, 15 ; test lui      3 == 32'b0000111100000000
and r7, r3, r4 ; test and  4 == 32'b0000000000000100
andi r8, r5, 15 ;test andi 5 == 32'b0000000000001010
or r9, r2, r6 ;   test or  6 == 32'b0000111111111111
ori r10, r6, 15 ; test ori 7 == 32'b0000111100001111
xor r11, r3, r5 ; test xor 8 == 32'b0000000011111101
xori r12, r3, 10;test xori 9 == 32'b0000000000001101
nor r13, r3, r4; test nor 10 == 32'b1111111011111000
sll r14, r3, 16; test sll 11 == 32'b0000011100000000
srl r15, r13, 2; test srl 12 == 32'b0011111110111110
srl r16, r4, 2; test srl  13 == 32'b0000000001000001
sra r17, r13, 2; test sra 14 == 32'b1111111110111110
sra r18, r4, 2; test sra  15 == 32'b0000000001000001
sw r3, 0(r0)
sw r4, 1(r0)
sw r5, 2(r0)
sw r6, 3(r0)
sw r7, 4(r0)
sw r8, 5(r0)
sw r9, 6(r0)
sw r10, 7(r0)
sw r11, 8(r0)
sw r12, 9(r0)
sw r13, 10(r0)
sw r14, 11(r0)
sw r15, 12(r0)
sw r16, 13(r0)
sw r17, 14(r0)
sw r18, 15(r0)
addi r19, r0, 12
lw r20, 0(r19) ; test lw 17 == 32'b0011111110111110
lh r21, 0(r19) ; test lh 18 == 32'b0000000010111110
lb r22, 0(r19) ; test hb 19 == 32'b0000000000001110
sw r20, 17(r0)
sw r21, 18(r0)
sw r22, 19(r0)
sw r17, 20(r0) ; test sw 20 == 32'b1111111110111110
sh r17, 21(r0) ; test sh 21 == 32'b0000000010111110
sb r17, 22(r0) ; test sb 22 == 32'b0000000000001110
addi r23, r0, 0
addi r24, r0, 2
beq r23, r4, label1
label2: addi r23, r23, 1
beq r23, r24, label2
label1: sw r23, 24(r0) ; test beq 24 == 32'b0000000000000010
addi r25, r0, 2
bne r25, r24, label3
addi r25, r0, 0
bne r25, r24, label4
label3: addi r25, r0, 15
label4: addi r25, r25, 16
sw r25 25(r0) ; test bne 25 == 32'b0000000000010000
addi r26, r0, 2
blt r26, r24, label5
addi r26, r0, 1
blt r26, r24, label6
label5: addi r26, r26, 16
label6: addi r26, r26, 32
sw r26, 26(r0) ; test blt 26 == 32'b0000000000100001
addi r27, r0, 2
ble r27, r24, label7
addi r27, r0, 1
blt r27, r24, label8
label7: addi r27, r27, 16
label8: addi r27, r27, 32
sw r27, 27(r0) ; test blt 27 == 32'b0000000000110010
addi r28, r0, 3
j label9
addi r28, r28, 16
label9: addi, r28, r28, 32
sw r28, 28(r0) ; test j  28 == 32'b0000000000100011
addi r29, r0, 7
jal label10
addi r29, r29, 16
label10: addi r29, r29, 32
sw r29, 29(r0) ; test jal 29 == 32'b0000000000100111
sw r31, 30(r0) ; test jal 30 == 32'b0000000001001110
addi r30, r0, 85
jr r30
addi r30, r30, 1
sw r30, 31(r0) ; test jr 31 == 32'b0000000001010101
