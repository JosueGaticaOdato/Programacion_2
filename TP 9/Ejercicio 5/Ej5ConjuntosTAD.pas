unit Ej5ConjuntosTAD;

interface

uses
  Tipos,ConjuntosAVL;

const
  tipoClave = Numero;
  cantElem = 3;
  Min = 1;
  Max = 5;
  cantElem2 = 15;

type
  Ej4 = Object
  private
    C:Conjunto;
  public
    procedure crearConjunto(aTClave:tipoDatosClave;aSize:integer);
    function cargarConjunto(aSize,aMin,aMax:integer) : boolean;
    function mostrarConjunto(aC:Ej4) : string;
  End;

implementation

//Dados 3 conjuntos determinar si alguno es un subconjunto parcial o
//total del otro.
//
//Se considera un subconjunto parcial cuando al menos la mitad de los
// elementos de uno están en el otro.
//
//Determinar la complejidad algorítmica.
//
//    Ejemplo: si A = (3, 4, 5) y B = (1, 2, 3, 4, 5, 6, 7, 8, 9) y
//     C = (2, 4, 6, 8, 7) entonces a A es un subconjunto total B porque
//      todos los elementos de A están en B, C es un subconjunto total de
//       B porque todos los elementos de C están en B. A su vez B es un
//        subconjunto parcial de C porque al menos la mitad de los
//         elementos de B están en C.


function Ej4.cargarConjunto(aSize,aMin,aMax:integer) : boolean;
begin
  if C.LlenarClavesRandom(aSize,aMin,aMax) = OK then Result := True;
end;

function Ej4.mostrarConjunto(aC:Ej4) : string;
begin
  Result := aC.C.RetornarClaves;
end;

procedure Ej4.crearConjunto(aTClave:tipoDatosClave;aSize:integer);
begin
  C.Crear(aTClave,aSize);
end;

end.
