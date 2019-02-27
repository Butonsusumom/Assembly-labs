org 100h

   mov ah,09h
   mov dx,text
   int 21h

   mov ah,09h
   mov dx,carry
   int 21h

   mov ah,0ah
   mov dx,Name
   int 21h

   mov ah,09h
   mov dx,carry
   int 21h

   mov bl,[Name+1]
   add bx,Name+2

   mov ah,09h
   mov dx,Hello
   int 21h

   mov ah,09h
   mov dx,Name+2
   mov byte[bx],24h
   int 21h

   mov ah,09h
   mov dx,la
   int 21h

   mov ah,09h
   mov dx,carry
   int 21h


   mov ah,09h
   mov dx,press
   int 21h

   mov ah,08h
   int 21h

  mov ax,4C00h
  int 21h

;//////////////////////////////////////
text  db 'Please,enter your name: $'
carry db  10,13,'$'
Name  db  98,100 dup(?)
Hello db  'Hello,$'
la    db  ' ^_^ $'
press db  'Press any key...$'  