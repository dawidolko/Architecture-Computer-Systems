        [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

extern   _printf
extern   _scanf
extern   _exit

section .bss
        a resd 1 ; zmienna jedynie zainicjaizowana

section .data

format1 db "a = ", 0
format2 db "%d", 0
format3 db "a = %d", 0xA, 0

section .text


global _main

_main:

         push format1
         
;        esp -> [format1][ret]

         call _printf ; printf("a = ")
         
         add esp, 1*4

;        esp -> [ret]

         push dword a

;        esp -> [addr_a][ret]

         push format2
         
;        esp -> [format2][addr_a][ret]

         call _scanf

         add esp, 2*4
         
;        esp -> [ret]

         push dword [a]

         push format3
         
;        esp -> [format3][a][ret]

         call _printf
         
         add esp, 2*4
         
;        esp -> [ret]

         push 0
         
         call _exit


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

%ifdef COMMENT

ebx    -> [ ][ ][ ][ ] -> exit
ebx+4  -> [ ][ ][ ][ ] -> putchar
ebx+8  -> [ ][ ][ ][ ] -> getchar
ebx+12 -> [ ][ ][ ][ ] -> printf
ebx+16 -> [ ][ ][ ][ ] -> scanf

%endif
