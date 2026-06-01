program GestionTurnos;

{ ============================================================
  TRABAJO PRACTICO - Paradigma Estructurado - Pascal
  Sistema de Gestion de Turnos Medicos

  Historia de Usuario:
    Como recepcionista, quiero registrar, consultar,
    modificar y cancelar turnos de pacientes para
    organizar la agenda del consultorio.

  Integrantes:
    1) _________________________________
    2) _________________________________
    3) _________________________________ (opcional)

  Fecha de entrega: ___/___/______
  ============================================================ }

{ ============================================================
  SECCION 1: DEFINICION DE TIPOS Y CONSTANTES
  ============================================================ }

const
  MAX_TURNOS = 100;  { Capacidad maxima del sistema }

type
  { Estructura principal: representa un turno medico }
  TTurno = record
    id      : Integer;       { Identificador unico }
    nombre  : String[50];    { Nombre del paciente }
    fecha   : String[10];    { Formato: DD/MM/AAAA }
    hora    : String[5];     { Formato: HH:MM }
    medico  : String[50];    { Nombre del medico }
    estado  : String[15];    { pendiente / atendido / cancelado }
  end;

  { Arreglo para almacenar todos los turnos en memoria }
  TListaTurnos = array[1..MAX_TURNOS] of TTurno;

{ ============================================================
  SECCION 2: VARIABLES GLOBALES
  ============================================================ }

var
  turnos     : TListaTurnos;  { Almacenamiento de turnos }
  cantidad   : Integer;       { Cantidad actual de turnos }
  opcion     : Integer;       { Opcion del menu seleccionada }

{ ============================================================
  SECCION 3: PROCEDIMIENTOS Y FUNCIONES
  Cada subprograma resuelve UNA sola responsabilidad.
  ============================================================ }

{ ------------------------------------------------------------
  Limpia la pantalla de la consola
  ------------------------------------------------------------ }
procedure LimpiarPantalla;
begin
  { TODO: Implementar limpieza de pantalla }
  { Tip: usar ClrScr (necesita "uses Crt" al inicio) }

end;

{ ------------------------------------------------------------
  Muestra una linea separadora en pantalla
  ------------------------------------------------------------ }
procedure MostrarSeparador;
begin
  { TODO: Imprimir una linea de guiones o igual }

end;

{ ------------------------------------------------------------
  Muestra el menu principal y sus opciones
  ------------------------------------------------------------ }
procedure MostrarMenu;
begin
  LimpiarPantalla;
  MostrarSeparador;
  WriteLn('     SISTEMA DE TURNOS MEDICOS');
  MostrarSeparador;
  WriteLn('  1. Registrar nuevo turno');
  WriteLn('  2. Buscar turno');
  WriteLn('  3. Modificar turno');
  WriteLn('  4. Cancelar turno');
  WriteLn('  5. Listar todos los turnos');
  WriteLn('  0. Salir');
  MostrarSeparador;
  Write('  Seleccione una opcion: ');
end;

{ ------------------------------------------------------------
  FUNCION: BuscarTurno
  Busca un turno por su ID dentro del arreglo.
  Retorna: el indice del turno encontrado (1..cantidad)
           o -1 si no existe.
  Parametros:
    - idBuscado: el ID a buscar
  ------------------------------------------------------------ }
function BuscarTurno(idBuscado: Integer): Integer;
var
  i      : Integer;
  indice : Integer;
begin
  indice := -1;  { Valor por defecto: no encontrado }

  { TODO: Recorrer el arreglo "turnos" buscando el ID.
          Si encontras una coincidencia, guardar el indice
          y detener la busqueda. }

  BuscarTurno := indice;  { Retornar resultado }
end;

{ ------------------------------------------------------------
  PROCEDIMIENTO: AltaTurno
  Registra un nuevo turno en el sistema.
  Valida que no haya campos vacios.
  ------------------------------------------------------------ }
procedure AltaTurno;
var
  nuevoTurno : TTurno;
  valido     : Boolean;
