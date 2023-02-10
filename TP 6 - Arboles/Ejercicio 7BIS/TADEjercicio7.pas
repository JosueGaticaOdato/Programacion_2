unit TADEjercicio7;

interface

uses
  ArbolesBinarios, Tipos,System.SysUtils,System.Variants;

const
  tipoClave = Cadena;
  cantElemArbol = 5;

type

  TPerson = record
    Name: string;
    Age: Integer;
  end;

  Ej7 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;
    function mostrarPreOrden() : string;
    function mostrarPostOrden() : string;
    function mostrarAnchura() : string;
    {function obtenerHojas(): String;
    function obtenerNodosInternos(): String;
    function hojasMismoNivel(): boolean;
   function buscarOcurrencias(X: String): string;}
  End;

implementation

//Procedimiento que crea el arbol dada la clave y el tamaño que tendra
procedure Ej7.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

//Procedimiento que carga el arbol para el usuario
procedure Ej7.cargarArbol();
begin
  A.CargarArbol;
end;

//Funcion que muestra el arbol en forma IN-ORDEN (IZQ,R,DER)
function Ej7.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

//Funcion que muestra el arbol en forma PRE-ORDEN (R,IZQ,DER)
function Ej7.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

//Funcion que muestra el arbol en forma POST-ORDEN (IZQ,DER,R)
function Ej7.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

//Funcion que muestra la anchura del arbol
function Ej7.mostrarAnchura : string;
begin
  Result := A.Anchura;
end;

end.
