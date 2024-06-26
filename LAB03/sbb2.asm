         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 5
b        equ 5

         mov eax, a  ; eax = a

         clc           ; CF = 0
         sbb eax, b  ; eax = eax + ecx + CF

         push eax

;        esp -> [eax][ret]

         call getaddr
format:
         db "roznica1 = %d", 0xA, 0
getaddr:

;        esp -> [format][eax][ret]

         call [ebx+3*4]  ; printf("suma1 = %d\n", eax);
         add esp, 2*4    ; esp = esp + 8

;        esp -> [ret]

         mov eax, a  ; eax = a

         stc           ; CF = 1
         sbb eax, b  ; eax = eax + ecx + CF

         push eax

;        esp -> [eax][ret]

         call getaddr2
format2:
         db "roznica2 = %d", 0xA, 0
getaddr2:

;        esp -> [format2][eax][ret]

         call [ebx+3*4]  ; printf("wynik2 = %d\n", eax);
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
; To co funkcja zwr�ci jest w EAX.
; Po wywolaniu funkcji sciagamy argumenty ze stosu.
;
; https://gynvael.coldwind.pl/?id=387