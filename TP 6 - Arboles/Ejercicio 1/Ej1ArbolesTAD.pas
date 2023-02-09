unit Ej1ArbolesTAD;

interface

uses
  ArbolesBinarios, Tipos,System.SysUtils,System.Variants;

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
    function obtenerHojas(): String;
    function obtenerNodosInternos(): String;
    function hojasMismoNivel(): boolean;
   function buscarOcurrencias(X: String): string;
  End;

implementation

//Dado un árbol binario no vacío determinar:
//
//Los nodos terminales u hojas.
//Todos los nodos interiores (los que no son ni hojas ni raíz)
//Determinar si todas las hojas están en el mismo nivel.
//Determinar la complejidad algorítmica de los puntos a, b, c.
//

//Procedimiento que crea el arbol dada la clave y el tamaño que tendra
procedure Ej1.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

//Procedimiento que carga el arbol para el usuario
procedure Ej1.cargarArbol();
begin
  A.CargarArbol;
end;

//Funcion que muestra el arbol en forma IN-ORDEN (IZQ,R,DER)
function Ej1.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

//Funcion que muestra el arbol en forma PRE-ORDEN (R,IZQ,DER)
function Ej1.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

//Funcion que muestra el arbol en forma POST-ORDEN (IZQ,DER,R)
function Ej1.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

//Funcion que muestra la anchura del arbol
function Ej1.mostrarAnchura : string;
begin
  Result := A.Anchura;
end;

//Funcion que me devuelve las hojas o nodos terminales del arbol
function Ej1.obtenerHojas(): String;
var
s : String;

  //Procedimiento interno que obtiene las hojas
  procedure buscarHojas(aP: PosicionArbol);
  begin
    if not A.RamaNula(aP) then //Si es rama nula no me sirve, por eso el NOT.
    begin
      if (A.HijoIzquierdo(aP) = Nulo) and (A.HijoDerecho(aP) = Nulo) then //Si tengo nulo el hijo izquierdo y el hijo derecho, es hoja
      begin
        S := S + VarToStr(A.Recuperar(aP).Clave) + ',';
      end;
      //Solamente busco hijos izquierdos y derechos cuando la rama no es nula
      buscarHojas(A.HijoIzquierdo(aP));
      buscarHojas(A.HijoDerecho(aP));
    end;
  end;

begin
  S := '';
  buscarHojas(A.Root);
  obtenerHojas := S;
end;

//Funcion que obtiene los nodos internos de un arbol (no es ni raiz ni hoja)
function Ej1.obtenerNodosInternos(): String;
var
S: String;

  //Procedimiento interno a la funcion que busca los nodos internos
  procedure buscarNodosInternos(aP: PosicionArbol);
  VAR
  isRaiz, tieneHI,tieneHD: boolean;
  begin
    if NOT A.RamaNula(aP) then
    begin
      isRaiz := A.Root = aP; //Consulto si es raiz
      tieneHI := not a.RamaNula(A.HijoIzquierdo(aP)); //Consulto si tiene hijo izquierdo
      tieneHD := not a.RamaNula(A.HijoDerecho(aP)); //Consulto si tiene hijo Derecho
      if (not isRaiz) and (tieneHI or tieneHD) then //Si no es raiz y tiene 1 solo hijo por lo menos
      begin
        S := S + VarToStr(A.Recuperar(aP).Clave) + ',';
      end;
      //Solamente busco hijos izquierdos y derechos cuando la rama no es nula
      buscarNodosInternos(A.HijoIzquierdo(aP));
      buscarNodosInternos(A.HijoDerecho(aP));
    end;
  end;

begin
  S := '';
  buscarNodosInternos(A.Root);
  obtenerNodosInternos := S;
end;

//Funcion que determina si todas las hojas estan en el mismo nivel
function Ej1.hojasMismoNivel(): boolean;
var
isPrimerHoja,isMismoNivel: boolean;
Nivel: Integer;

  procedure buscarYCompararHojas(aP: PosicionArbol);
  begin
    if (not A.RamaNula(aP)) and (isMismoNivel) then //Si es rama nula no me sirve, por eso el NOT.
    begin
      if (A.HijoIzquierdo(aP) = Nulo) and (A.HijoDerecho(aP) = Nulo) then //Si tengo nulo el hijo izquierdo y el hijo derecho, es hoja
      begin
        if isPrimerHoja then //Si es la primera hoja, obtengo el nivel para comparar
        begin
          Nivel := A.Nivel(aP);
          isPrimerHoja := False;
        end;
        if Nivel <> A.Nivel(aP) then isMismoNivel := false; //Si difieren los niveles de hoja entonces no estan al mismo nivel
      end;
      //Solamente busco hijos izquierdos y derechos cuando la rama no es nula
      buscarYCompararHojas(A.HijoIzquierdo(aP));
      buscarYCompararHojas(A.HijoDerecho(aP));
    end;
  end;


begin
  isPrimerHoja := true;
  isMismoNivel := true;
  buscarYCompararHojas(A.Root);
  hojasMismoNivel := isMismoNivel;
end;

//Funcion que busca todas las ocurrencias dentro de un arbol y me devuelve un string con los niveles
function Ej1.buscarOcurrencias(X: String): string;
var
Ocurrencias : String;

  //Procedimiento interno que obtiene las hojas
  procedure buscarOcurrenciasYObtenerNivel(aP: PosicionArbol);
  begin
    if not A.RamaNula(aP) then //Si es rama nula no me sirve, por eso el NOT.
    begin
      if A.Recuperar(aP).Clave = X then //Si es la clave que busco
      begin
        Ocurrencias := Ocurrencias + A.Nivel(aP).toString + ' ,'; //Cargo en el string el nivel donde esta
      end;
      //Solamente busco hijos izquierdos y derechos cuando la rama no es nula
      buscarOcurrenciasYObtenerNivel(A.HijoIzquierdo(aP));
      buscarOcurrenciasYObtenerNivel(A.HijoDerecho(aP));
    end;
  end;

begin
  Ocurrencias := 'Encontrado en los niveles : ';
  buscarOcurrenciasYObtenerNivel(A.Root);
  buscarOcurrencias := Ocurrencias;
end;


end.
