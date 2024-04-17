        [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

x        equ 20
a        equ 5
b        equ 19

         mov eax, x    ; eax = x
         mov edx, a    ; edx = a
         mov ecx, b    ; ecx = b

         push ecx  ; ecx -> stack
         push edx  ; edx -> stack
         push eax  ; eax -> stack

;        esp -> [eax][edx][ecx][ret]

         cmp eax, b     ; eax - b                  ; OF SF ZF AF PF CF affected
         jg nienalezy  ; jump if greater ; jump if SF == OF or ZF = 1
         cmp eax, a  ; eax - a
         jl nienalezy  ; jump if lesser

         call getaddr2 ; push on the stack the runtime address of format and jump to getaddr2
format:
         db '%d nalezy do [%d, %d]', 0xA, 0

nienalezy:
          call getaddr2 ; push on the stack the runtime address of format and jump to getaddr2
format2:
          db '%d nie nalezy do [%d, %d]', 0xA, 0

getaddr2:

;        esp -> [format1/2][eax][edx][ecx][ret]

         call [ebx+3*4]  ; printf(format, eax, edx, ecx);
         add esp, 4*4    ; esp = esp + 8

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