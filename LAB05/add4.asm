        [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

%define  UINT_MAX 4294967295

a        equ 4294967295
b        equ 1

;        edi:esi
;        edx:eax +
;        ---------
;        edx;eax

;          0:esi
;          0:eax +
;        ---------
;        edx;eax

         mov esi, a  ; esi = a
         mov eax, b  ; eax = b

         add eax, esi  ; eax = eax + esi
         
         mov edx, 0  ; edx = 0
         adc edx, 0  ; edx = 0

         push edx  ; edx -> stack
         push eax  ; eax -> stack

;        esp -> [eax][edx][ret]

         call getaddr
format:
         db "suma = %llu", 0xA, 0
getaddr:

;        esp -> [format][eax][edx][ret]

         call [ebx+3*4]  ; printf(format, edx:eax);
         add esp, 3*4    ; esp = esp + 12

;        esp -> [ret]

         push 0          ; esp -> [00 00 00 00][ret]
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