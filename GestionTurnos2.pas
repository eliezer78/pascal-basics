program GestionTurnos2;

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

uses Crt;

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
  ClrScr;
end;

{ ------------------------------------------------------------
  Muestra una linea separadora en pantalla
  ------------------------------------------------------------ }
procedure MostrarSeparador;
begin
  WriteLn('------------------------------------------------------------');
end;

{ ------------------------------------------------------------
  Muestra el menu principal y sus opciones
  ------------------------------------------------------------ }
procedure MostrarMenu;
begin
  LimpiarPantalla;
  MostrarSeparador;
  WriteLn('         SISTEMA DE TURNOS MEDICOS');
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

  for i := 1 to cantidad do
  begin
    if turnos[i].id = idBuscado then
    begin
      indice := i;
      { Detener la busqueda al encontrar el ID }
      i := cantidad;
    end;
  end;

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

  { Solicitar y validar nombre del paciente }
  repeat
    Write('Nombre del paciente: ');
    ReadLn(nuevoTurno.nombre);
    if nuevoTurno.nombre = '' then
      WriteLn('El campo no puede estar vacio.');
  until nuevoTurno.nombre <> '';

  { Solicitar y validar fecha }
  repeat
    Write('Fecha del turno (DD/MM/AAAA): ');
    ReadLn(nuevoTurno.fecha);
    if nuevoTurno.fecha = '' then
      WriteLn('El campo no puede estar vacio.');
  until nuevoTurno.fecha <> '';

  { Solicitar y validar hora }
  repeat
    Write('Hora del turno (HH:MM): ');
    ReadLn(nuevoTurno.hora);
    if nuevoTurno.hora = '' then
      WriteLn('El campo no puede estar vacio.');
  until nuevoTurno.hora <> '';

  { Solicitar y validar medico }
  repeat
    Write('Nombre del medico: ');
    ReadLn(nuevoTurno.medico);
    if nuevoTurno.medico = '' then
      WriteLn('El campo no puede estar vacio.');
  until nuevoTurno.medico <> '';

  { El estado inicial siempre es 'pendiente' }
  nuevoTurno.estado := 'pendiente';

  { Guardar el turno en el arreglo y actualizar cantidad }
  cantidad := cantidad + 1;
  turnos[cantidad] := nuevoTurno;

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
    WriteLn;
    MostrarSeparador;
    WriteLn('  ID      : ', turnos[indice].id);
    WriteLn('  Nombre  : ', turnos[indice].nombre);
    WriteLn('  Fecha   : ', turnos[indice].fecha);
    WriteLn('  Hora    : ', turnos[indice].hora);
    WriteLn('  Medico  : ', turnos[indice].medico);
    WriteLn('  Estado  : ', turnos[indice].estado);
    MostrarSeparador;
  end;
end;

{ ------------------------------------------------------------
  PROCEDIMIENTO: ModificarTurno
  Permite editar la fecha, hora y medico de un turno.
  Restriccion: solo si el estado es 'pendiente'.
  ------------------------------------------------------------ }
procedure ModificarTurno;
var
  idBuscado  : Integer;
  indice     : Integer;
  nuevaFecha : String[10];
  nuevaHora  : String[5];
  nuevoMedico: String[50];
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
      WriteLn;

      { Modificar fecha }
      Write('Nueva fecha (actual: ', turnos[indice].fecha, '): ');
      ReadLn(nuevaFecha);
      if nuevaFecha <> '' then
        turnos[indice].fecha := nuevaFecha;

      { Modificar hora }
      Write('Nueva hora  (actual: ', turnos[indice].hora, '): ');
      ReadLn(nuevaHora);
      if nuevaHora <> '' then
        turnos[indice].hora := nuevaHora;

      { Modificar medico }
      Write('Nuevo medico (actual: ', turnos[indice].medico, '): ');
      ReadLn(nuevoMedico);
      if nuevoMedico <> '' then
        turnos[indice].medico := nuevoMedico;

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
    { Verificar que el turno no sea 'atendido' }
    if turnos[indice].estado = 'atendido' then
    begin
      WriteLn('ERROR: No se puede cancelar un turno ya atendido.');
    end
    { Verificar que el turno no este ya cancelado }
    else if turnos[indice].estado = 'cancelado' then
    begin
      WriteLn('AVISO: El turno con ID ', idBuscado, ' ya se encuentra cancelado.');
    end
    else
    begin
      { Pedir confirmacion al usuario }
      WriteLn('Paciente : ', turnos[indice].nombre);
      WriteLn('Fecha    : ', turnos[indice].fecha, '  Hora: ', turnos[indice].hora);
      WriteLn('Medico   : ', turnos[indice].medico);
      WriteLn;
      Write('Esta seguro que desea cancelar este turno? (S/N): ');
      ReadLn(confirmacion);

      if (confirmacion = 'S') or (confirmacion = 's') then
      begin
        turnos[indice].estado := 'cancelado';
        WriteLn('Turno cancelado correctamente.');
      end
      else
      begin
        WriteLn('Operacion cancelada. El turno no fue modificado.');
      end;
    end;
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

  { Encabezado de tabla }
  MostrarSeparador;
  WriteLn(' ID  | Nombre               | Fecha      | Hora  | Medico               | Estado    ');
  MostrarSeparador;

  { Recorrer el arreglo e imprimir cada turno }
  for i := 1 to cantidad do
  begin
    Write(' ');
    { ID con ancho fijo de 3 }
    if turnos[i].id < 10 then
      Write(' ', turnos[i].id, '  | ')
    else if turnos[i].id < 100 then
      Write(turnos[i].id, '  | ')
    else
      Write(turnos[i].id, ' | ');

    { Nombre con ancho aproximado de 20 }
    Write(turnos[i].nombre);
    Write(StringOfChar(' ', 21 - Length(turnos[i].nombre)));
    Write('| ');

    { Fecha }
    Write(turnos[i].fecha, ' | ');

    { Hora }
    Write(turnos[i].hora, '  | ');

    { Medico con ancho aproximado de 20 }
    Write(turnos[i].medico);
    Write(StringOfChar(' ', 21 - Length(turnos[i].medico)));
    Write('| ');

    { Estado }
    WriteLn(turnos[i].estado);
  end;

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
    fpc GestionTurnos1.pas
    ./GestionTurnos1

  COMPILACION (Turbo Pascal):
    Abrir el archivo y presionar Ctrl+F9

  ============================================================ }
