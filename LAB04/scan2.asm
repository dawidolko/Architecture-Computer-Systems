        [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

extern   _printf
extern   _scanf
extern   _exit

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

;        esp -> [a][ret]

         push esp

;        esp -> [addr_a][a][ret]

         push format2
         
;        esp -> [format2][addr_a][a][ret]

         call _scanf

         add esp, 2*4
         
;        esp -> [a][ret]

         push format3
         
;        esp -> [format3][a][ret]

         call _printf
         
         add esp, 2*4
         
         push 0
         
         call _exit

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

%ifdef COMMENT

ebx    -> [ ][ ][ ][ ] -> exit
ebx+4  -> [ ][ ][ ][ ] -> putchar
ebx+8  -> [ ][ ][ ][ ] -> getchar
ebx+12 -> [ ][ ][ ][ ] -> printf
ebx+16 -> [ ][ ][ ][ ] -> scanf

%endif