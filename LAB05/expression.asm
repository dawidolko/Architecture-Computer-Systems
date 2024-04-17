       [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 4
b        equ 5
c        equ 6

;        exp = a+b*c = 4+5*6 = 34

;        mul arg  ; edx:eax = eax*arg

         mov eax, b  ; eax = b
         mov ecx, c  ; ecx = c

         mul ecx  ; edx:eax - eax*ecx = b*c

         mov ecx, a  ; ecx = a

         add eax, ecx  ; eax = eax + ecx

         push eax  ; eax -> stack

;        esp -> [eax][ret]

         call getaddr ; push on the stack the runtime address of format and jump to getaddr
format:
         db "a + b*c = %u", 0xA, 0
getaddr:

;        esp -> [format][eax][ret]

         call [ebx+3*4]  ; printf(format, eax);
         add esp, 2*4    ; esp = esp + 8

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

%ifdef COMMENT

ebx    -> [ ][ ][ ][ ] -> exit
ebx+4  -> [ ][ ][ ][ ] -> putchar
ebx+8  -> [ ][ ][ ][ ] -> getchar
ebx+12 -> [ ][ ][ ][ ] -> printf
ebx+16 -> [ ][ ][ ][ ] -> scanf

%endif