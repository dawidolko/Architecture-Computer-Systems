         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 5
b        equ 6

         push b
         push a  ; *(int*)(esp-4) = a ; esp = esp - 4

;        esp -> [a][b][ret]

         call getaddr
format:
         db "a = %d", 0xA, "b = %d", 0
getaddr:

;        esp -> [format][a][b][ret]

         call [ebx+3*4]
         add esp, 3*4

;        esp -> [ret]

         push 0          ; esp -> [0][ret]
         call [ebx+0*4]