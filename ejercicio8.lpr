{ EJERCICIO 8 --------------------------------------------------------------------- 
Escribir un programa que cargue los datos de 3 alumnos (nombre, edad y nota final) 
usando un arreglo de registros, y luego muestre la lista completa indicando si cada 
alumno aprobó o desaprobó (nota >= 6).}
program ejercicio8;
const
    MAX = 3;

type
    TAlumno = record
        nombre: string;
        edad: integer;
        nota: real;
    end;

var
    alumnos: array[1..MAX] of TAlumno;
    i: integer;

begin
    writeln('------- CARGA DE ALUMNOS ------');
    for i := 1 to MAX do
      begin
        writeln('Alumno ', i, ':');
        write('Nombre: ');
        readln(alumnos[i].nombre);
        write('Edad: ');
        readln(alumnos[i].edad);
        write('Nota: ');
        readln(alumnos[i].nota);
      end;

    writeln('------- MOSTRAR ALUMNOS ------');
    for i := 1 to MAX do
      begin
        writeln('Alumno ', i, ': ', alumnos[i].nombre );
        writeln('Nota: ', alumnos[i].nota:0:2 );
        if alumnos[i].nota >= 6 then
          writeln('APROBADO')
        else
          writeln('DESAPROBADO');
        writeln('--------------------');
      end;

end.