begin
  WriteLn;
  WriteLn('=== REGISTRAR NUEVO TURNO ===');

  { Verificar que haya espacio disponible }
  if cantidad >= MAX_TURNOS then
  begin
    WriteLn('ERROR: El sistema ha alcanzado la capacidad maxima.');
    Exit;
  end;

  { Asignar ID automatico (correlativo) }
  nuevoTurno.id := cantidad + 1;

  { TODO: Solicitar y validar cada campo del turno.
          Ninguno puede quedar vacio.
          Campos a pedir:
            - nombre  (String)
            - fecha   (String, formato DD/MM/AAAA)
            - hora    (String, formato HH:MM)
            - medico  (String)
          El estado inicial SIEMPRE es 'pendiente'. }

  { Ejemplo de validacion de campo (pueden reutilizar este patron):
  repeat
    Write('Nombre del paciente: ');
    ReadLn(nuevoTurno.nombre);
    if nuevoTurno.nombre = '' then
      WriteLn('El campo no puede estar vacio.');
  until nuevoTurno.nombre <> ''; }

  { TODO: Guardar el turno en el arreglo y actualizar "cantidad" }

  WriteLn;
  WriteLn('Turno registrado con exito. ID asignado: ', nuevoTurno.id);
end;

{ ------------------------------------------------------------
  PROCEDIMIENTO: ConsultarTurno
  Muestra los datos de un turno buscado por ID.
  ------------------------------------------------------------ }
procedure ConsultarTurno;
var
  idBuscado : Integer;
  indice    : Integer;
begin
  WriteLn;
  WriteLn('=== BUSCAR TURNO ===');

  Write('Ingrese el ID del turno a buscar: ');
  ReadLn(idBuscado);

  indice := BuscarTurno(idBuscado);

  if indice = -1 then
  begin
    WriteLn('ERROR: No se encontro un turno con ID ', idBuscado, '.');
  end
  else
  begin
    { TODO: Mostrar todos los campos del turno encontrado
            en formato legible. Usar "turnos[indice]" para acceder.
            Mostrar: ID, Nombre, Fecha, Hora, Medico, Estado }

  end;
end;

{ ------------------------------------------------------------
  PROCEDIMIENTO: ModificarTurno
  Permite editar la fecha, hora y medico de un turno.
  Restriccion: solo si el estado es 'pendiente'.
  ------------------------------------------------------------ }
procedure ModificarTurno;
var
  idBuscado : Integer;
  indice    : Integer;
begin
  WriteLn;
  WriteLn('=== MODIFICAR TURNO ===');

  Write('Ingrese el ID del turno a modificar: ');
  ReadLn(idBuscado);

  indice := BuscarTurno(idBuscado);

  if indice = -1 then
  begin
    WriteLn('ERROR: No se encontro un turno con ID ', idBuscado, '.');
  end
  else
  begin
    { Verificar que el turno pueda modificarse }
    if turnos[indice].estado <> 'pendiente' then
    begin
      WriteLn('ERROR: Solo se pueden modificar turnos en estado "pendiente".');
      WriteLn('Estado actual: ', turnos[indice].estado);
    end
    else
    begin
      WriteLn('Turno encontrado: ', turnos[indice].nombre);
      WriteLn('Deje en blanco para conservar el valor actual.');

      { TODO: Pedir nuevos valores para fecha, hora y medico.
              Si el usuario no ingresa nada (Enter), conservar el valor anterior.
              Actualizar directamente sobre turnos[indice].
              El ID y el nombre NO pueden cambiarse. }

      WriteLn;
      WriteLn('Turno modificado correctamente.');
    end;
  end;
end;

{ ------------------------------------------------------------
  PROCEDIMIENTO: CancelarTurno
  Cambia el estado de un turno a 'cancelado'.
  Requiere confirmacion del usuario.
  Restriccion: no se puede cancelar un turno 'atendido'.
  ------------------------------------------------------------ }
