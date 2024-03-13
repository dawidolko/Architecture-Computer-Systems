         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 5

         push a  ; *(int*)(esp-4) = a ; esp = esp - 4

;        esp -> [a][ret]

         call getaddr  ; push on the stack the run-time address of format and jump to getaddr
format:
         db "a = %d", 0xA, 0
getaddr:

;        esp -> [format][a][ret]

         call [ebx+3*4]  ; printf("a = %d\n", a);
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