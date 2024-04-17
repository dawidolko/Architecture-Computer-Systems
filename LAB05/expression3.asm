[bits 32]

;       esp -> [ret]  ; ret - return address

a        equ 4
b        equ -5
c        equ 6

;          0:eax
;        + 0:esi
;        -------
;        edi:esi
  
         mov eax, b  ; eax = b
         mov esi, c  ; ecx = c
  
         imul esi  ; edx:eax = eax * ecx

         mov esi, a  ; ecx = a

         cdq         ; edx:eax = eax  ; signed conversion

         mov edi, 0  ; edi = 0
         add eax, esi  ; eax = eax + ecx
         adc edx, edi  ; edx = edx + edi (with carry)
  
         push edx  ; edx -> stack
         push eax  ; eax -> stack
  
;        esp -> [eax][edx][ret]
  
         call getaddr  ; push on the stack the runtime address of format and jump to getaddr
format:
         db 'result = %lld', 0xA, 0
getaddr:
  
;        esp -> [format][eax][edx][ret]
  
         call [ebx+3*4]  ; printf('result = %lld\n', edx:eax);
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