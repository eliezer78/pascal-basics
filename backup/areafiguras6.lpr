program areafiguras6;

{ Función: devuelve un valor }
function AreaCirculo(radio: real): real;
begin
  AreaCirculo := 3.14159 * radio * radio;
end;

function AreaRectangulo(base, altura: real): real;
begin
  AreaRectangulo := base * altura;
end;

{ Procedimiento: realiza una acción, no devuelve valor }
procedure MostrarResultado(figura: string; area: real);
begin
  writeln('Area del ', figura, ': ', area:0:2);
end;

var
  r, b, h: real;
begin
  write('Radio del circulo: ');
  readln(r);
  MostrarResultado('círculo', AreaCirculo(r));

  write('Base del rectangulo: ');
  readln(b);
  write('Altura del rectangulo: ');
  readln(h);
  MostrarResultado('rectangulo', AreaRectangulo(b, h));
  readln;
end.
