unit Ej2ArbolesTAD;

interface

uses
  ArbolesBinarios, Tipos;

const
  tipoClave = Numero;
  cantElemArbol = 5;

type
  Ej2 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;
    function mostrarPreOrden() : string;
    function mostrarPostOrden() : string;
    function mostrarAnchura() : string;
    function indicarPadre(aP:posicionArbol) : string;
  End;

implementation

//Para un nodo del árbol binario determinado:
//
//    Indicar el nombre del nodo padre.
//    Listar los hijos.
//    Listar los hermanos.
//    Calcular el nivel en el que se encuentra.
//    Calcular la altura de su rama (Altura del Subárbol).
//    Listar todos los nodos que están en el mismo nivel.

function Ej2.indicarPadre(aP: PosicionArbol) : string;
begin
  Result := A.Padre(aP);
end;

procedure Ej2.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

procedure Ej2.cargarArbol();
var Elem: tipoElemento;
  procedure Load(var aP:posicionArbol);
  begin
    Elem.Clave :=
  end;
begin
  Elem.Valor2 := nil;
  Load(A.Root);
end;

function Ej2.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

function Ej2.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

function Ej2.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

function Ej2.mostrarAnchura : string;

begin
  Result := A.Anchura;
end;



end.
