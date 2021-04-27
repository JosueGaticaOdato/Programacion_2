unit NumerosRacionales;

interface

Uses
  SysUtils, Math;

Type
  NumerosR = Object
    private
      Numero: Double;
    public
      function Suma(N1: Double; N2: Double): Double;
      function Resta(N1: Double; N2: Double): Double;
      function Multiplicar(N1: Double; N2: Double): Double;
      function Se_puede_dividir(N2: Double): Boolean;
      function Dividir(N1: Double; N2: Double): Double;
      function Potencia(N1: Extended; N2: Extended): Extended;

  End;

implementation

function NumerosR.Suma(N1: Double; N2: Double): Double;
var s: Double;
begin
  s := N1 + N2;
  Suma := s;
end;

function NumerosR.Resta(N1: Double; N2: Double): Double;
var s: Double;
begin
  s := N1 - N2;
  Resta := s;
end;

function NumerosR.Multiplicar(N1: Double; N2: Double): Double;
var s: Double;
begin
  s := N1 * N2;
  Multiplicar := s;
end;

function NumerosR.Se_puede_dividir(N2: Double): Boolean;
var Valor: Boolean;
begin
  if N2 <> 0 then
  begin
    Valor := True;
  end
  else
  begin
    Valor := False;
  end;
  Se_puede_dividir := Valor
end;

function NumerosR.Dividir(N1: Double; N2: Double): Double;
var s: Double;
begin
  if N2 <> 0 then
  begin
    s := N1 / N2;
    Dividir := s;
  end

end;

function NumerosR.Potencia(N1: Extended; N2: Extended): Extended;
var s: Extended;
  i: Integer;
begin
  // Power: Funcion de delphi para enviar dos parametros y me devuelve la potencia
  s := Power(N1, N2);
  Potencia := s;
end;
end.
