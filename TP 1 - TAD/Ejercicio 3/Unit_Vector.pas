unit Unit_Vector;

interface

uses
  SysUtils;

const
  min = 1;
  max = 10;

type
  Arreglo = Array[min..max] of Integer;

  Vector = Object
    private
      arreglo: Arreglo;
    public
      function getVector(): Arreglo;
      procedure agregar(posicion: integer; valor: integer);
      procedure vaciar();
      procedure carga(desde:integer;hasta:integer;repite: boolean);
      procedure prodescalar(escalar: Integer);
      function mostrar(): String;
      function mostrarDiagonal(Cantidad: integer): String;
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

function Vector.getVector: Arreglo;
begin
  getVector := arreglo;
end;

procedure Vector.agregar(posicion: integer; valor: integer);
begin
  arreglo[posicion] := valor;
end;

procedure Vector.vaciar();
var  i: integer;
begin
  for i := min to length(arreglo) do
    begin
      arreglo[i] := 0;
    end;
end;

procedure Vector.carga(desde: Integer; hasta: Integer; repite: Boolean);
var i,Cantidad,Valor: integer;
begin
  //Carga repitiendo
  if repite then
  begin
    for i := min to length(arreglo) do
    begin
      arreglo[i] := (Random(hasta - desde) + desde + 1);
    end;
  end
  else if ((hasta - desde) > length(arreglo)) then//Carga sin repeticion
  begin
    i := 0;
    Cantidad := 0;
    Valor := desde;
    while Cantidad < length(arreglo) do
    begin
      i := Random(max) + min;
      if (arreglo[i] = 0) then
      begin
        arreglo[i] := Valor;
        Inc(Cantidad);
        Inc(Valor);
      end;
    end;
  end;
end;

function Vector.mostrar: string;
var
texto: String;
i: integer;
begin
  for i := min to length(arreglo) do
    begin
        texto := texto + 'Posicion'
        + IntToStr(i) + ': ' + IntToStr(arreglo[i]) + #13#10;
    end;
  mostrar := texto;
end;

function Vector.mostrarDiagonal(Cantidad: Integer): string;
var
texto: String;
i: integer;
begin
  for i := min to Cantidad do
    begin
        texto := texto + 'Posicion'
        + IntToStr(i) + ': ' + IntToStr(arreglo[i]) + #13#10;
    end;
  mostrarDiagonal := texto;
end;

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

function Vector.maximoValor(): integer;
begin
  maximoValor := arreglo[maximoValorPosicion()];
end;

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

function Vector.minimoValor(): integer;
begin
  minimoValor := arreglo[minimoValorPosicion()];
end;

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

procedure Vector.prodescalar(escalar: Integer);
var i: integer;
begin
 for i := min to length(arreglo) do
    begin
      arreglo[i] := arreglo[i] * escalar;
    end;
end;

procedure Vector.sumaVectores(sumVector: Vector);
var i: integer;
begin
  for i := min to length(arreglo) do
    begin
      arreglo[i] := arreglo[i] + sumVector.getVector[i];
    end;
end;

end.
