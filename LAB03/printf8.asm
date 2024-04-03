[bits 32]

;        esp -> [ret]    ; ret - adres powrotu do asmloader
 
a        equ -4
 
         call getaddr
addr_a:
         dd a  ; [][][][]  ; define double word
getaddr:
 
;        esp -> [addr_a][ret]
 
         mov eax, [esp]    ; eax = *(int*)addr_a = a -> stack
         push dword [eax]  ; *(int*)eax = *(int*)addr_a = a -> stack
 
;        esp -> [a][addr_a][ret]
 
         call getaddr2      ; push on the stack the run time address of format and jump
format:
         db "a = %d", 0xA, 0
getaddr2:
 
;        esp -> [format][a][addr_a][ret]
 
         call [ebx+3*4]  ; printf(format, a);
         add esp, 3*4    ; esp = esp + 12
 
;        esp -> [ret]
 
         push 0          ; esp -> [00 00 00 00][ret]
         call [ebx+0*4]  ; exit(0);
