unit TADEjercicio7;

interface

uses
  SysUtils, ArbolesBinarios, Tipos;

const
  tipoClave = Cadena;
  cantElemArbol = 5;

type
  Ej7 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarAnchura() : string;
    function Altura(): Integer;
    function Nivel(X: TipoElemento): Integer;
    function Nodos_Internos(): String;
    function Hojas_Mismo_Nivel(): Boolean;
  End;

implementation

procedure Ej7.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

procedure Ej7.cargarArbol();
begin
  A.CargarArbol;
end;

function Ej7.mostrarAnchura : string;
begin
  Result := A.Anchura;
end;

function Ej7.Nivel(X: TipoElemento): Integer;
var Contador: Integer;
function AUXNivel (Contador: Integer; Posicion: PosicionArbol): Integer;
begin
  if A.RamaNula(A.Padre(Posicion)) then
  begin
    Result := Contador;
  end
  else
  begin
    if (not A.RamaNula(A.Padre(Posicion))) then
    begin
      if A.HijoIzquierdo(A.Padre(Posicion)) = Posicion then
      begin
        Result := AUXNIvel(Contador + 1,A.Padre(Posicion));
      end
      else
      begin
        Result := AUXNIvel(Contador,A.Padre(Posicion));
      end;
    end;
  end;
end;

begin
  Contador := AUXNivel(0,A.BuscarPreOrden(X));
  Result := Contador;
end;

function Ej7.Nodos_Internos() : string;
var S: string;
procedure recuperarInteriores(aP: posicionArbol);
begin
  if not A.RamaNula(aP) then begin
//si no es la raiz y tiene hijo izquierdo o tiene hijo derecho es nodo interior
    if (aP <> A.Root) and ((not A.RamaNula(A.HijoIzquierdo(aP))) and (not A.RamaNula(A.HijoDerecho(aP)))) then begin
      S := S + A.Recuperar(aP).ArmarString + ' | ';
    end;
    recuperarInteriores(A.HijoIzquierdo(aP));
    recuperarInteriores(A.HijoDerecho(aP));
  end;
end;

begin
  S := '';
  recuperarInteriores(A.Root);
  Result := S;
end;

function Ej7.Altura;
var Cont, Izq, Der: Integer;
function AUXAltura(aP: PosicionArbol; Contador: Integer): Integer;
begin
  if (A.RamaNula(A.HijoIzquierdo(aP))) and (A.RamaNula(A.HijoDerecho(aP)))then
  begin
    Result := Contador;
  end
  else
  begin
    if (not A.RamaNula(A.HijoIzquierdo(aP))) or (not A.RamaNula(A.HijoDerecho(aP)))  then
    begin
      Izq := AUXAltura(A.HijoIzquierdo(aP), Contador  + 1 );
      Der := AUXAltura(A.HijoDerecho(aP), Contador);
      if Izq > Der then
      begin
        Result := Izq;
      end
      else
      begin
        Result := Der;
      end;
    end;
  end;

end;

begin
  Cont := AUXAltura(A.Root,1);
  Result := Cont;
end;

//function Ej7.Hojas_Mismo_Nivel(): Boolean;
//var Level: integer;
//    Iguales,Primera: boolean;
//procedure nivelHojas(aP: posicionArbol);
//begin
//  if not A.RamaNula(aP) then begin
//    if (A.RamaNula(A.HijoIzquierdo(aP))) and (A.RamaNula(A.HijoDerecho(aP))) then begin
//      if Primera then begin
//        Level := A.Nivel(aP);
//        Primera := False;
//      end
//      else if A.Nivel(aP) <> Level then Iguales := False;
//    end;
//    nivelHojas(A.HijoIzquierdo(aP));
//    nivelHojas(A.HijoDerecho(aP));
//  end;
//end;
//begin
//  Primera := True;
//  Iguales := True;
//  nivelHojas(A.Root);
//  Result := Iguales;
//end;
//

function Ej7.Hojas_Mismo_Nivel(): Boolean;
var Cont, Izq, Der: Integer;
  Level: Boolean;
function AUXHojas_Mismo_Nivel(aP: PosicionArbol): Integer;
begin
  if (A.RamaNula(A.HijoIzquierdo(aP))) or (not A.RamaNula(A.HijoDerecho(aP))) then
  begin
    Result := Nivel(A.Recuperar(aP));
  end
  else
  begin
    if (not A.RamaNula(A.HijoIzquierdo(aP))) or (not A.RamaNula(A.HijoDerecho(aP)))  then
    begin
      Izq := AUXHojas_Mismo_Nivel(A.HijoIzquierdo(aP));
      Der := AUXHojas_Mismo_Nivel(A.HijoDerecho(aP));
      if Izq = Der then
      begin
        Level := True;
      end
      else
      begin
        Level := False;
      end;
    end;
  end;

end;

begin
  Level := True;
  Cont := AUXHojas_Mismo_Nivel(A.Root);
  Result := Level;
end;


end.
