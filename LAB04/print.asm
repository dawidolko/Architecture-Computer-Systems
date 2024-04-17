        [bits 32]

        push "1"
        push "3"
        push "a"

        call getaddr
format:
       db "a = %c %c %c", 0

getaddr:
        
        call [ebx+3*4]
        
        add esp, 4*4
        
        push 0
        
        call [ebx+0*4]