{Escribir un programa de inventario con un menú de tres opciones:
* Agregar producto (código, descripción, precio, stock)
* Listar todos los productos
* Buscar un producto por código
}

program ejercicio10;

type
    TProducto = record
        codigo: integer;
        descripcion: string[50];
        precio: real;
        stock: integer;
    end;

var
    producto: TProducto;
    archivo: file of TProducto;  { archivo tipado }
    opcion: integer;

procedure NuevoProducto; 
begin
    write('Codigo: '); readln(producto.codigo);
    write('Descripcion: '); readln(producto.descripcion);
    write('Precio: '); readln(producto.precio);
    write('Stock: '); readln(producto.stock);

    assign(archivo, 'inventario.dat');
    {$I-}               
    reset(archivo);
    {$I+}

    if IOResult <> 0 then
        rewrite(archivo)                    { crea el archivo si no existe }    
    else
        seek(archivo, filesize(archivo));   { se posiciona al final del archivo si existe }

    write(archivo, producto);
    close(archivo);
    writeln('Producto agregado correctamente.');
end;

procedure ListaProductos;
begin

  assign(archivo, 'inventario.dat');
  {$I-} 
  reset(archivo); 
  {$I+}
  
  if IOResult <> 0 then
  begin
    writeln('El inventario esta vacio.');
    exit;
  end;

  writeln('=== Inventario ===');
  while not eof(archivo) do
  begin
    read(archivo, producto);
    writeln('Codigo : ', producto.codigo);
    writeln('Desc.  : ', producto.descripcion);
    writeln('Precio : $', producto.precio:0:2);
    writeln('Stock  : ', producto.stock, ' unidades');
    writeln;
  end;
  close(archivo);
  readln();
end;

procedure BuscarPorCodigo;
var
  codigoBuscado: integer;
  encontrado: boolean;

begin
  write('Codigo a buscar: ');
  readln(codigoBuscado);

  assign(archivo, 'inventario.dat');
  {$I-} 
  reset(archivo); 
  {$I+}
  
  if IOResult <> 0 then
  begin
    writeln('El inventario esta vacio.');
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
    writeln('Descripcion: ', producto.descripcion);
    writeln('Precio     : $', producto.precio:0:2);
    writeln('Stock      : ', producto.stock);
  end
  else
    writeln('No se encontro ningun producto con ese codigo.');
end;





begin
    repeat
        writeln;
        writeln('------- Menu de Opciones ------');
        writeln('1. Agregar producto');
        writeln('2. Ver listado de productos');
        writeln('3. Buscar por codigo');
        writeln('0. Salir');
        writeln('Opcion: '); readln(opcion);

        case opcion of
            1: NuevoProducto;
            2: ListaProductos;
            3: BuscarPorCodigo;
            0: writeln('Fin del Programa.');
        else
            writeln('Opcion no valida.');
        end;
    until opcion = 0;
    readln;
  
end.