procedure CancelarTurno;
var
  idBuscado    : Integer;
  indice       : Integer;
  confirmacion : Char;
begin
  WriteLn;
  WriteLn('=== CANCELAR TURNO ===');

  Write('Ingrese el ID del turno a cancelar: ');
  ReadLn(idBuscado);

  indice := BuscarTurno(idBuscado);

  if indice = -1 then
  begin
    WriteLn('ERROR: No se encontro un turno con ID ', idBuscado, '.');
  end
  else
  begin
    { TODO: Verificar que el turno no sea 'atendido'.
            Si lo es, mostrar mensaje de error y salir.
            Si ya esta 'cancelado', informar que ya fue cancelado. }

    { TODO: Pedir confirmacion al usuario (S/N).
            Solo si confirma con 'S' o 's', cambiar el estado.
            Actualizar turnos[indice].estado := 'cancelado' }

  end;
end;

{ ------------------------------------------------------------
  PROCEDIMIENTO: ListarTurnos
  Muestra todos los turnos en formato de tabla.
  Incluye el total al final.
  ------------------------------------------------------------ }
procedure ListarTurnos;
var
  i : Integer;
begin
  WriteLn;
  WriteLn('=== LISTADO DE TURNOS ===');

  if cantidad = 0 then
  begin
    WriteLn('No hay turnos registrados en el sistema.');
    Exit;
  end;

  { TODO: Imprimir encabezado de tabla con columnas:
          ID | Nombre | Fecha | Hora | Medico | Estado }

  MostrarSeparador;

  { TODO: Recorrer el arreglo de 1 hasta "cantidad"
          e imprimir cada turno en una fila de la tabla }

  MostrarSeparador;
  WriteLn('Total de turnos registrados: ', cantidad);
end;

{ ============================================================
  SECCION 4: PROGRAMA PRINCIPAL
  El bloque begin..end. es el punto de entrada del programa.
  Solo llama a los procedimientos, no tiene logica propia.
  ============================================================ }

begin
  { Inicializar variables }
  cantidad := 0;

  { Ciclo principal: se repite hasta que el usuario elija Salir }
  repeat
    MostrarMenu;
    ReadLn(opcion);

    case opcion of
      1: AltaTurno;
      2: ConsultarTurno;
      3: ModificarTurno;
      4: CancelarTurno;
      5: ListarTurnos;
      0: WriteLn('Hasta luego!');
    else
      WriteLn('Opcion invalida. Intente nuevamente.');
    end;

    { Pausar antes de volver al menu (excepto al salir) }
    if opcion <> 0 then
    begin
      WriteLn;
      Write('Presione Enter para continuar...');
      ReadLn;
    end;

  until opcion = 0;

end.

{ ============================================================
  NOTAS PARA LOS ALUMNOS:
  ============================================================

  CONCEPTOS QUE DEBEN APARECER EN SU SOLUCION:
    [x] Record (TTurno)
    [x] Array de Records (TListaTurnos)
    [x] Procedures con parametros
    [x] Function que retorna un valor
    [x] Estructuras de control: if/else, case, repeat/until, for
    [x] Validacion de datos de entrada
    [x] Modularizacion (cada tarea en su subprograma)

  PREGUNTAS QUE EL DOCENTE PUEDE HACER EN LA DEFENSA:
    - Por que BuscarTurno es una Function y no un Procedure?
    - Que pasa si el array esta lleno y quieren agregar otro turno?
    - Como modificarian el codigo para guardar los datos en un archivo?
    - Que ventaja tiene usar un Record en lugar de variables separadas?
    - Por que usaron repeat/until en el menu en lugar de while?
    - Como funciona el indice -1 en BuscarTurno?

  COMPILACION (Free Pascal):
    fpc GestionTurnos.pas
    ./GestionTurnos

  COMPILACION (Turbo Pascal):
    Abrir el archivo y presionar Ctrl+F9

  ============================================================ }
