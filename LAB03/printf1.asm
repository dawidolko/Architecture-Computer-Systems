    [bits 32]


    push 'H'
    call [ebx+1*4]
    add esp, 4
    
    push 'e'
    call [ebx+1*4]
    add esp, 4

    push 'l'
    call [ebx+1*4]
    add esp, 4

    push 'l'
    call [ebx+1*4]
    add esp, 4

    push 'o'
    call [ebx+1*4]
    add esp, 4
    
    push ' '
    call [ebx+1*4]
    add esp, 4

    push 'W'
    call [ebx+1*4]
    add esp, 4

    push 'o'
    call [ebx+1*4]
    add esp, 4

    push 'r'
    call [ebx+1*4]
    add esp, 4

    push 'l'
    call [ebx+1*4]
    add esp, 4
    
    push 'd'
    call [ebx+1*4]
    add esp, 4

    push '!'
    call [ebx+1*4]
    add esp, 4

    push 0
    call [ebx+0*4]