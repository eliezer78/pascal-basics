{ -------------- Ejercicio 5 -----------------------
Escribir un programa que solicite un número 
entero positivo y calcule su factorial usando 
un bucle while. Recordar que el factorial de 0 es 1.}

program ejercicio5;
var
  num: integer;
  n: integer;
  result: integer;
begin
  n := 1;
  result := 1;

  write('Ingrese un numero entero positivo: ');
  readln(num);

  if num = 0 then
     writeln('El factorial de 0 es 1')
  else
    begin
       while n <= num do
       begin
         result := result * n;
         n := n + 1;
       end;
       writeln('EL factorial de ', num, ' es ', result);
    end;
  readln;
end.
