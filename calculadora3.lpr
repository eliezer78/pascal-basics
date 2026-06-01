program calculadora3;
var
  a, b: real;
  op: char;

begin
  write('Primer numero: ');
  readln(a);
  write('Operacion (+, -, *, /): ');
  readln(op);
  write('Segundo numero: ');
  readln(b);

  case op of
    '+': writeln('Resultado: ', a + b:0:2);
    '-': writeln('Resultado: ', a - b:0:2);
    '*': writeln('Resultado: ', a * b:0:2);
    '/': if b <> 0 then
           writeln('Resultado: ', a / b:0:2)
         else
           writeln('Error: division por cero.');
  else
    writeln('Operacion no valida.');
  end;
  
  readln;
end.
