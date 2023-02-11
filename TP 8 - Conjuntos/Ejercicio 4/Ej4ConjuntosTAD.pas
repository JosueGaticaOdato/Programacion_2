unit Ej4ConjuntosTAD;

interface

uses
  ConjuntosAVL,Tipos;

const
  tipoClave = Numero;
  cantElem = 3;
  Min = 1;
  Max = 10;
  cantElem2 = 5;

type
  Ej4 = Object
  private
    C:Conjunto;
  public
    procedure crearConjunto(aTClave:tipoDatosClave;aSize:integer);
    procedure cargarConjunto();
    procedure cargarConjuntoSub();
    function mostrarConjunto(aC:Ej4) : string;
    function esSubconjunto(C2:Ej4) : boolean;
    procedure cargarEjemplo(var C2: Ej4);
  End;

implementation

//Funcion que determina si es C1 es subconjunto de C2
function Ej4.esSubconjunto(C2:Ej4) : boolean;
var
Inter: Conjunto;
begin
  Inter := C.Interseccion(C2.C); //Obtengo la interseccion entre C1 Y C2
  //Si coincide las claves de C y Inter (osea, que son iguales sus conjuntos), entonces es subconjunto
  Result := (C.RetornarClaves = Inter.RetornarClaves) and (C.RetornarClaves <> C2.C.RetornarClaves);
end;

//Procedimiento que carga el ejemplo
procedure Ej4.cargarEjemplo(var C2: Ej4);
var
  I: Integer;
  X: TipoElemento;
begin
  C.Crear(Numero,3);
  C2.C.Crear(Numero,9);
  for I := 1 to 9 do
  begin
    X.Clave := I;
    C2.C.Agregar(X);
    if (I >= 3) and (I <= 5) then C.Agregar(X);
  end;

end;

//Funcion que carga el conjunto de forma random
procedure Ej4.cargarConjunto();
begin
  C.LlenarClavesRandom(CantElem2,Min,Max);
end;

//Funcion que carga el conjunto de forma random
procedure Ej4.cargarConjuntoSub();
begin
  C.LlenarClavesRandom(cantElem,Min,Max);
end;

//Funcion que muestra el contenido del conjunto
function Ej4.mostrarConjunto(aC:Ej4) : string;
begin
  Result := aC.C.RetornarClaves;
end;

//Procedmineto que crea el conjunto dado un tamaño y tipo de clave
procedure Ej4.crearConjunto(aTClave:tipoDatosClave;aSize:integer);
begin
  C.Crear(aTClave,aSize);
end;


end.
