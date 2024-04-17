[bits 64]

; Definitions for variables a and b
a        equ 4294967295  ; Value of variable 'a'
b        equ 1            ; Value of variable 'b'

section .data
format:
    db 'suma = %lld', 0xA, 0    ; Output format for printf, changed %llu to %lld for signed 64-bit integers

section .text
global _start

_start:
    mov eax, dword a        ; Move the value of 'a' into EAX (32-bit)
    cdqe                     ; Convert doubleword (32-bit) in EAX to quadword (64-bit) in RAX
    mov ecx, dword b        ; Move the value of 'b' into ECX (32-bit)
    cdqe                     ; Convert doubleword (32-bit) in ECX to quadword (64-bit) in RCX

    add rax, rcx            ; Add 'a' to 'b', result in RAX

    ; Output the result to stdout using printf from asmloader
    push rax                ; Push the result onto the stack
    push format             ; Push the address of the format string onto the stack
    mov ebx, eax            ; Set the API pointer to ebx
    call [ebx + 3*4]        ; Call the printf function

    ; Call the exit function from asmloader
    mov ebx, eax            ; Set the API pointer to ebx
    call [ebx]              ; Call the exit function

; Usage of asmloader:
; - After setting the API pointer to ebx, we call functions using call [ebx + FUNCTION_NUMBER*4]
; - Functions return a value in the EAX register
; - After calling a function, arguments should be popped off the stack
; - FUNCTION_NUMBER:
;   - 0 - exit
;   - 1 - putchar
;   - 2 - getchar
;   - 3 - printf
;   - 4 - scanf
