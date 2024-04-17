     [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

a        equ -65535
b        equ 2

         mov eax, a  ; eax = a
         mov edx, b  ; edx = b

         mul edx  ; edx:eax = eax*edx

;        mul arg  ; edx:eax = eax*arg
         
         push edx  ; edx -> stack
         push eax  ; eax -> stack

;        esp -> [eax][edx][ret]

         call getaddr  ; push on the stack the runtime address of format and jump to getaddr
format:
         db 'iloczyn = %d', 0xA, 0
getaddr:

;        esp -> [format][eax][edx][ret]

         call [ebx+3*4]  ; printf('iloczyn = %d\n', eax);
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