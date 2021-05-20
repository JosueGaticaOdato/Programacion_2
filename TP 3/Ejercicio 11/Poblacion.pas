unit Poblacion;

interface

type
  vector = array [1 .. 100] of integer;
function calcularcantidad(D1, D2: integer): vector;

implementation

function calcularcantidad(D1, D2: integer): vector;

var
  R: real;
  contagiados: vector;
  I: integer;
  procedure calcularcantidadAux(DiaAnterior: integer);

  var
    Diactual: integer;
  begin
    Diactual := Trunc(DiaAnterior * R);
    if (D1 * 2 > Diactual) and (Diactual > 0) then
    begin
      contagiados[I] := Diactual;
      Inc(I);
      calcularcantidadAux(Diactual);
    end;

  end;

begin
  for I := 1 to 100 do
  begin
    contagiados[I] := 0;
  end;
  I := 1;
  R := D2 / D1;
  calcularcantidadAux(D2);
  Result := contagiados;
end;

end.
