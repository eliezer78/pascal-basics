program calculadora3;
var
  a, b: real;
  op: char;
begin
  write('Primer número: ');
  readln(a);
  write('Operación (+, -, *, /): ');
  readln(op);
  write('Segundo número: ');
  readln(b);

  case op of
    '+': writeln('Resultado: ', a + b:0:2);
    '-': writeln('Resultado: ', a - b:0:2);
    '*': writeln('Resultado: ', a * b:0:2);
    '/': if b <> 0 then
           writeln('Resultado: ', a / b:0:2)
         else
           writeln('Error: división por cero.');
  else
    writeln('Operación no válida.');

  readln;
  end;
end.
