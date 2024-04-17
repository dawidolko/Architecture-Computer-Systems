[bits 32]

;        esp -> [ret]  ; ret - return address

a        equ 4
b        equ 5
c        equ 6
d        equ 7

         mov eax, a  ; eax = a
         mov ecx, b  ; ecx = b

         mul ecx  ; edx:eax = eax * ecx

         mov edi, edx  ; edi = edx
         mov esi, eax  ; esi = eax

         mov eax, c  ; eax = c
         mov ecx, d  ; ecx = d

         mul ecx  ; edx:eax = eax * ecx

         add eax, esi  ; eax = eax + esi
         adc edx, edi  ; edx = edx + edi (with carry)

         push edx  ; higher 4 bytes -> stack
         push eax  ; lower 4 bytes -> stack

;        esp -> [eax][edx][ret]

         call getaddr  ; push on the stack the runtime address of format and jump to getaddr
format:
         db 'result = %llu', 0xA, 0
getaddr:

;        esp -> [format][eax][edx][ret]

         call [ebx+3*4]  ; printf('result = %llu\n', edx:eax);
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