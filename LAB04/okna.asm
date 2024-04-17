    [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ 5
b        equ 19

c        equ 12
d        equ 24

x        equ 25

         mov eax, x    ; eax = x

         cmp eax, b    ; eax - b          ; OF SF ZF AF PF CF affected
         jg nieNalezy1  ; jump if greater  ; jump if SF == OF and ZF = 0

         cmp eax, a    ; eax - a          ; OF SF ZF AF PF CF affected
         jl nieNalezy1  ; jump if less     ; jump if SF != OF1

         jmp sprawdz2

nieNalezy1:
         cmp eax, d    ; eax - b          ; OF SF ZF AF PF CF affected
         jg nieNalezyDoObydwu  ; jump if greater  ; jump if SF == OF and ZF = 0

         cmp eax, c    ; eax - a          ; OF SF ZF AF PF CF affected
         jl nieNalezyDoObydwu  ; jump if less     ; jump if SF != OF1s

         push d    ; b -> stack
         push c    ; a -> stack
         push eax  ; eax -> stack
         push b    ; b -> stack
         push a    ; a -> stack
         push eax  ; eax -> stack
;        esp -> [b][a][eax][ret]

         call getaddr ; push on the stack the runtime address of format and jump to getaddr
format:
         db '%d nalezy do  (%d,%d)', 0xA,
         db '%d nie nalezy do  (%d,%d)', 0xA, 0

sprawdz2:
         cmp eax, d    ; eax - b          ; OF SF ZF AF PF CF affected
         jg nieNalezyDoObydwu  ; jump if greater  ; jump if SF == OF and ZF = 0

         cmp eax, c    ; eax - a          ; OF SF ZF AF PF CF affected
         jl nieNalezyDoObydwu  ; jump if less     ; jump if SF != OF1

         jmp nalezyDoObu

nieNalezy2:
         cmp eax, b    ; eax - b          ; OF SF ZF AF PF CF affected
         jg nieNalezy1  ; jump if greater  ; jump if SF == OF and ZF = 0

         cmp eax, a    ; eax - a          ; OF SF ZF AF PF CF affected
         jl nieNalezy1  ; jump if less     ; jump if SF != OF1

         push d    ; b -> stack
         push c    ; a -> stack
         push eax  ; eax -> stack
         push b    ; b -> stack
         push a    ; a -> stack
         push eax  ; eax -> stack

;        esp -> [b][a][eax][ret]

         call getaddr ; push on the stack the runtime address of format and jump to getaddr
format2:
         db '%d nalezy do  (%d,%d)', 0xA,
         db '%d nie nalezy do  (%d,%d)', 0xA, 0

nalezyDoObu:
        push d    ; b -> stack
        push c    ; a -> stack
        push b    ; b -> stack
        push a    ; a -> stack
        push eax  ; eax -> stack
;       esp -> [b][a][eax][ret]

        call getaddr
format3:
         db '%d nalezy do (%d,%d) i (%d,%d)', 0xA, 0
         
nieNalezyDoObydwu:
        push d    ; b -> stack
        push c    ; a -> stack
        push b    ; b -> stack
        push a    ; a -> stack
        push eax  ; eax -> stack
;       esp -> [b][a][eax][ret]

        call getaddr
format4:
         db '%d nie nalezy do (%d,%d) i (%d,%d)', 0xA, 0

getaddr:

;        esp -> [format][eax][edx][ret]

         call [ebx+3*4]  ; printf(format, eax, edx);
         add esp, 3*4    ; esp = esp + 12

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