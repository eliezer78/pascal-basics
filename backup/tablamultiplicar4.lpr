program tablamultiplicar4;
var
  n, i: integer;
begin
  write('Ingresá un número: ');
  readln(n);

  for i := 1 to 10 do
    writeln(n, ' x ', i, ' = ', n * i);
end.
