;ARRAY SORT
  org 100h


;START MESSAGE
   mov ah,09h
   mov dx,Starttext
   int 21h

;CARRY
  mov ah,09h
  mov dx,carry
  int 21h


;ARRAY OUTPUT
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

 ;SORT
    mov cx,10
    dec cx
 nextscan:
    mov bx,cx
    mov si,0

nextcomp:

    mov al,[array+si]
    mov dl,[array+si+1]
    cmp al,dl

    jnc noswap 

    mov [array+si],dl
    mov [array+si+1],al

noswap: 
    inc si
    dec bx
    jnz nextcomp

    loop nextscan



;CARRY
  mov ah,09h
  mov dx,carry
  int 21h

;END MESSAGE
   mov ah,09h
   mov dx,Endtext
   int 21h


;CARRY
  mov ah,09h
  mov dx,carry
  int 21h

;ARRAY OUTPUT
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