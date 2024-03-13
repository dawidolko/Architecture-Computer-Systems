         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 2
b        equ 11

         mov eax, a  ; eax = a

;        esp -> [ret]

         call getaddr
addr_b:
         dd b  ; define double word
getaddr:

;        esp -> [addr_b][ret]

         mov edx, [esp]    ; eax = *(int*)esp = addr_b

         push dword [edx]  ; *(int*)eax = *(int*)addr_a = a -> stack

;        esp -> [b][addr_b][ret]

         sub eax, [esp]
         
         push eax

         call wypisz
format:
         db "roznica = %d", 0xA, 0
wypisz:

;        esp -> [format][eax][ret]

         call [ebx+3*4]  ; printf("suma = %d\n", eax);
         add esp, 2*4    ; esp = esp + 8

;        esp -> [ret]

         push 0          ; esp -> [0][ret]
         call [ebx+0*4]  ; exit(0);

; asmloader API
;
; ESP wskazuje na prawidlowy stos
; argumenty funkcji wrzucamy na stos
; EBX zawiera pointer na tablice API
;
; call [ebx + NR_FUNKCJI*4] ; wywolanie funkcji API
;
; NR_FUNKCJI:
;
; 0 - exit
; 1 - putchar
; 2 - getchar
; 3 - printf
; 4 - scanf
;
; To co funkcja zwróci jest w EAX.
; Po wywolaniu funkcji sciagamy argumenty ze stosu.
;
; https://gynvael.coldwind.pl/?id=387