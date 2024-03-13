         [bits 32]

;        esp -> [ret]   ; ret - adres powrotu do asmloader

a        equ 9

         call getaddr
addr_a:
         dd a  ; define double word
getaddr:

;        esp -> [addr_a][ret]

         mov eax, [esp]    ; eax = *(int*)esp = addr_a

         push dword [eax]  ; *(int*)eax = *(int*)addr_a = a -> stack

;        esp -> [a][addr_a][ret]

         call getaddr2
format:
         db "a = %d", 0xA, 0
getaddr2:

;        esp -> [format][a][addr_a][ret]

         call [ebx+3*4]  ; printf("a = %d\n", a);
         pop eax
         pop eax
         pop eax

;        esp -> [ret]

         push 0          ; esp -> [0][ret]
         call [ebx+0*4]  ; exit(0);