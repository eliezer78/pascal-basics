program gestionalumnos8;
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

procedure CargarAlumno(var a: TAlumno);
begin
  write('  Nombre: ');
  readln(a.nombre);
  write('  Edad: ');
  readln(a.edad);
  write('  Nota final: ');
  readln(a.nota);
end;

procedure MostrarAlumno(a: TAlumno);
begin
  writeln('  Nombre: ', a.nombre);
  writeln('  Edad  : ', a.edad);
  writeln('  Nota  : ', a.nota:0:2);
  if a.nota >= 6 then
    writeln('  Estado: APROBADO')
  else
    writeln('  Estado: DESAPROBADO');
end;

procedure MostrarTodos;
begin
  writeln('=== Lista de alumnos ===');
  for i := 1 to MAX do
  begin
    writeln('--- Alumno ', i, ' ---');
    MostrarAlumno(alumnos[i]);
  end;
end;

begin
  writeln('=== Carga de alumnos ===');
  for i := 1 to MAX do
  begin
    writeln('Alumno ', i, ':');
    CargarAlumno(alumnos[i]);
  end;

  writeln;
  MostrarTodos;
  readln;
end.
