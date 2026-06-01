program datospersonales1;
var
  nombre: string;
  apellido: string;
  edad: integer;
begin
  write('Ingrese su nombre: ');
  readln(nombre);
  write('Ingrese su apellido: ');
  readln(nombre);
  write('Ingrese su edad: ');
  readln(edad);
  writeln('Hola ', nombre, ', tienes ', edad, ' anios.');
  readln;
end.