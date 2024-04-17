         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 4
b        equ -2

         mov eax, a  ; eax = a
         mov edx, b  ; edx = b
         
         mul ecx  ; edx:eax = eax*ecx

;        mul arg  ; edx:eax = eax*arg

         push eax

;        esp -> [eax][ret]

         call getaddr  ;  push on the stack the run-time address of format and jump
format:
         db "iloczyn = %d", 0xA, 0
getaddr:

;        esp -> [format][eax][ret]

         call [ebx+3*4]  ; printf(format, eax);
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