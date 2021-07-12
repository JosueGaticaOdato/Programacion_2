unit TADEjercicio3;

interface

uses
  ArbolesBinarios, Tipos, ListPointer, SysUtils;

const
  tipoClave = Cadena;
  cantElemArbol = 5;

type
  Ej3 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarAnchura() : string;
    function Hojas(): String;
    function Misma_Estructura(A1,A2: Ej3): Boolean;
  End;

implementation

procedure Ej3.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

procedure Ej3.cargarArbol();
begin
  A.CargarArbol;
end;

function Ej3.mostrarAnchura : string;
begin
  Result := A.Anchura;
end;

function Ej3.Hojas():String;
var Texto: String;
procedure AUXHojas(aP: PosicionArbol);
begin
  if not A.RamaNula(aP) then begin
    if (A.RamaNula(A.HijoIzquierdo(aP))) then begin
      Texto := Texto + A.Recuperar(aP).ArmarString + ' | ';
    end;
    AUXHojas(A.HijoIzquierdo(aP));
    AUXHojas(A.HijoDerecho(aP));
  end;
end;
begin
  Texto := '';
  AUXHojas(A.Root);
  Result := Texto;
end;

function EJ3.Misma_Estructura(A1: Ej3; A2: Ej3): Boolean;
var Texto1, Texto2: String;
  Resultado: Boolean;
begin
  Texto1 := A1.A.Anchura;
  Texto2 := A2.A.Anchura;
  if Length(Texto1) = Length(Texto2) then
  begin
    Resultado := True;
  end
  else
  begin
    Resultado := False;
  end;
  Result := Resultado;
end;

//function Ej3.Misma_Estructura(A1,A2: Ej3): Boolean;
//var Resultado: Boolean;
//procedure AUXMisma_Estructura(aP1, aP2: PosicionArbol);
//begin
//  if (A1.A.HijoIzquierdo(aP1) <>  A2.A.HijoIzquierdo(aP2)) or (A1.A.HijoDerecho(aP1) <>  A2.A.HijoDerecho(aP2))  then
//  begin
//    Resultado := False;
//  end
//  else
//  begin
//    AUXMisma_Estructura(A1.A.HijoIzquierdo(aP1), A2.A.HijoIzquierdo(aP2));
//    AUXMisma_Estructura(A1.A.HijoDerecho(aP1), A2.A.HijoDerecho(aP2));
//  end;
//end;
//begin
//  Resultado := True;
//  AUXMisma_Estructura(A1.A.Root,A2.A.Root);
//  Result := Resultado;
//end;

end.
