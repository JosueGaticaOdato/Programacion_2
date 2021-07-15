unit Ej3ConjuntosTAD;

interface

uses
  ConjuntosAVL,Tipos,Math;

const
  tipoClave = Cadena;
  cantElem = 5;
  Min = 1;
  //Vocales : Array[1..5] of char = ('a','e','i','o','u');

type
  Ej3 = Object
  private
    C:Conjunto;
  public
    procedure cargarConjunto(aTClave:tipoDatosClave;aSize:integer);
    function mostrarConjunto(aC:Ej3) : string;
    procedure conjuntoVocalesConsonantes(aC1:Ej3;var aC2: Ej3;var aC3:Ej3);
    procedure crearConjunto(aTClave:tipoDatosClave;aSize:integer);
  End;

implementation

//Desarrollar un algoritmo que dado un conjunto de elementos tipo
//carácter (char) cree dos conjuntos, uno con las vocales y otro con
// las consonantes.

procedure Ej3.crearConjunto(aTClave: TipoDatosClave; aSize: Integer);
begin
  C.Crear(aTClave,aSize);
end;

procedure Ej3.conjuntoVocalesConsonantes(aC1:Ej3;var aC2: Ej3;var aC3:Ej3);
var Elem:tipoElemento;
    I:integer;
begin
  for I := Min to aC1.C.SizeSet do begin
    Elem := aC1.C.Recuperar(I);
    if (Elem.Clave = 'A') or (Elem.Clave = 'E') or (Elem.Clave = 'I') or (Elem.Clave = 'O') or (Elem.Clave = 'U')then begin
      aC2.C.Agregar(Elem);
    end
    else aC3.C.Agregar(Elem);
  end;
end;

function Ej3.mostrarConjunto(aC: Ej3) : string;
begin
  Result := C.RetornarClaves;
end;

procedure Ej3.cargarConjunto(aTClave: TipoDatosClave; aSize: Integer);
var I:integer;
    Elem:tipoElemento;
begin
  C.Crear(aTClave,aSize);
  for I := Min to aSize do begin
    Elem.Clave := Chr(randomRange(Ord('A'),Ord('Z')));
    C.Agregar(Elem);
  end;
end;

end.
