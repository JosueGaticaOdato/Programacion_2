unit Ej1ConjuntosTAD;

interface

uses
  Conjuntos,ConjuntosAVL,Tipos;

const
  tipoClave = Cadena;
  cantElem = 5;
  Min = 1;
  Max = 20;

type
  Ej1 = Object
  private
    C: Conjunto;
  public
    function crearConjunto(aTClave:tipoDatosClave;aSize,aMin,aMax:integer) : boolean;
    function mostrarConjunto(aC:Ej1) : string;
    function Union(aC1:Ej1; var aC2: Ej1) : Ej1;
    function Interseccion(aC1:Ej1; var aC2: Ej1) : Ej1;
    function cDiferencia(aC1:Ej1;var aC2: Ej1) : Ej1;
    function Pertenencia(aC:Ej1;aNro:integer) : boolean;
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

function Ej1.Pertenencia(aC: Ej1;aNro:integer) : boolean;
var Elem:tipoElemento;
    Pertenece:boolean;
begin
  Elem.Inicializar(aC.C.DatoDeLaClave,'');
  Elem.Clave := aNro;
  if aC.C.Pertenece(Elem) then Pertenece := True
  else Pertenece := False;
  Result := Pertenece;
end;

function Ej1.mostrarConjunto(aC:Ej1) : string;
begin
  Result := aC.C.RetornarClaves;
end;

function Ej1.crearConjunto(aTClave:tipoDatosClave;aSize,aMin,aMax:integer) : boolean;
begin
  C.Crear(aTClave,aSize);
  C.LlenarClavesRandom(aSize,aMin,aMax)
end;

end.
