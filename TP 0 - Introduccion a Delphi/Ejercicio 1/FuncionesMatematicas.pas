//Nombre de la unidad
unit FuncionesMatematicas;

interface

//Constantes
Const
  //Cantidad de valores que tendra el vector
  Min = 1;
  Max = 9;
  tamañoVector = Max - Min + 1;
  valoresDelVector = 10;


type
  Vector = array[Min..Max] of integer;
  procedure cargarVector(var aV: Vector);
  procedure cargarVectorEjemplo(var aV: Vector);
  function Media(aV: Vector): Double;
  function Ordenar(var aV: Vector): Double;
  function Mediana(var aV: Vector): Double;
  function Moda(var aV: Vector): integer;
  function Verifica(aV: Vector;numero: integer): integer;
  function Minimo(var aV: Vector): integer;
  function Maximo(var aV: Vector): integer;


implementation

//Procedimiento que carga el vector de forma aleatoria (los valores
//posibles del vector los determina una constante)
procedure cargarVector(var aV: Vector);
var
i : integer;
begin
  for I := Min to Max do
  begin
    Randomize;
    aV[I] := 1 + random(valoresDelVector);
  end;
end;

//Procedimiento que carga el vector como el ejemplo del ejercicio
procedure cargarVectorEjemplo(var aV: Vector);
begin
  aV[1] := 2;
  aV[2] := 4;
  aV[3] := 4;
  aV[4] := 4;
  aV[5] := 5;
  aV[6] := 6;
  aV[7] := 8;
  aV[8] := 9;
  aV[9] := 10;
end;

//Funcion que calcula la media de un vector
function Media(aV: Vector): Double;
Var Suma, i: Integer;
begin
  Suma := 0;
  //Sumo todos los valores que tengo en el vector
  for i := Min to Max do begin
    Suma := Suma + aV[i];
  end;
  //Divido por la cantidad de elementos
  Media := Suma / tamañoVector;
end;

//Funcion que ordena el vector
function Ordenar(var aV: Vector): Double;
var i,Tamaño, Swap : Integer;
  Intercambio : Boolean;
begin
  Tamaño := Max - 1;
  Intercambio := True;
  //Mientras no se haya producido un intercambio
  while Intercambio do
  begin
    Intercambio := False;
    //Recorro el vector
    for i := Min to Tamaño do
    begin
      //Comparo si un elemento es mayor que el siguiente
      if aV[i] > aV[i + 1] then
      begin
        //Realizo el intercambio
        Intercambio := True;
        Swap := aV[i];
        aV[i] := aV[i + 1];
        aV[i + 1] := Swap;
      end;
    end;
  end;
end;

//Funcion que calcula la mediana, o el valor del medio
function Mediana(var aV: Vector): Double;
var
valor : double;
mitad,j : Integer;
begin
  mitad := tamañoVector DIV 2;
  if ((tamañoVector MOD 2) = 0) then //Si el tamaño es par
  begin
    valor := (aV[mitad] + aV[mitad + 1])/2 //Es la suma de las dos posiciones dividido 2
  end
  else //Si el tamaño es impar
  begin
    valor := aV[mitad + 1]; //Es el valor del medio (le sumo 1 porque el div saca la parte fraccionaria)
  end;
  Mediana := valor;
end;

//Funcion que me dice la cantidad de veces que aparece un numero en el vector
function Verifica(aV: Vector;numero: integer): integer;
var x: integer;
  i: Integer;
begin
  x := 0;
  for i := Min to Max do
  begin
    if (numero = aV[i]) then
     begin
      inc(X);
     end;
  end;
  Verifica := x;
end;

//Funcion que me devuelve la moda o valor que mas se repite dentro de un vector
function Moda(var aV: Vector): integer;
var
numero,valor, repeticion, i: integer;
begin
  numero := 0; //Numero a comparar
  valor := 0;  //Valor de la moda
  repeticion := 0; //Veces que se repite la moda
  //Recorro el vector
  for i := Min to Max do
  begin
    //Obtengo el numero
    numero := aV[i];
    //Comparo si la cantidad de repeticiones de mi moda es mayor a la cantidad de repeticiones del nuevo a comparar
    if (repeticion < Verifica(aV,numero)) then
    begin
      //Si es asi ese numero es la nueva moda
      repeticion := Verifica(aV,numero);
      valor := aV[i];
    end;
  end;
  Moda := valor;
end;

//Funcion que me devuelve el valor minimo
function Minimo(var aV: Vector): integer;
begin
  Ordenar(aV);
  Result := aV[Min];
end;

//Funcion que me devuelve el valor Maximo
function Maximo(var aV: Vector): integer;
begin
  Ordenar(aV);
  Result := aV[Max];
end;

end.
