         [bits 32]

;        esp -> [ret]  ; ret - adres powrotu do asmloader

_760100   call _addr4  ; push on the stack the return address _20105 and jump to _20107

_20105   nop  ; no operation

;        esp -> [ret]

_20106  ret  ; return to asmloader

_20107   nop  ; no operation

;        esp -> [_addr2][ret]

_20108   ret  ; return to _addr2

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