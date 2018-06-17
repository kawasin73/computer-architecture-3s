addi r1, r0, 5
addi r2, r0, 255
addi r3, r1, 2 ; test addi
add r4, r2, r1 ; test add
sub r5, r2, r1 ; test sub
lui r6, 15 ; test lui
and r7, r3, r4 ; test and
andi r8, r5, 15 ;test andi
or r9, r2, r6 ;   test or
ori r10, r6, 15 ; test ori
xor r11, r3, r5 ; test xor
xori r12, r3, 10;test xori
nor r13, r3, r4; test nor
sll r14, r3, 16; test sll
srl r15, r13, 2; test srl
srl r16, r4, 2; test srl
sra r17, r13, 2; test sra
sra r18, r4, 2; test sra
lui r19, 21845
addi r19, r19, 21845; r19 = 32'b01010101010101010101010101010101
sw r19, 0(r0) ; test sw
sh r19, 4(r0) ; test sh
sb r19, 8(r0) ; test sb
lw r20, 0(r0) ; test lw
lh r21, 0(r0) ;  test lh
lb r22, 0(r0) ;  test hb
addi r23, r0, 1 ; r23 will change to 3
addi r24, r0, 2
beq r24, r23, label1 ; not go
label2: addi r23, r23, 1 ; addi twice
beq r24, r23, label2 ; once go to label2
label1: addi r0, r0, 0 ; test beq
addi r25, r0, 2
bne r24, r25, label3 ; not go
addi r25, r0, 0 ; will reset to 0
bne r24, r25, label4 ; should jump
label3: addi r25, r25, 8 ; will not exected
label4: addi r25, r25, 16 ; test bne r25 == 32'b00000000000000000000000000010000
addi r26, r0, 2
blt r24, r26, label5 ; not jump
addi r26, r0, 1 ; change to 1
blt r24, r26, label6 ; should jump
label5: addi r26, r26, 16
label6: addi r26, r26, 32 ; test blt r26 == 32'b00000000000000000000000000100001
addi r27, r0, 2
ble r24, r27, label7 ; should jump
addi r27, r0, 1 ; not executed
label7: addi r27, r27, 16
blt r24, r27, label8 ; not jump
addi r27, r27, 4
label8: addi r27, r27, 32 ; test blt r27 == 32'b00000000000000000000000000110110
addi r28, r0, 3
j label9
addi r28, r28, 16
label9: addi, r28, r28, 32 ; test j  r28 == 32'00000000000000000000000000100011
addi r29, r0, 7
jal label10
addi r29, r29, 16
label10: addi r29, r29, 32 ; test jal r29 == 32'b00000000000000000000000000100111 r31 == 32'b00000000000000000000000000111001
addi r30, r0, 62
jr r30
addi r30, r30, 2
addi r30, r30, 64 ; test jr r30 == 32'b00000000000000000000000001111110
