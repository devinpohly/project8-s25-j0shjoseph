MOVI 100 R31
MOV  R31 R30
MOVI 180 R0
MOVI 18  R1
MOVI start R8
MOVI end R9
MOVI process R10
MOVI gcd R12
MOVI rec R13
MOVI return R14

start:
    MOV  R1     R15
    MOVI 25     R6
    SUB  R15    R6
    JNZ  R16    R10
    JMP  R9

process:
    MOV  R0     R3
    MOV  R1     R4
    PUSH R3
    PUSH R4
    JAL  R12
    POP  R4
    POP  R3
    OUT  R1
    MOVI 1      R5
    ADD  R5     R1
    JMP  R8

gcd:
    PUSH R30
    MOV  R31    R30
    LDLO -2     R3
    LDLO -1     R4
    MOV  R4     R5
    JNZ  R5     R13
    MOV  R3     R1
    JMP  R14

rec:
    MOV  R3     R5
    IDIV R4     R5
    MUL  R4     R5
    MOV  R3     R6
    SUB  R5     R6
    PUSH R4
    PUSH R6
    JAL  R12
    POP  R6
    POP  R4
    JMP  R14

return:
    MOV  R30    R31
    POP  R30
    RET

end:
    HALT
