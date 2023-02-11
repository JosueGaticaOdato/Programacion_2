unit Ej2ConjuntosTAD;

interface

uses
  ConjuntosAVL,Tipos,Math;

const
  tipoClave = Cadena;
  cantElem = 5;

type
  Ej2 = Object
  private
    C:Conjunto;
  public
    procedure cargarConjunto(aTClave:tipoDatosClave;aSize:integer);
    function mostrarConjunto(aC:Ej2) : string;
    function union3Conjuntos(aC1:Ej2;var aC2:Ej2;var aC3:Ej2) : Ej2;
    function interseccion3Conjuntos(aC1:Ej2;var aC2:Ej2;var aC3:Ej2) : Ej2;
  End;

implementation
//Desarrollar un algoritmo que dados tres conjuntos de elementos tipo
// carácter (char) realice las operaciones de Unión e Intersección.

//Funcion que realiza la interseccion entre 3 conjuntos
function Ej2.interseccion3Conjuntos(aC1: Ej2; var aC2: Ej2; var aC3: Ej2) : Ej2;
var eC:Ej2;
begin
  eC.C := aC1.C.Interseccion(aC2.C); //Primero realizo la interseccion entre dos
  eC.C := eC.C.Interseccion(aC3.C); //El resultado le aplico la interseccion con el tercero
  Result := eC;
end;

//Funcion que realiza la union entre 3 conjuntos
function Ej2.union3Conjuntos(aC1: Ej2; var aC2: Ej2; var aC3: Ej2) : Ej2;
var eC:Ej2;
begin
  eC.C := aC1.C.Union(aC2.C);  //Primero realizo la union entre dos
  eC.C := eC.C.Union(aC3.C); //El resultado le aplico la union con el tercero
  Result := eC;
end;

//Boton que muestra el conjunto
function Ej2.mostrarConjunto(aC: Ej2) : string;
begin
  Result := aC.C.RetornarClaves;
end;

procedure Ej2.cargarConjunto(aTClave: TipoDatosClave; aSize: Integer);
var
  I: Integer;
  Elem:tipoElemento;
begin
  C.Crear(aTClave,aSize);
  //C.LlenarClavesRandom(aSize,Ord('a'),Ord('z'));
  for I := 1 to aSize do begin
    Elem.Clave := Chr(RandomRange(Ord('a'),Ord('z')));
    C.Agregar(Elem);
  end;
end;

end.
