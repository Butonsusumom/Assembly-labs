org 100h

arroutput:

    mov si,0
    mov cx, 10

 .show:

    mov ah, 02h
    mov dl,[array+si]
    add dl,48
    int 21h

    inc si
    mov ah, 02h
    mov dx, 32
    int 21h

    loop arroutput.show

Seven:
        mov si, 0
        mov bx, 0
        mov cx, 10
 .loop:
        cmp dl,0
        mov dl, [array+si]

        cmp dl,7
        jg Seven.increment
           inc si
        loop Seven.loop
        jmp Exit
.increment:
        inc bx
        mov [array+si],7
         inc si
        loop Seven.loop

Exit:
   mov ah,09h
  mov dx,carry
  int 21h

output:

    mov si,0
    mov cx, 10


 .show:
    mov ah, 02h
    mov dl,[array+si]
    add dl,48
    int 21h

    inc si
    mov ah, 02h
    mov dx, 32
    int 21h

    loop output.show
     mov ah,09h
  mov dx,carry
  int 21h



    mov cx, bx
    mov bx, 0
    add bx, OutputStr+10
    add cx, 48
    mov byte[bx], cl

    mov ah, 09h
    mov dx, OutputStr
    int 21h

    mov ah,08h
    int 21h
    ret


;///////////////////////////////////////////////

carry db 10,13,'$'
array db 9,8,3,8,5,6,6,7,8,9
text1 db 'Number of changes:$'
OutputStr db 'There are   elements, higher then 7 $'