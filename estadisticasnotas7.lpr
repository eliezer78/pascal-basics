program estadisticasnotas7;
const
  MAX = 5;
var
  notas: array[1..MAX] of real;
  i: integer;
  suma, promedio, mayor, menor: real;

procedure CargarNotas;
begin
  writeln('Ingrese ', MAX, ' notas:');
  for i := 1 to MAX do
  begin
    write('Nota ', i, ': ');
    readln(notas[i]);
  end;
end;

procedure CalcularEstadisticas;
begin
  suma := 0;
  mayor := notas[1];
  menor := notas[1];

  for i := 1 to MAX do
  begin
    suma := suma + notas[i];
    if notas[i] > mayor then mayor := notas[i];
    if notas[i] < menor then menor := notas[i];
  end;

  promedio := suma / MAX;
end;

procedure MostrarResultados;
begin
  writeln('--- Resultados ---');
  writeln('Promedio: ', promedio:0:2);
  writeln('Nota mas alta: ', mayor:0:2);
  writeln('Nota mas baja: ', menor:0:2);
end;

begin
  CargarNotas;
  CalcularEstadisticas;
  MostrarResultados;
  readln;
end.
