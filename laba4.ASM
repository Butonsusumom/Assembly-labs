org 100h
;STRING OUTPUT
    mov ah, 09h
    mov dx,text1
    int 21h

    mov ah, 09h
    mov dx, carry
    int 21h

   mov ah, 09h
    mov dx, String
    int 21h

    mov ah, 09h
    mov dx, carry
    int 21h

;ENTER SYMBOL
    mov ah, 09h
    mov dx, welcom
    int 21h

    mov ah, 09h
    mov dx, carry
    int 21h


    xor ax,ax
    mov ah, 01h
    int 21h

;FIND ELEMENT

    xor bp,bp
    xor cx,cx
    mov cl,10
    mov di, String

editStr:
    push cx
    scasb
    pop cx
    
    je q
    inc bp
    
    q:
    loop editStr

;OUTPUT
  mov ah, 09h
  mov dx, carry
  int 21h

    mov ah, 09h
    mov dx, notenetr
    int 21h

   mov ah,02h
   mov dx,bp
   add dx,48
   int 21h

    mov ah, 09h
    mov dx, time
    int 21h

    mov ah,08h
    int 21h
    ret


;//////////////////////////////////////////////////////////////////
 String db  "helloworld$"
 text1 db 'Your string:$'
 welcom db 'Please, enter symbol:$'
 carry db 10,13,'$'
 notenetr db 'Your symbol not enter to string $'
 time db ' times$'      