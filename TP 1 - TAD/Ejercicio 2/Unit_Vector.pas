unit Unit_Vector;

interface

uses
  SysUtils;

const
  min = 1;
  max = 5;

type
  Arreglo = Array[min..max] of Integer;

  Vector = Object //Objeto vector
    private
      arreglo: Arreglo;
    public
      function getVector(): Arreglo;
      procedure vaciar();
      procedure carga(desde:integer;hasta:integer;repite: boolean);
      function prodescalar(escalar: Integer): Vector;
      function mostrar(): String;
      function sumatoria(): Integer;
      function promedio(): double;
      function maximoValor(): integer;
      function maximoValorPosicion(): integer;
      function minimoValor(): integer;
      function minimoValorPosicion(): integer;
      function intercalado(separador: String): String;
      procedure sumaVectores(sumVector: Vector);

  End;

implementation

//Get para obtener el vector
function Vector.getVector: Arreglo;
begin
  getVector := arreglo;
end;

//Vaciar vector
procedure Vector.vaciar();
var  i: integer;
begin
  for i := min to length(arreglo) do
    begin
      arreglo[i] := 0;
    end;
end;

//Procedimiento que carga el vector, con valores repetidos o no
procedure Vector.carga(desde: Integer; hasta: Integer; repite: Boolean);
var i,Cantidad,Valor: integer;
begin
  //Carga repitiendo (si es true)
  if repite then
  begin
    for i := min to length(arreglo) do
    begin
      arreglo[i] := (Random(hasta - desde) + desde + 1);
    end;
  end
  else if ((hasta - desde + 1) >= length(arreglo)) then//Carga sin repeticion
  //Solamente si los numeros posibles son mas grandes que el tamaño del vector
  begin
    i := 0;
    Cantidad := 0;
    Valor := desde;
    while Cantidad < length(arreglo) do
    begin
      i := Random(max) + min; //Cargo en una posicion random
      if (arreglo[i] = 0) then //Si es 0 la cargo
      begin
        arreglo[i] := Valor; //Coloco el valor
        Inc(Cantidad);
        Inc(Valor);
      end;
    end;
  end;
end;

//Funcion que muestra el vector con su posicion
function Vector.mostrar: string;
var
texto: String;
i: integer;
begin
  for i := min to length(arreglo) do
    begin
      texto := texto + 'Posicion' + IntToStr(i) + ': ' + IntToStr(arreglo[i]) + #13#10;
    end;
  mostrar := texto;
end;

//Funcion que realiza la sumatoria de todos los valores que tiene el vector
function Vector.sumatoria(): Integer;
var Sumador, i: integer;
begin
  Sumador := 0;
  for i := min to length(arreglo) do
    begin
      Sumador := Sumador + arreglo[i];
    end;
  sumatoria := Sumador;
end;

//Funcion que calcula el promedio de los valores del vector
function Vector.promedio: Double;
var Sumador, i: integer;
begin
  Sumador := 0;
  for i := min to length(arreglo) do
    begin
      Sumador := Sumador + arreglo[i];
    end;
  promedio := Sumador / length(arreglo);
end;

//Funcion que me devuelve el maximo valor
function Vector.maximoValor(): integer;
begin
  maximoValor := arreglo[maximoValorPosicion()];
end;

//Funcion que me dice la posicion del maximo valor
function Vector.maximoValorPosicion(): integer;
var maximo, posicion, i: integer;
begin
  maximo := 0;
  posicion := 0;
  for i := min to length(arreglo) do
    begin
      if (arreglo[i] > maximo) then
      begin
        maximo := arreglo[i];
        posicion := i;
      end;
    end;
  maximoValorPosicion := posicion;
end;

//Funcion que me dice cual es el valor minimo
function Vector.minimoValor(): integer;
begin
  minimoValor := arreglo[minimoValorPosicion()];
end;

//Funcion que calcula la posicion del valor minimo
function Vector.minimoValorPosicion(): integer;
var minimo, posicion, i: integer;
begin
  posicion := min;
  minimo := arreglo[min];
  for i := min to length(arreglo) do
    begin
      if (arreglo[i] < minimo) then
      begin
        minimo := arreglo[i];
        posicion := i;
      end;
    end;
  minimoValorPosicion := posicion;
end;

//Funcion que devuelve un string con los elementos intercalados por un String
function Vector.intercalado(separador: string): string;
var
texto: String;
i: integer;
begin
  texto := '';
  for i := min to length(arreglo) do
    begin
      texto := texto + IntToStr(arreglo[i]) + separador;
    end;
  intercalado := texto;
end;

//Procedimiento que calcula el producto escalar
function Vector.prodescalar(escalar: Integer): Vector;
var
VprodEscalar: Vector;
i: integer;
begin
 for i := min to length(arreglo) do
    begin
      VprodEscalar.arreglo[i] := arreglo[i] * escalar;
    end;
 Result := VprodEscalar;
end;

//Procedimiento que realiza la suma de dos vectores iguales
procedure Vector.sumaVectores(sumVector: Vector);
var i: integer;
begin
  for i := min to length(arreglo) do
    begin
      arreglo[i] := arreglo[i] + sumVector.getVector[i];
    end;
end;

end.
