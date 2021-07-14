unit Ej11ArbolesTAD;

interface

uses
  ArbolesBinarios,ArbolesBinariosAVL,Tipos;

const
  tipoClave=Numero;
  cantElem=5;

type
  Ej11 = Object
  private
    ABB : ArbolAVL;
  public
    procedure crearArbolAVL(aTClave:tipoDatosClave;aSize:integer);
    procedure balancearArbol();
    function mostrarArbol() : string;
    function crearArbol() : Arbol;

  End;

implementation

//Generar un algoritmo, recursivo o no, que permita construir un
// árbol binario de búsqueda balanceado (AVL) a partir de un
// árbol binario sin un orden determinado. Comparar las alturas
// ambos árboles.
//
//Determinar la complejidad algorítmica.

function Ej11.mostrarArbol() : string;
begin
  Result := ABB.PreOrden;
end;

function Ej11.crearArbol() : Arbol;
var A:Arbol;
begin
  A.Crear(ABB.DatoDeLaClave,ABB.SizeTree);
  A.CargarArbol;
  Result := A;
end;

procedure Ej11.balancearArbol();
var A:Arbol;
    Nodo,NodoB:posicionArbol;
    Elem:tipoElemento;
    procedure Balanceo(aNodo:posicionArbol);
    begin
      Elem.Clave := Nodo.Datos.Clave;
      ABB.Insertar(Elem);
      NodoB := ABB.BusquedaBinaria(Elem);
      if NodoB.FE < -1 then begin
        if NodoB.HI.FE < 1 then begin
          //rotación izquierda izquierda
          ABB.ConectarHI(NodoB.HI,NodoB.HI.HD);
          ABB.ConectarHD(NodoB.HI.HD, NodoB);
        end
        else begin
          //rotación izquierda derecha
          ABB.ConectarHI(NodoB,NodoB.HI.HD.HD);
          ABB.ConectarHD(NodoB.HI.HD,NodoB);
          ABB.ConectarHD(NodoB.HI,NodoB.HI.HD.HI);
          ABB.ConectarHI(NodoB.HI.HD,NodoB.HI);
        end;
      end
      else if NodoB.FE > 1 then begin
        if NodoB.HD.FE > -1 then begin
          //rotación derecha derecha
          ABB.ConectarHD(NodoB,NodoB.HD.HI);
          ABB.ConectarHI(NodoB.HD,NodoB);
        end
        else begin
          //rotación derecha izquierda
          ABB.ConectarHD(NodoB,NodoB.HD.HI.HI);
          ABB.ConectarHI(NodoB.HD.HI,NodoB);
          ABB.ConectarHI(NodoB.HD,NodoB.HD.HI.HD);
          ABB.ConectarHD(NodoB.HD.HI,NodoB.HD);
        end;
      end;
      Balanceo(A.HijoIzquierdo(Nodo));
      Balanceo(A.HijoDerecho(Nodo));
    end;
begin
  A := crearArbol;

  Elem.Inicializar(ABB.DatoDeLaClave,'');
  Nodo := A.Root;
  Balanceo(Nodo);
end;

procedure Ej11.crearArbolAVL(aTClave:tipoDatosClave;aSize:integer);
begin
  ABB.Crear(aTClave,aSize);
end;

end.
