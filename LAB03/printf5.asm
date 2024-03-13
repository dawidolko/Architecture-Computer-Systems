         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 3
b        equ 7

         mov eax, a  ; eax = a
         mov edx, b

;        esp -> [ret]

         call print
addr:

;        esp -> [ret]

         push 0          ; esp -> [0][ret]
         call [ebx+0*4]  ; exit(0);

print:

;        esp -> [addr][ret]

         push edx
         push eax


;        esp -> [eax][edx][addr][ret]

         call getaddr
format:
         db "a = %d", 0xA, "b = %d", 0
getaddr:

;        esp -> [format][eax][edx][addr][ret]

         call [ebx+3*4]  ; printf("a = %d\n", eax);
         add esp, 2*4    ; esp = esp + 8

;        esp -> [addr][ret]

         ret