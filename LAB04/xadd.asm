         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 3
b        equ 5

         mov ebp, ebx  ; ebp = ebx ; store ebx

         mov eax, a  ; eax = a
         mov ebx, b  ; ebx = b
         
         push ebx  ; ebx -> stack
         push eax  ; eax -> stack

;         esp -> [eax][ebx][ret]


         call getaddr  ; push on the stack the run time address of format and jump getaddr
format:
         db "(eax, ebx) = (%d, %d)", 0xA, 0
getaddr:

;        esp -> [format][eax][ebx][ret]

         call [ebp+3*4]  ; printf(format, eax, ebx);
         add esp, 3*4    ; esp = esp + 12

;        esp -> [ret]

         mov eax, a  ; eax = a
         mov ebx, b  ; ebx = b
         
         xadd eax, ebx  ; (eax, ebx) = (eax + ebx, eax)
         
         push ebx  ; ebx -> stack
         push eax  ; eax -> stack

;        esp -> [eax][ebx][ret]

         call getaddr2  ; push on the stack the run time address of format2 and jump getaddr
format2:
         db "(eax, ebx) = (%d, %d)", 0xA, 0
getaddr2:

;        esp -> [format2][eax][ebx][ret]

         call [ebp+3*4]  ; printf(format2, eax, ebx);
         add esp, 3*4    ; esp = esp + 12

;        esp -> [ret]

         push 0          ; esp -> [00 00 00 00][ret]
         call [ebp+0*4]  ; exit(0);

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

Tablica API

ebx    -> [ ][ ][ ][ ] -> exit
ebx+4  -> [ ][ ][ ][ ] -> putchar
ebx+8  -> [ ][ ][ ][ ] -> getchar
ebx+12 -> [ ][ ][ ][ ] -> printf
ebx+16 -> [ ][ ][ ][ ] -> scanf

%endif
