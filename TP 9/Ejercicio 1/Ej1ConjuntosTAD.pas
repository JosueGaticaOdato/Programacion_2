unit Ej1ConjuntosTAD;

interface

uses
  Conjuntos,ConjuntosAVL,Tipos,Math;

const
  tipoClave = Cadena;
  cantElem = 5;
  Min = 1;

type
  Ej1 = Object
  private
    C: Conjunto;
  public
    function crearConjunto(aTClave:tipoDatosClave;aSize,aMin:integer) : boolean;
    function mostrarConjunto(aC:Ej1) : string;
    function Union(aC1:Ej1; var aC2: Ej1) : Ej1;
    function Interseccion(aC1:Ej1; var aC2: Ej1) : Ej1;
    function cDiferencia(aC1:Ej1;var aC2: Ej1) : Ej1;
    function Pertenencia(aC:Ej1;aClave:string) : boolean;
  End;

implementation

//Desarrollar un algoritmo que dados dos conjuntos de elementos tipo
// carácter (char) verifique las operaciones de Unión, Intersección,
//  Diferencia y Pertenencia.

function Ej1.Union(aC1:Ej1; var aC2: Ej1) : Ej1;
var eC:Ej1;
begin
  eC.C := aC1.C.Union(aC2.C);
  Result := eC;
end;

function Ej1.Interseccion(aC1:Ej1; var aC2: Ej1) : Ej1;
var eC:Ej1;
begin
  eC.C := aC1.C.Interseccion(aC2.C);
  Result := eC;
end;

function Ej1.cDiferencia(aC1:Ej1;var aC2: Ej1) : Ej1;
var eC:Ej1;
begin
  eC.C := aC1.C.Diferencia(aC2.C);
  Result := eC;
end;

function Ej1.Pertenencia(aC: Ej1;aClave:string) : boolean;
var Elem:tipoElemento;
    Pertenece:boolean;
begin
  Elem.Inicializar(aC.C.DatoDeLaClave,'');
  Elem.Clave := aClave;
  if aC.C.Pertenece(Elem) then Pertenece := True
  else Pertenece := False;
  Result := Pertenece;
end;

function Ej1.mostrarConjunto(aC:Ej1) : string;
begin
  Result := aC.C.RetornarClaves;
end;

function Ej1.crearConjunto(aTClave:tipoDatosClave;aSize,aMin:integer) : boolean;
var
  I: Integer;
  Elem:tipoElemento;
begin
  C.Crear(aTClave,aSize);
  Randomize;
  for I := aMin to aSize do begin
    Elem.Clave := Chr(RandomRange(Ord('A'),Ord('z')));
    C.Agregar(Elem);
  end;
end;

end.
