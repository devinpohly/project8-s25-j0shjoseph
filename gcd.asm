
MOVI 180 R0
MOVI 18 R1     
MOVI 24 R2     

MOVI loop R10        
MOVI end R11         
MOVI loop_body R12   
MOVI gcd R13         
MOVI recurse R14     
MOVI return R15      
MOVI mod_loop R9 
MOVI mod_loop R20
MOVI mod_continue R21
MOVI mod_done R22

loop:
    MOV R1 R7   
    SUB R2 R7     
    JNZ R7 R12 
    JMP R11
    
loop_body:
    MOV R0 R3
    MOV R1 R4

    PUSH R3
    PUSH R4
    JAL R13
    POP R4
    POP R3

    MOV R1 R6     
    OUT R6

    MOVI 1 R7
    ADD R7 R1       

    JMP R10

end:
    HALT


gcd:
    PUSH R30
    MOV R31 R30      

    LDLO -1 R4       
    LDLO -2 R3       

    
    MOV R4 R6
    JNZ R6 R14   

    
    MOV R3 R1        
    JMP R15

recurse:
    
    MOV R3 R5
mod_loop:
    MOV R5 R6       
    SUB R4 R6        
    JNZ R6 R12
    JMP R22

mod_continue:
    MOV R6 R5       
    JMP R20
mod_done:

    PUSH R4          
    PUSH R5
    JAL R13
    POP R5
    POP R4

return:
    MOV R30 R31
    POP R30
    RET
    