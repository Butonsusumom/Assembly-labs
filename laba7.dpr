program LR6;

{$APPTYPE CONSOLE}


type
TMat= array [1..10] of word;

function multip(x:word):boolean;
begin
  asm
    mov ax, x
    mov dx, 7
  @divide:

    cmp ax, dx
    jge @lblt
    cmp ax, dx
    jl @lblf

  @lblt:
  mov x, 1
  jmp @ext

  @lblf:
  mov x, 0
  jmp @ext

  @ext:

  end;

  if x=1 then
     result:=true
    else
     result:=false;

end;

var
Arr:TMat;
i,x:integer;

begin
  x:=0;
randomize;
write('Our array: ');
for I := 1 to 10 do
   begin
     Arr[i]:=random(20);
     write(Arr[i]:2,' ');
   end;

writeln;

Writeln('Modifiyed array');
for i := 1 to 10 do
  begin
     if multip(Arr[i]) then
     begin
     write('7  ') ;
     Inc(x);
     end
     else
    write(Arr[i]:2,' ');
  end;
  writeln;
writeln('There are ',x,' elements, more then 7');
readln;
end.
