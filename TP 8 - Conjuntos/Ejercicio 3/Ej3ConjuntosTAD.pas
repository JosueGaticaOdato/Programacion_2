unit Ej3ConjuntosTAD;

interface

uses
  ConjuntosAVL,Tipos,Math;

const
  tipoClave = Cadena;
  cantElem = 5;
  Min = 1;
  Vocales : Array[0..4] of char = ('a','e','i','o','u');

type
  Ej3 = Object
  private
    C:Conjunto;
  public
    procedure cargarConjunto(aTClave:tipoDatosClave;aSize:integer);
    function mostrarConjunto(aC:Ej3) : string;
    procedure crearConjunto(aTClave:tipoDatosClave;aSize:integer);
    function vocales(): Conjunto;
    function Consonantes(): Conjunto;
  End;

implementation

//Desarrollar un algoritmo que dado un conjunto de elementos tipo
//carácter (char) cree dos conjuntos, uno con las vocales y otro con
// las consonantes.

procedure Ej3.crearConjunto(aTClave: TipoDatosClave; aSize: Integer);
begin
  C.Crear(aTClave,aSize);
end;

//Funcion que crea el conjunto de las vocales
function crearVocales():Conjunto;
var I:integer;
    Elem:tipoElemento;
    CV: Conjunto;
begin
  CV.Crear(tipoClave,length(vocales));
  for I := 0 to length(vocales) do begin
    Elem.Clave := Vocales[I];
    CV.Agregar(Elem);
  end;
  Result := CV;
end;

//Funcion que obtiene las vocales de un conjunto
//Realizo la interseccion con mi conjunto de vocales, y las que estaran en el medio son las que pertenecen a ambos bandos
function Ej3.vocales(): Conjunto;
var misVocales: Conjunto;
begin
  misVocales := crearVocales();
  Result := C.Interseccion(misVocales);
end;

//Funcion que obtiene las Consonantes de un conjunto
//Realizo la Diferencia con mi conjunto de vocales, y las que estaran del lado del conjunto seran las que no son vocales
function Ej3.Consonantes(): Conjunto;
var misVocales: Conjunto;
begin
  misVocales := crearVocales();
  Result := C.Diferencia(misVocales);
end;

//Funcion que muestra el contenido del conjunto
function Ej3.mostrarConjunto(aC: Ej3) : string;
begin
  Result := C.RetornarClaves;
end;

//Procedimiento que carga el conjunto de forma aleatoria con chars
procedure Ej3.cargarConjunto(aTClave: TipoDatosClave; aSize: Integer);
var I:integer;
    Elem:tipoElemento;
begin
  C.Crear(aTClave,aSize);
  for I := Min to aSize do begin
    Elem.Clave := Chr(randomRange(Ord('a'),Ord('z')));
    C.Agregar(Elem);
  end;
end;

end.
