[bits 64]

a        equ 4294967295
b        equ 1

section .data
format:
         db 'suma = %llu', 0xA, 0

section .text
global _start

_start:

         mov eax, a      ; RAX = a
         xor rdx, rdx    ; Zero-extend RAX to 64 bits (RDX:RAX = a)
         mov ecx, b      ; RCX = b
         xor rbx, rbx    ; Zero-extend RCX to 64 bits (RBX:RCX = b)

         add rax, rcx    ; RAX = RAX + RCX
         adc rdx, rbx    ; RDX = RDX + RBX + CF

         lea rdi, [format]  ; Load address of the format string
         mov rsi, rax        ; Load the lower 4 bytes of the result
         mov rdx, rdx        ; Load the higher 4 bytes of the result

         ; Write the result to stdout
         mov rax, 1       ; System call number for write (1)
         mov rdi, 1       ; File descriptor for stdout (1)
         mov rdx, 21      ; Length of the output string
         syscall

         ; Exit
         mov rax, 60      ; System call number for exit (60)
         xor rdi, rdi     ; Exit status (0)
         syscall