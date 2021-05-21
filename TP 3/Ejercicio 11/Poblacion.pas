unit Poblacion;
//Unidad que realiza todo el proceso recursivo
interface

const
  Min  = 1;
  Max = 100;

//Declaro el vector y la funcion recursiva
type
  vector = array [Min .. Max] of integer;
  function calcularcantidad(Dia1, Dia2: integer): vector;

implementation

//Funcion que devuelve el vector con la cantidad de cada dia
function calcularcantidad(Dia1, Dia2: integer): vector;
var
  R: real;
  contagiados: vector;
  I: integer;
  //Procedure interno a la funcion que realiza la parte recursiva
  procedure calcularcantidadAux(DiaAnterior: integer);
  var
    DiaActual: integer;
  begin
    //Obtengo el valor del dia actual, multiplicando el dia anterior por R,
    //que es la division del dia 2 y el dia 1
    DiaActual := Trunc(DiaAnterior * R);
    //Si no es el doble y no sea menor que 0, continuo haciendo el proceso recursivo
    if (Dia1 * 2 > DiaActual) and (DiaActual > 0) then
    begin
      //Paso el dia al vector, aumento I y llamo otra vez
      contagiados[I] := DiaActual;
      Inc(I);
      calcularcantidadAux(DiaActual);
    end;

  end;

//Inicializo en 0 todas las posiciones del vector
begin
  for I := Min to Max do
  begin
    contagiados[I] := 0;
  end;
  //Pongo a I en 1 y realizo la cuenta de dividir el dia por el dia anterior
  I := Min;
  R := Dia2 / Dia1;
  //Llamo a el procedure recursivo
  calcularcantidadAux(Dia2);
  Result := contagiados;
end;

end.
