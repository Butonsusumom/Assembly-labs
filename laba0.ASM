org 100h
;????? ?????????????? ??????
    mov AH, 09h
    mov DX, welcome
    int 21h

    mov AH, 09h
    mov DX, carry
    int 21h

    mov AH, 0Ah
    mov DX, text
    int 21h

    mov AH, 09h
    mov DX, carry
    int 21h

    ;????? ???????

    mov AL, [text+2]
    mov AH, [text+8]
    mov [text+2], AH
    mov [text+8], AL

    ;?????? ???????

    mov AL, [text+3]
    sub AL, [text+4]
    mov AH, [text+10]
    add AH, AL
    mov [text+9], AH
  ;????? ??????
    mov AH, 09h
    mov DX, text+2
    int 21h

    mov ah,08h
    int 21h
 
    mov ax,4C00h
    int 21h
 ;//////////////////////////////////////////////////
welcome db 'Enter  your string,please $'

text db 10, 0 ,10 dup(?)
carry db 10, 13, '$'