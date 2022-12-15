unit Ej1ArbolesTAD;

interface

uses
  ArbolesBinarios, Tipos;

const
  tipoClave = Numero;
  cantElemArbol = 5;

type
  Ej1 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;
    function mostrarPreOrden() : string;
    function mostrarPostOrden() : string;
    function mostrarAnchura() : string;
    function determinarHojas(aA:Ej1) : string;
    function nodosInteriores(aA:Ej1) : string;
    function mismoNivelHojas(aA:Ej1) : boolean;
  End;

implementation

//Dado un árbol binario no vacío determinar:
//
//Los nodos terminales u hojas.
//Todos los nodos interiores (los que no son ni hojas ni raíz)
//Determinar si todas las hojas están en el mismo nivel.
//Determinar la complejidad algorítmica de los puntos a, b, c.
//
procedure Ej1.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

procedure Ej1.cargarArbol();
begin
  A.CargarArbol;
end;

function Ej1.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

function Ej1.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

function Ej1.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

function Ej1.mostrarAnchura : string;

begin
  Result := A.Anchura;
end;

function Ej1.determinarHojas(aA:Ej1) : string;
var S: string;
procedure recuperarHojas(aP: posicionArbol);
begin
  if not aA.A.RamaNula(aP) then begin
    if (aA.A.RamaNula(aA.A.HijoIzquierdo(aP))) and (aA.A.RamaNula(aA.A.HijoDerecho(aP))) then begin
      S := S + aA.A.Recuperar(aP).ArmarString + ' | ';
    end;
    recuperarHojas(aA.A.HijoIzquierdo(aP));
    recuperarHojas(aA.A.HijoDerecho(aP));
  end;
end;

begin
  S := '';
  recuperarHojas(aA.A.Root);
  Result := S;
end;

function Ej1.nodosInteriores(aA:Ej1) : string;
var S: string;
procedure recuperarInteriores(aP: posicionArbol);
begin
  if not aA.A.RamaNula(aP) then begin
//si no es la raiz y tiene hijo izquierdo o tiene hijo derecho es nodo interior
    if (aP <> aA.A.Root) and ((not aA.A.RamaNula(aA.A.HijoIzquierdo(aP))) or (not aA.A.RamaNula(aA.A.HijoDerecho(aP)))) then begin
      S := S + aA.A.Recuperar(aP).ArmarString + ' | ';
    end;
    recuperarInteriores(aA.A.HijoIzquierdo(aP));
    recuperarInteriores(aA.A.HijoDerecho(aP));
  end;
end;

begin
  S := '';
  recuperarInteriores(aA.A.Root);
  Result := S;
end;

function Ej1.mismoNivelHojas(aA: Ej1) : boolean;
var Nivel: integer;
    Iguales,Primera: boolean;
procedure nivelHojas(aP: posicionArbol);
begin
  if not aA.A.RamaNula(aP) then begin
    if (aA.A.RamaNula(aA.A.HijoIzquierdo(aP))) and (aA.A.RamaNula(aA.A.HijoDerecho(aP))) then begin
      if Primera then begin
        Nivel := aA.A.Nivel(aP);
        Primera := False;
      end
      else if aA.A.Nivel(aP) <> Nivel then Iguales := False;
    end;
    nivelHojas(aA.A.HijoIzquierdo(aP));
    nivelHojas(aA.A.HijoDerecho(aP));
  end;
end;
begin
  Primera := True;
  Iguales := True;
  nivelHojas(aA.A.Root);
  Result := Iguales;
end;


end.
