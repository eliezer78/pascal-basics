program inventarioproductos10;

type
  TProducto = record
    codigo: integer;
    descripcion: string[50];   { string de longitud fija, necesario en archivos tipados }
    precio: real;
    stock: integer;
  end;

var
  producto: TProducto;
  archivo: file of TProducto;  { archivo tipado }
  opcion: integer;

procedure AgregarProducto;
begin
  write('Código: ');       readln(producto.codigo);
  write('Descripción: ');  readln(producto.descripcion);
  write('Precio: ');       readln(producto.precio);
  write('Stock: ');        readln(producto.stock);

  assign(archivo, 'inventario.dat');
  {$I-} reset(archivo); {$I+}
  if IOResult <> 0 then
    rewrite(archivo)     { crea el archivo si no existe }
  else
    seek(archivo, filesize(archivo));  { se posiciona al final }

  write(archivo, producto);
  close(archivo);
  writeln('Producto agregado.');
end;

procedure ListarProductos;
begin
  assign(archivo, 'inventario.dat');
  {$I-} reset(archivo); {$I+}
  if IOResult <> 0 then
  begin
    writeln('El inventario está vacío.');
    exit;
  end;

  writeln('=== Inventario ===');
  while not eof(archivo) do
  begin
    read(archivo, producto);
    writeln('Código : ', producto.codigo);
    writeln('Desc.  : ', producto.descripcion);
    writeln('Precio : $', producto.precio:0:2);
    writeln('Stock  : ', producto.stock, ' unidades');
    writeln;
  end;
  close(archivo);
end;

procedure BuscarPorCodigo;
var
  codigoBuscado: integer;
  encontrado: boolean;
begin
  write('Código a buscar: ');
  readln(codigoBuscado);

  assign(archivo, 'inventario.dat');
  {$I-} reset(archivo); {$I+}
  if IOResult <> 0 then
  begin
    writeln('El inventario está vacío.');
    exit;
  end;

  encontrado := false;
  while (not eof(archivo)) and (not encontrado) do
  begin
    read(archivo, producto);
    if producto.codigo = codigoBuscado then
      encontrado := true;
  end;
  close(archivo);

  if encontrado then
  begin
    writeln('Producto encontrado:');
    writeln('Descripción: ', producto.descripcion);
    writeln('Precio     : $', producto.precio:0:2);
    writeln('Stock      : ', producto.stock);
  end
  else
    writeln('No se encontró ningún producto con ese código.');
end;

begin
  repeat
    writeln;
    writeln('1. Agregar producto');
    writeln('2. Listar productos');
    writeln('3. Buscar por código');
    writeln('0. Salir');
    write('Opción: ');
    readln(opcion);

    case opcion of
      1: AgregarProducto;
      2: ListarProductos;
      3: BuscarPorCodigo;
      0: writeln('Cerrando inventario.');
    else
      writeln('Opcion no válida.');
    end;
  until opcion = 0;
  readln;
end.

