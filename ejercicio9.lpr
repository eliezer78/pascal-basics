{Escribir un programa con un menú de dos opciones que permita
* Agregar un contacto (nombre, teléfono, email) guardándolo en un archivo de texto
* Ver todos los contactos guardados}

program ejercicio9;

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

procedure NuevoContacto; 
begin
    write('Nombre: '); readln(contacto.nombre);
    write('Telefono: '); readln(contacto.telefono);
    write('E-mail: '); readln(contacto.email);

    assign(archivo, 'contactos.txt');
    append(archivo);  {abre el archivo sin borrar su contenido}
    writeln(archivo, contacto.nombre);
    writeln(archivo, contacto.telefono);
    writeln(archivo, contacto.email);
    writeln(archivo, '---');
    close(archivo);

    writeln('Contacto guardado correctamente.');
end;

procedure MostrarContactos; 
begin
    assign(archivo, 'contactos.txt');

    {$I-}               {desactiva chequeo de errores de I/O}
    reset(archivo);
    {$I+}

    if IOResult <> 0 then
      begin
        writeln('No hay contactos en el archivo.');
        exit;
      end;

    writeln('--------- CONTACTOS GUARDADOS ---------');

    while not eof(archivo) do
      begin
        readln(archivo, contacto.nombre);
        readln(archivo, contacto.telefono);
        readln(archivo, contacto.email);
        readln(archivo, linea);    { lee el separador '---'}

        writeln('Nombre: ', contacto.nombre);
        writeln('Telefono: ', contacto.telefono);
        writeln('E-mail: ', contacto.email);
        writeln;
      end;

      close(archivo);
end;

begin
    repeat
        writeln;
        writeln('------- Menu de Opciones ------');
        writeln('1. Agregar contacto');
        writeln('2. Ver contactos');
        writeln('0. Salir');
        writeln('Opcion: '); readln(opcion);

        case opcion of
            1: NuevoContacto;
            2: MostrarContactos;
            0: writeln('Fin del Programa.');
        else
            writeln('Opcion no valida.');
        end;
    until opcion = 0;
    readln;
  
end.
