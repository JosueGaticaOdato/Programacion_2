unit Unit_Matriz;

interface

uses
  System.SysUtils,Unit_Vector;

const
  min = 1;
  max = 3;
  Maximo = 10;

type
  Arreglo = Vector;

  Matriz = object
  private
    //Matriz cuadrada
    matriz : Array[min..max,min..max] of Integer;
  public
    //Sumar
    //Multiplicar
    procedure cargarAleatorio();
    function mostrar(): String;
    function DiagonalPrincipal():Arreglo;
    function mostrarDiagonal(V: Arreglo): String;
    function DiagonalOpuesta(): Arreglo;
    function maximaFila(): integer;
    function valorMaximaFila(): integer;
    function maximaColumna(): integer;
    function valorMaximaColumna(): integer;
    function buscar(valor: Integer): String;
    procedure multiplicarEscalar(escalar: Integer);
  end;

implementation

procedure Matriz.cargarAleatorio;
var
i,j: integer;
begin
  for I := min to max do
  begin
    for j := min to max do
    begin
      matriz[i][j] := random(Maximo);
    end;
  end;
end;

function Matriz.mostrar: string;
var
texto: String;
i,j: integer;
begin
  texto := '';
  for I := min to max do
  begin
    for j := min to max do
    begin
      texto := texto + ' - ' + inttostr(matriz[i][j])
    end;
    texto := texto + #13#10;
  end;
  mostrar := texto;
end;

function Matriz.DiagonalPrincipal: Arreglo;
var diagonal: Arreglo;
i: Integer;
begin
  for I := min to max do
  begin
    diagonal.agregar(i,matriz[i][i]);
  end;
  DiagonalPrincipal := diagonal;
end;

function Matriz.mostrarDiagonal(V: Arreglo): string;
var i: Integer;
texto: String;
begin
  texto := '';
  for i := min to max do
  begin
        texto := texto + 'Posicion' + IntToStr(i) + ': ' + IntToStr(V.getVector[i]) + #13#10;
  end;
  mostrarDiagonal := texto;
end;

function Matriz.DiagonalOpuesta: Vector;
var
diagonal: Arreglo;
i,j: Integer;
begin
 j := max;
 DiagonalOpuesta := diagonal;
 for i := min to max do
 begin
   diagonal.agregar(i,matriz[i][j]);
   dec(j);
 end;
 DiagonalOpuesta := diagonal;
end;

function Matriz.buscar(valor: Integer): string;
var
i,j : integer;
texto: String;
encontrado: boolean;
begin
  i := min;
  encontrado := false;
  texto := 'No existe ese valor en la matriz';
  while (i <= max) and (not encontrado) do
  begin
    j := min;
    while (j <= max) and (not encontrado) do
      begin
        if matriz[i][j] = valor then
        begin
          encontrado := true;
          texto := 'Fila: ' + inttostr(i) + ' - Columna: ' + inttostr(j);
        end;
        inc(j);
      end;
      inc(i);
  end;
  buscar := texto;
end;

function Matriz.maximaFila: Integer;
var
i,j,posicion, sumador, maximo: integer;
begin
  maximo := 0;
  posicion := 0;
  for I := min to max do
  begin
    sumador := 0;
    for j := min to max do
    begin
      sumador := sumador + matriz[i][j];
    end;
    if (sumador > maximo) then
    begin
      maximo := sumador;
      posicion := i;
    end;
  end;
  maximaFila := posicion;
end;

function Matriz.valorMaximaFila: Integer;
var fila, j, sumador: integer;
begin
  sumador := 0;
  fila := maximaFila();
  for j := min to max do
    begin
      sumador := sumador + matriz[fila][j];
    end;
  valorMaximaFila := sumador;
end;

function Matriz.maximaColumna: Integer;
var
i,j,posicion, sumador, maximo: integer;
begin
  maximo := 0;
  posicion := 0;
  for I := min to max do
  begin
    sumador := 0;
    for j := min to max do
    begin
      sumador := sumador + matriz[j][i];
    end;
    if (sumador > maximo) then
    begin
      maximo := sumador;
      posicion := i;
    end;
  end;
  maximaColumna := posicion;
end;

function Matriz.valorMaximaColumna: Integer;
var columna, j, sumador: integer;
begin
  sumador := 0;
  columna := maximacolumna();
  for j := min to max do
    begin
      sumador := sumador + matriz[j][columna];
    end;
  valorMaximaColumna := sumador;
end;

procedure Matriz.multiplicarEscalar(escalar: Integer);
var
i,j: integer;
begin
  for I := min to max do
  begin
    for j := min to max do
    begin
      matriz[i][j] := matriz[i][j] * escalar;
    end;
  end;
end;



end.
