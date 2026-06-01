program factorial5;
var
  n, i: integer;
  resultado: longint;
begin
  write('Ingrese un numero entero positivo: ');
  readln(n);

  resultado := 1;
  i := 1;
  while i <= n do
  begin
    resultado := resultado * i;
    i := i + 1;
  end;

  writeln('El factorial de ', n, ' es: ', resultado);
  readln;
end.
