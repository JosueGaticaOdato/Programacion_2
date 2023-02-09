unit TADEjercicio6;

interface

uses
  ArbolesBinarios,Tipos,System.SysUtils,System.Variants;

const
  tipoClave = Cadena;
  cantElemArbol = 5;

  Operadores: Array [0..3] of String = ('+','-','*','/');

type
  Ej6 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;
    function mostrarPreOrden() : string;
    function mostrarPostOrden() : string;
    function mostrarAnchura() : string;
    function esArbolDeExpresion(): boolean;
    function calcularArbolDeExpresion(): String;
  End;

  //Operadores = (+,-,*,/);

implementation

//Procedimiento que crea el arbol dada la clave y el tamaño que tendra
procedure Ej6.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

//Procedimiento que carga el arbol para el usuario
procedure Ej6.cargarArbol();
begin
  A.CargarArbol;
end;

//Funcion que muestra el arbol en forma IN-ORDEN (IZQ,R,DER)
function Ej6.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

//Funcion que muestra el arbol en forma PRE-ORDEN (R,IZQ,DER)
function Ej6.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

//Funcion que muestra el arbol en forma POST-ORDEN (IZQ,DER,R)
function Ej6.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

//Funcion que muestra la anchura del arbol
function Ej6.mostrarAnchura : string;
begin
  Result := A.Anchura;
end;

function esHoja(aA: Arbol; P: PosicionArbol): boolean;
begin
  Result := ((aA.HijoIzquierdo(P) = Nulo) and (aA.HijoDerecho(P) = Nulo));
end;

function esHojaValida(aA: Arbol; P: PosicionArbol): boolean;
begin
  Result := VarType(aA.Recuperar(P).Clave) = varInteger;
end;

function esOperadorValido(aA: Arbol; P: PosicionArbol): boolean;
var
i: integer;
valido: boolean;
begin
  valido := false;
  while (i < length(operadores)) and (not valido) do
  begin
    if operadores[i] = VarToStr(aA.Recuperar(P).Clave) then
    begin
      valido := true;
    end;
    inc(i);
  end;

  Result := valido;
end;

function Ej6.esArbolDeExpresion: Boolean;
var
isAdeExpresion: boolean;

    procedure arbolDeExpresion(aP: PosicionArbol);
    begin
      if (not A.RamaNula(aP)) and (isAdeExpresion) then
      begin
        if esHoja(A,aP) then //Consulto si es hoja
        begin
          if not esHojaValida(A,aP) then isAdeExpresion := false;
        end
        else //Si no es hoja es operador, tengo que comprobar que sea valido
        begin
          if not esOperadorValido(A,aP) then isAdeExpresion := false;
        end;
        arbolDeExpresion(A.HijoIzquierdo(aP));
        arbolDeExpresion(A.HijoDerecho(aP));
      end;
    end;

begin
  isAdeExpresion := true;
  arbolDeExpresion(A.Root);
  result := isAdeExpresion;
end;

function Ej6.calcularArbolDeExpresion: string;
begin

end;

end.
