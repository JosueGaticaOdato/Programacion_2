unit Ej2ArbolesTAD;

interface

uses
  ArbolesBinarios, Tipos, System.Variants,System.SysUtils;

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
    function alturaArbol(): string;
    //Operaciones del ejercicio
    function nombrePadre(Valor: variant): String;
    function listarHijos(Valor: variant) : string;
    function listarHermanos(Valor: variant) : string;
    function Nivel(Valor: Variant): String;
    function Altura(Valor: Variant): String;
    function mismoNivel(Nvl: Variant): string;
    function sonEquivalentes(B: Ej2): boolean;
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

//Procedimiento que crea el arbol
procedure Ej2.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

//Procedimiento que carga el arbol
procedure Ej2.cargarArbol();
begin
  A.CargarArbol;
end;

//Funcion que muestra el recorrido IN ORDEN
function Ej2.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

//Funcion que muestra el recorrido PRE ORDEN
function Ej2.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

//Funcion que muestra el recorrido POST ORDEN
function Ej2.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

//Funcion que muestra el recorrido en ANCHURA
function Ej2.mostrarAnchura : string;
begin
  Result := A.Anchura;
end;

//Funcion que me devuelve la altura del arbol
function Ej2.alturaArbol: string;
begin
  Result := A.Altura.ToString;
end;

//Funcion que me dice quien es el padre de determinado nodo
function Ej2.nombrePadre(Valor: variant): String;
var X, Padre: TipoElemento;
begin
  X.Clave := Valor;
  Padre.Clave := 'No tiene'; //Si no tiene padre, muestro que no tiene
  if A.Padre(A.BuscarPreOrden(X)) <> Nulo //Si tiene padre, lo guardo
    then Padre := A.Padre(A.BuscarPreOrden(X)).Datos;
  Result := Vartostr(Padre.Clave); //Devuelvo el nombre del padre
end;

//Funcion que lista los hijos de un determinado nodo
function Ej2.listarHijos(Valor: Variant): string;
var x: TipoElemento;
S: String;
begin
  X.Clave := Valor;
  S := '';
  //Si tiene hijo izquierdo
  if A.HijoIzquierdo(A.BuscarPreOrden(X)) <> Nulo then
  begin 
    S := S + 'Hijo izquierdo: ' + Vartostr(A.HijoIzquierdo(A.BuscarPreOrden(X)).Datos.Clave);
  end;
  //Si tiene hijo izquierdo
  if A.HijoDerecho(A.BuscarPreOrden(X)) <> Nulo then
  begin
    S := S + ' Hijo derecho: ' + Vartostr(A.HijoDerecho(A.BuscarPreOrden(X)).Datos.Clave);  
  end;
  //Si no tiene hijos
  if (A.HijoIzquierdo(A.BuscarPreOrden(X)) = Nulo) AND (A.HijoDerecho(A.BuscarPreOrden(X)) = Nulo) then S := 'No tiene hijos';
  Result := S;
end;

//Funcion que lista todos los hermanos que tiene determinado nodo
function Ej2.listarHermanos(Valor: Variant): string;
var
S: String;
X: TipoElemento;
Nvl: Integer;

  //Procedimiento interno que busca todos los hermanos
  procedure buscarHermanos(aP: PosicionArbol);
  begin
    if not A.RamaNula(aP) then //Si no es rama nula
    begin
      if (A.Nivel(aP) = Nvl) and (A.Recuperar(aP).Clave <> X.Clave) then //Si coincide el mivel de ese nodo con el nive
      //del nodo que pasaron como parametros y tampoco es el nodo, quiere decir que son hermanos
      begin
        S := S + Vartostr(A.Recuperar(aP).Clave) + ' ';
      end;
      //Sigo con los hermanos
      buscarHermanos(A.HijoIzquierdo(aP));
      buscarHermanos(A.HijoDerecho(aP));
    end;
  end;

begin
  X.Clave := Valor;
  Nvl := A.Nivel(A.BuscarPreOrden(X)); //Obtengo el nivel del nodo buscado
  buscarHermanos(A.Root);
  Result := S;
end;

//Funcion que indica el nivel donde se encuentra un nodo
function Ej2.Nivel(Valor: Variant): string;
var X: TipoElemento;
begin
  X.Clave := Valor;
  Result := A.Nivel(A.BuscarPreOrden(X)).ToString; //Obtengo el nivel del nodo buscado
end;

//Funcion que calcula la altura de un subarbol teniendo como raiz un nodo dado
function Ej2.Altura(Valor: Variant): string;
var
X: TipoElemento;
AlturaVieja: Integer;

  //Procedimiento que busca la altura mas alta de un subarbol
  procedure AlturaDadoUnNodo(aP: PosicionArbol; AlturaAct: Integer);
  begin
    if A.RamaNula(aP) then //Si es rama nula
    begin
      if AlturaAct > AlturaVieja then AlturaVieja := AlturaAct;
      //Tengo que comprobar que la altura sea mayor a la actual,
      //Si es asi la altura actual sera la nueva altura
    end
    else //Sino voy por los hermanos y aumento el contador
    begin
      AlturaDadoUnNodo(A.HijoIzquierdo(aP),AlturaAct + 1);
      AlturaDadoUnNodo(A.HijoDerecho(aP),AlturaAct + 1);
    end;
  end;
begin
  X.Clave := Valor;
  AlturaVieja := 0;
  AlturaDadoUnNodo(A.BuscarPreOrden(X),0);
  Result := AlturaVieja.ToString;
end;

//Funcion que me devuelve los nodos que estan en el mismo nivel
function Ej2.mismoNivel(Nvl: Variant): string;
var
S: String;

  //Procedimiento interno que busca todos los nodos del mismo nivel
  procedure buscarMismoNivel(aP: PosicionArbol);
  begin
    if not A.RamaNula(aP) then //Si no es rama nula
    begin
      if (A.Nivel(aP) = Nvl) then //Si coincide los niveles
      begin
        S := S + Vartostr(A.Recuperar(aP).Clave) + ' ';
      end;
      //Sigo con los hermanos
      buscarMismoNivel(A.HijoIzquierdo(aP));
      buscarMismoNivel(A.HijoDerecho(aP));
    end;
  end;

begin
  buscarMismoNivel(A.Root);
  Result := S;
end;

//Funcion que compara si ambos arbole son equivalentes
function Ej2.sonEquivalentes(B: Ej2): Boolean;
begin
  //Si coinciden el recorrido, son equivalentes
  Result := (A.PreOrden = B.A.PreOrden);
end;

end.
