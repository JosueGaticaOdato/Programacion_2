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
    MatrizCuadrada: Array[min..max,min..max] of Integer;
  public
    procedure sumar(var M: Matriz);
    procedure Multiplicar(var M: Matriz);
    function getValorMatriz(fila, columna: Integer): Integer;
    procedure setPosicionMatriz(fila,columna,valor: integer);
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

//Colocar en una posicion el valor
procedure Matriz.setPosicionMatriz(fila: Integer; columna: Integer; valor: integer);
begin
  MatrizCuadrada[fila][columna] := valor;
end;

//Obtener el valor de una posicion en una matriz
function Matriz.getValorMatriz(fila, columna: Integer): Integer;
begin
  Result := MatrizCuadrada[fila][columna];
end;

//Procedimiento que realiza la multiplicacion entre matrices
procedure Matriz.multiplicar(var M: Matriz);
var
i,j,multi: integer;
  recorrido: Integer;
newMatriz: Matriz;
begin
  for i := min to max do //FIla
  begin
    for j := min to max do //Columna
    begin
      multi := 0; //Pongo el multiplicar en 0
      for recorrido := min to max do //Recorrido equivale a las veces que
      //tengo que hacer la multiplicacion entre celdas, que es igual
      //al tamaño de la matriz
        begin
          //A la primera matriz le trabjo la columna y a la otra la fila
          //Multiplico y sigo pidiendo
          multi := multi + MatrizCuadrada[i][recorrido] * M.getValorMatriz(recorrido,j);
        end;
      newMatriz.setPosicionMatriz(i,j,multi); //Cargo en la nueva matriz
    end;
  end;
  M := newMatriz; //Obtengo la matriz resultado
end;

//Procedimiento que realiza la suma entre matrices
procedure Matriz.sumar(var M: Matriz);
var
i,j,suma: integer;
begin
  suma := 0;
  for i := min to max do
  begin
    for j := min to max do
    begin
      suma := MatrizCuadrada[i][j]+ M.getValorMatriz(i,j); //Sumo
      M.setPosicionMatriz(i,j,suma); //Guardo en la matriz
    end;
  end;
end;

//Procedimiento que carga la matriz de forma aleatoria
procedure Matriz.cargarAleatorio;
var
i,j: integer;
begin
  for I := min to max do
  begin
    for j := min to max do
    begin
      MatrizCuadrada[i][j] := random(Maximo);
    end;
  end;
end;

//Funcion que devuelve un string mostrando la matriz
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
      if j = 1 then //Columna 1
      begin
        texto := texto + inttostr(MatrizCuadrada[i][j])
      end
      else
      begin
        texto := texto + ' - ' + inttostr(MatrizCuadrada[i][j])
      end;
    end;
    texto := texto + #13#10;
  end;
  mostrar := texto;
end;

//Funcion que me devuelve la diagonal principal
function Matriz.DiagonalPrincipal: Arreglo;
var diagonal: Arreglo;
i: Integer;
begin
  for I := min to max do
  begin
    diagonal.agregar(i,MatrizCuadrada[i][i]); //La diagonal principal la compone
    //los valores de las filas y columnas iguales
  end;
  DiagonalPrincipal := diagonal;
end;

//Funcion que muestra la diagonal principal o opuesta
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

//Funcion que calcula la diagonal opuesta
function Matriz.DiagonalOpuesta: Vector;
var
diagonal: Arreglo;
i,j: Integer;
begin
 j := max;
 DiagonalOpuesta := diagonal;
 for i := min to max do
 begin
   diagonal.agregar(i,MatrizCuadrada[i][j]); //Diagonal opuesta
   //  a a x
   //  a x a
   //  x a a
   dec(j);
 end;
 DiagonalOpuesta := diagonal;
end;

//Funcion que busca la primera ocurrencia dentro de una matriz
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
        if MatrizCuadrada[i][j] = valor then
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

//Funcion que me devuelve cual es la maxima fila
function Matriz.maximaFila: Integer;
var
i,j,posicion, sumador, maximo: integer;
begin
  maximo := 0;
  posicion := 0;
  for I := min to max do //Recorro fila
  begin
    sumador := 0;
    for j := min to max do //Recorro columna
    begin
      sumador := sumador + MatrizCuadrada[i][j]; //Sumo todos los valores de la fila
    end;
    if (sumador > maximo) then //Consulto si supero el maximo
    begin
      maximo := sumador;
      posicion := i;
    end;
  end;
  maximaFila := posicion;
end;

//Funcion que me devuelve el resultado de la maxima fila
function Matriz.valorMaximaFila: Integer;
var fila, j, sumador: integer;
begin
  sumador := 0;
  fila := maximaFila(); //Obtengo la fila maxima
  for j := min to max do
    begin
      sumador := sumador + MatrizCuadrada[fila][j]; //Calculo el total
    end;
  valorMaximaFila := sumador;
end;

//Funcion que me devuelve cual es la maxima columna
function Matriz.maximaColumna: Integer;
var
i,j,posicion, sumador, maximo: integer;
begin
  maximo := 0;
  posicion := 0;
  for I := min to max do //Recorro columna
  begin
    sumador := 0;
    for j := min to max do  //Recorro fila
    begin
      sumador := sumador + MatrizCuadrada[j][i]; //Sumo todos los valores de la columna
    end;
    if (sumador > maximo) then  //Consulto si supero el maximo
    begin
      maximo := sumador;
      posicion := i;
    end;
  end;
  maximaColumna := posicion;
end;

//Funcion que me devuelve el resultado de la maxima columna
function Matriz.valorMaximaColumna: Integer;
var columna, j, sumador: integer;
begin
  sumador := 0;
  columna := maximacolumna(); //Obtengo la columna maxima
  for j := min to max do
    begin
      sumador := sumador + MatrizCuadrada[j][columna]; //Calculo el total
    end;
  valorMaximaColumna := sumador;
end;

//Procedimiento que le aplica un escalar a la matriz
procedure Matriz.multiplicarEscalar(escalar: Integer);
var
i,j: integer;
begin
  for I := min to max do
  begin
    for j := min to max do
    begin
      MatrizCuadrada[i][j] := MatrizCuadrada[i][j] * escalar;
    end;
  end;
end;



end.
