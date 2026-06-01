{ EJERCICIO 6 ---------------------------------------------------------------------------
Escribir un programa que calcule el área de un círculo y de un rectángulo, utilizando:
• Una función para calcular el área del círculo (recibe el radio)
• Una función para calcular el área del rectángulo (recibe base y altura)
• Un procedimiento para mostrar el resultado (recibe el nombre de la figura y el área)}

program ejercicio6;

function AreaCirculo(radio: real): real;
begin
    AreaCirculo := 3.14159 * radio * radio;
end;

function AreaRectangulo(base, altura: real): real;
begin
    AreaRectangulo := base * altura;
end;

procedure MostrarResultado(figura: string; area: real);
begin
    writeln('Area del ', figura, ': ', area:0:2);
end;

var
    rad, base, altura: real;

begin
    write('Ingrese el radio del circulo: ');
    readln(rad);

    MostrarResultado('circulo', AreaCirculo(rad));
    readln;

    write('Ingrese la base del rectangulo: ');
    readln(base);
    write('Ingrese la altura del rectangulo: ');
    readln(altura);

    MostrarResultado('rectangulo', AreaRectangulo(base, altura));
    readln;

end.