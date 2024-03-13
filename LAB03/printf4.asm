         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 3

         mov eax, a  ; eax = a

;        esp -> [ret]

         call print  ; fastcall
addr:                ; return address

;        esp -> [ret]

         push 0          ; esp -> [0][ret]
         call [ebx+0*4]  ; exit(0);

print:

;        esp -> [addr][ret]

         push eax

;        esp -> [eax][addr][ret]

         call getaddr
format:
         db "a = %d", 0xA, 0
getaddr:

;        esp -> [format][eax][addr][ret]

         call [ebx+3*4]  ; printf("a = %d\n", eax);
         add esp, 2*4    ; esp = esp + 8

;        esp -> [addr][ret]

         ret

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