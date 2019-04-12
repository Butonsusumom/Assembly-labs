        Format MZ
        entry Main:Start

SEGMENT Main
Start:
+ADsAPQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQ- MAIN +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9-
   mov ax, Data1
   mov ds, ax

  mov AH, 09h
  mov DX, EntX
  int 21h

   mov ah, 02h
   mov dx, 13
   int 21h
   mov dx, 10
   int 21h

   A+AF8-B+AF8-Input:
        mov di, 3
        Number+AF8-input:



                mov ax, 0c0ah
                mov dx, InputNum
                int 21h

                xor bx, bx
                mov bl, +AFs-InputNum+-1+AF0-
                mov +AFs-InputNum+-bx+-2+AF0-, '+ACQ-'


                mov ah, 02h
                mov dx, 13
                int 21h
                mov dx, 10
                int 21h


                xor dx, dx
                xor ax, ax
                xor bx, bx
                xor cx, cx


                mov cl, +AFs-InputNum+-1+AF0-
                mov dh, 10

        Num+AF8-to+AF8-reg:
                mul dh
                mov dl, +AFs-InputNum+-2+-bx+AF0-
                sub dl, '0'
                add al, dl
                inc bx
        loop Num+AF8-to+AF8-reg

     cont:
        PUSH AX
        dec di
        test di, di
     jnz Number+AF8-input

        pop ax
        mov +AFs-B+AF0-, al
        pop ax
        mov +AFs-A+AF0-, al
        pop ax
        mov +AFs-C+AF0-,al

+ADsAPQA9AD0APQA9AD0APQA9AD0APQ- +AM8A0ADOAMMA0ADAAMwAzADA- 1 +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9-
          mov AH, 09h
          mov DX, Prog1
          int 21h

          mov ah, 02h
          mov dx, 13
          int 21h
          mov dx, 10
          int 21h

        call far procedures: Global+AF8-procedure
        call Number+AF8-Output
+ADsAPQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0-


        mov ah, 08h
        int 21h

+ADsAPQA9AD0APQA9AD0APQA9AD0APQ- +AM8A0ADOAMMA0ADAAMwAzADA- 2 +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9-

        mov AH, 09h
        mov DX, Prog2
        int 21h

        mov ah, 02h
        mov dx, 13
        int 21h
        mov dx, 10
        int 21h

        xor ah, ah
        xor cx, cx
        mov al, +AFs-A+AF0-
        mov bl, +AFs-B+AF0-
        mov cl, +AFs-C+AF0-
        call far procedures: Reg+AF8-procedure
        call Number+AF8-Output
+ADsAPQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0-

        mov ah, 08h
        int 21h


+ADsAPQA9AD0APQA9AD0APQA9AD0APQ- +AM8A0ADOAMMA0ADAAMwAzADA- 3 +AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9-

        mov AH, 09h
        mov DX, Prog3
        int 21h

        mov ah, 02h
        mov dx, 13
        int 21h
        mov dx, 10
        int 21h

        mov al, +AFs-A+AF0-
        xor ah, ah
        push ax
        mov al, +AFs-B+AF0-
        xor ah, ah
        push ax
        mov al, +AFs-C+AF0-
        xor ah, ah
        push ax
        call Stack+AF8-procedure
        call Number+AF8-Output

        mov ah, 08h
        int 21h


        mov     ah, 4Ch
        mov     al, 0
        int     21h

+ADsAPQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9-


        Number+AF8-Output:
                mov dh, 10
                push bx
                push di
                mov di,InputNum
                add di, 2
                xor cx, cx
                xor bx, bx
            Pos:
                div dh
                mov bl, ah
                xor ah, ah
                add bl, '0'
                push bx
                inc cx
                test al, al

                jnz Pos

        L1:
                pop dx
                mov +AFs-di+AF0-, dl
                inc di
                loop L1
                mov byte+AFs-di+AF0-, '+ACQ-'


                mov ah, 09h
                mov dx, InputNum
                add dx, 2
                int 21h

                mov ah, 02h
                mov dx, 13
                int 21h
                mov dx, 10
                int 21h

                xor bx, bx
                mov cx, 5
    L2:
                mov byte+AFs-InputNum+-2+-bx+AF0-, ' '
                inc bx
                loop L2


                pop di
                pop bx

                ret


        Stack+AF8-procedure:
                push bp
                mov bp, sp
                mov ax, +AFs-bp+-8+AF0-
                mul al
                xor ah, ah

                push ax
                mov ax, +AFs-bp+-6+AF0-
                mul al
                xor ah, ah
                mov  bl, al
                pop ax

                add al,bl
                mul byte +AFs-bp+-4+AF0-
                sal ax, C

                mov sp, bp
                pop bp
                ret 6

+ADsAPQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9AD0APQA9-

SEGMENT Data1

        A db ?
        B db ?
        C db ?
        EntX db 'Please,enter value of X,Y,Z:+ACQ-'
        Prog1 db 'Distant.Parameters through the register:+ACQ-'
        Prog2 db 'Distant.Parameter via global variables:+ACQ-'
        Prog3 db 'Distant.Parameters through the stack:+ACQ-'


        InputNum db 5, 6 dup('')



SEGMENT  procedures
         Global+AF8-procedure:
                push ds
                mov ax, Data1
                mov ds, ax

                mov al, +AFs-A+AF0-
                xor ah, ah
                mul +AFs-A+AF0-
                mov bl,al
                mov al, +AFs-B+AF0-
                xor ah, ah
                mul +AFs-B+AF0-
                xor ah, ah
                add al, bl
                mul +AFs-C+AF0-
                sal ax,C


                pop ds
        retf

        Reg+AF8-procedure:
                mul al
                xor ah, ah
                mov dl,al

                mov al,bl
                mul bl
                xor ah,ah

                add al,dl
                mul cl
                sal al,cl


        retf             