program mayordeedad2;
var
  edad: integer;
begin
  write('Ingresa tu edad: ');
  readln(edad);

  if edad >= 18 then
    writeln('Sos mayor de edad.')
  else
    writeln('Sos menor de edad.');

  readln;
end.
