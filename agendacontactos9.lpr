program agendacontactos9;

type
  TContacto = record
    nombre: string;
    telefono: string;
    email: string;
  end;

var
  contacto: TContacto;
  archivo: text;
  opcion: integer;
  linea: string;

procedure GuardarContacto;
begin
  write('Nombre: ');    readln(contacto.nombre);
  write('Telefono: ');  readln(contacto.telefono);
  write('Email: ');     readln(contacto.email);

  assign(archivo, 'contactos.txt');
  append(archivo);         { abre sin borrar lo existente }
  writeln(archivo, contacto.nombre);
  writeln(archivo, contacto.telefono);
  writeln(archivo, contacto.email);
  writeln(archivo, '---');
  close(archivo);

  writeln('Contacto guardado correctamente.');
end;

procedure LeerContactos;
begin
  assign(archivo, 'contactos.txt');

  {$I-}                    { desactiva chequeo de errores de I/O }
  reset(archivo);
  {$I+}

  if IOResult <> 0 then
  begin
    writeln('No hay contactos guardados todavía.');
    exit;
  end;

  writeln('=== Contactos guardados ===');
  while not eof(archivo) do
  begin
    readln(archivo, contacto.nombre);
    readln(archivo, contacto.telefono);
    readln(archivo, contacto.email);
    readln(archivo, linea);   { lee la línea separadora '---' }

    writeln('Nombre   : ', contacto.nombre);
    writeln('Telefono : ', contacto.telefono);
    writeln('Email    : ', contacto.email);
    writeln;
  end;

  close(archivo);
end;

begin
  repeat
    writeln;
    writeln('1. Agregar contacto');
    writeln('2. Ver contactos');
    writeln('0. Salir');
    write('Opcion: ');
    readln(opcion);

    case opcion of
      1: GuardarContacto;
      2: LeerContactos;
      0: writeln('Hasta luego.');
    else
      writeln('Opcion no válida.');
    end;
  until opcion = 0;
  readln;
end.

