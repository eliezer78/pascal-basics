{Escribir un programa que cargue 5 notas de alumnos en un arreglo y calcule y muestre:
• El promedio del grupo
• La nota más alta
• La nota más baja
}
program ejercicio7;
const
    MAX = 5;
var
    notas: array[1..MAX] of real;
    i: integer;
    suma, prom, masalta, masbaja: real;
begin
    
    suma := 0;
    writeln('Ingrese ', MAX, ' notas:');
    for i := 1 to MAX do
      begin
        write('Nota ', i, ': ');
        readln(notas[i]);
        suma := suma + notas[i];
      end;

    prom := suma / MAX;
    writeln('El promedio es ', prom:0:2);

    masalta := 0;
    masbaja := 1000;
    for i := 1 to MAX do
    begin

      if notas[i] < masbaja then
        masbaja := notas[i];
    
      if notas[i] > masalta then
        masalta := notas[i];
    
    end;

    writeln('La nota mas baja es ', masbaja:0:2);
    writeln('La nota mas alta es ', masalta:0:2);
    readln;
end.