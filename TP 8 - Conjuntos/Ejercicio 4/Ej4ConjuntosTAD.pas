unit Ej4ConjuntosTAD;

interface

uses
  ConjuntosAVL,Tipos;

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
    function esSubconjunto(aC1,aC2:Ej4) : boolean;
    function pasarElementos(aC:Conjunto) : Conjunto;
  End;

implementation

//Dados dos conjuntos de números naturales se pide determinar si uno es
//subconjunto propio del otro.
//
//Determinar la complejidad algorítmica.
//
//    Ejemplo: si A = (3, 4, 5) y B = (1, 2, 3, 4, 5, 6, 7, 8, 9) entonces
//     a A es un subconjunto propio del conjunto B porque todos los
//      elementos de A están en B pero A <> B.

function Ej4.pasarElementos(aC:Conjunto) : Conjunto;
var
  I: Integer;
  cAux:Conjunto;
  Elem:tipoElemento;
begin
  for I := Min to aC.SizeSet do begin
    Elem := aC.Recuperar(I);
    cAux.Agregar(Elem);
  end;
  Result := cAux;
end;

function Ej4.esSubconjunto(aC1: Ej4; aC2: Ej4) : boolean;
var I: Integer;
    Elem: tipoElemento;
    Subconjunto: boolean;
    cAux:Conjunto;
begin
//  cAux.Crear(aC1.C.DatoDeLaClave,aC1.C.SizeSet);
//  cAux := pasarElementos(aC2);
  Subconjunto := True;
  while (Subconjunto) and (not aC2.C.EsVacio) do begin
    Elem := aC1.C.Recuperar(I);
    if not aC2.C.Pertenece(Elem) then Subconjunto := False
    else aC2.C.Borrar(Elem);
  end;
  if aC2.C.EsVacio then Subconjunto := False;
  Result := Subconjunto;
end;

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
