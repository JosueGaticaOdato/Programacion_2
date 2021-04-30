unit NumerosRacionales;

interface

Uses
  SysUtils, Math;

Type
  NumerosR = Object
    private
      Numerador: Integer;
      Denominador: Integer;
      procedure Simplificar();
    public
      function Crear(N: Integer; D: Integer): Boolean;
      function ToString(): String;
      function Suma(N2: NumerosR): NumerosR;
      function Resta(N2: NumerosR): NumerosR;
      function Multiplicar(N2: NumerosR): NumerosR;
      function Simplificar_Entero(N: Integer; D: Integer): Boolean;
      function Dividir(N2: NumerosR): NumerosR;
      function Potencia(N2: NumerosR): NumerosR;
  End;

implementation


procedure NumerosR.Simplificar();
begin

end;

function NumerosR.Crear(N: Integer; D: Integer): Boolean;
begin
  Crear := True;
  Numerador := N;
  Denominador := D;
  if D = 0 then
  begin
    Crear := False
  end;
end;

function NumerosR.ToString(): String;
begin
  ToString := Numerador.ToString + '/' + Denominador.ToString;
end;

function NumerosR.Suma(N2: NumerosR): NumerosR;
begin
  Suma.Numerador := Numerador*N2.Denominador + Denominador*N2.Numerador;
  Suma.Denominador := Denominador * N2.Denominador;
  Suma.Simplificar;
end;

function NumerosR.Resta(N2: NumerosR): NumerosR;
begin
  Resta.Numerador := Numerador*N2.Denominador - Denominador*N2.Numerador;
  Resta.Denominador := Denominador * N2.Denominador;
  Resta.Simplificar;
end;

function NumerosR.Multiplicar(N2: NumerosR): NumerosR;
begin
  Multiplicar.Numerador := Numerador * N2.Numerador;
  Multiplicar.Denominador := Denominador * N2.Denominador;
  Multiplicar.Simplificar;
end;

function NumerosR.Dividir(N2: NumerosR): NumerosR;
begin
  Dividir.Numerador := Numerador * N2.Denominador;
  Dividir.Denominador := Denominador * N2.Numerador;
  Dividir.Simplificar;
end;

function NumerosR.Simplificar_Entero(N: Integer; D: Integer): Boolean;
var Entero: Integer;
begin
  Simplificar_Entero := True;
  Numerador := N;
  Denominador := D;
  Entero := Numerador / Denominador;
  if Entero <> Integer then
  begin
    Simplificar_Entero := False
  end;
end;


function Potencia(N2: NumerosR): NumerosR;
begin

end;

end.
