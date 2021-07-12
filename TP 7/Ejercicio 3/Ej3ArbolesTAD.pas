unit Ej3ArbolesTAD;

interface

uses
  ArbolesBinarios,Tipos,ListArray;

const
  tipoClave = Cadena;
  cantElemArbol = 5;

type
  Ej3 = Object
  private
    A : Arbol;
  public
    function recorridoAnchura(aAN:arbol) : Lista;
    function pasarNArioABinario(var aAN:arbol) : Arbol;
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;

  End;

implementation


//Dado un árbol n-ario, devolver en forma de lista el resultado del recorrido
// en anchura del árbol.
//Escribir una función que, dado un árbol n-ario, devuelva el número de hojas de
// dicho árbol.
//Escribir una función booleana que dados dos árboles generales determine si
// tienen la misma estructura, sin importar los datos del mismo (árbol similar).

function Ej3.pasarNArioABinario(var aAN:arbol) : Arbol;
var arbolB: arbol;
begin
  aAN.Root := arbolB.Root;
  aAN.Root.HI
end;

function Ej3.recorridoAnchura(aAN:arbol) : Lista;
begin
  aAN.Root;
end;

procedure Ej3.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

procedure Ej3.cargarArbol();
begin
  A.CargarArbol;
end;

function Ej3.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

end.
