 org 100h

EntryPoint:
       ; mov ah, $0f
        ;int 10h
        ;mov [Video.OldMode], ah
        ;mov [Video.OldPage], bh


        mov     ax, $0013
        int     10h
;-НЕБО---------------------------
        mov     ax, $A000
        mov     es, ax

        mov     al, 11           ;11-день 1-ночь
        mov     cx, 320 * 100    ;высота -конец неба начало травы
        rep stosb
;-ТРАВА--------------------------
        push $A000
        pop es
        mov al,10                 ;10-зеленый
        mov di,320*100           ;верхний левый угол
        mov cx,100               ;высота
@@:     push cx
        mov cx,320               ;ширина
        rep stosb                ;формирование линии
        pop cx
        loop @b                  ;вывод линий
;....ДОМ.............................
        push $A000
        pop es
        mov al,13                ;13-розовый
        mov di,320*85+110        ;верхний левый угол
        mov cx,80                ;высота
@@:     push cx
        mov cx,100               ;ширина
        rep stosb                ;формирование линии
        add di,320-100           ;сдвиг на 220 точек
        pop cx
        loop @b                  ;вывод линий
;....КРЫША...........................
        push 0A000h
        pop es
        mov al, 5                ;цвет
        mov di, 320*35+160       ;устанавливаем точку угла
        mov si,1                 ;уставовка значения начала крыши
        mov cx,50                ;высота
a1:
        push cx
        mov cx,si                 ;шырина определенного участка крыши
        rep stosb
        add di,320-1               ;смещение для перехода на пиксель вниз и влево
        sub di,si
        add si,2                 ;добавляем по пикселю с двух сторон
        pop cx
        loop a1
;.....ДВЕРЬ.............................
        push $A000
        pop es
        mov al,14                 ;14-желтый
        mov di,320*105+170       ;верхний левый угол двери
        mov cx,57                ;высота
@@:     push cx
        mov cx,30                ;ширина
        rep stosb                ;формирование линии
        add di,320-30            ;сдвиг
        pop cx
        loop @b                  ;вывод линий
;....ОКНО..................................
        push $A000
        pop es
        mov al,9                 ;9-синий
        mov di,320*105+123       ;верхний левый угол   окна
        mov cx,30                ;высота
@@:     push cx
        mov cx,30                ;ширина
        rep stosb                ;вывод точек
        add di,320-30            ;сдвиг
        pop cx
        loop @b                  ;вывод линий

;.....ТРУБА..............................
        push $A000
        pop es
        mov al,4                ;4-красный
        mov di,320*30+185        ;верхний левый угол трубы
        mov cx,45                ;высота
@@:     push cx
        mov cx,10                ;ширина
        rep stosb                ;вывод точек
        add di,320-10            ;сдвиг на
        pop cx
        loop @b                  ;вывод линий
;...................................................

theend:


        mov     ah, $08
        int     21h

        ret

Video.OldMode db 0
Video.OldPage db 0 