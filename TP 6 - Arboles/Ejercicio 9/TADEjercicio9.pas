unit TADEjercicio9;

interface

uses
  ArbolesBinarios, Tipos,System.SysUtils,System.Variants,ArbolesBinariosAVL;

const
  tipoClave = Numero;
  cantElemArbol = 5;

type
  Ej9 = Object
  private
    A : Arbol;
  public
    procedure crearArbol(aTClave:tipoDatosClave;aCant:integer);
    procedure cargarArbol();
    function mostrarInOrden() : string;
    function mostrarPreOrden() : string;
    function mostrarPostOrden() : string;
    function mostrarAnchura() : string;
    function altura: String;
    function crearArbolAVL(): ArbolAVL;
    function mostrarArbolAVL(AVL: ArbolAVL): String;
    function mostrarAlturaArbolAVL(AVL: ArbolAVL): String;
  End;

implementation

//Procedimiento que crea el arbol dada la clave y el tamaño que tendra
procedure Ej9.crearArbol(aTClave:tipoDatosClave;aCant:integer);
begin
  A.Crear(aTClave,aCant);
end;

//Procedimiento que carga el arbol para el usuario
procedure Ej9.cargarArbol();
begin
  A.CargarArbol;
end;

//Funcion que muestra el arbol en forma IN-ORDEN (IZQ,R,DER)
function Ej9.mostrarInOrden() : string;
begin
  Result := A.InOrden;
end;

//Funcion que muestra el arbol en forma PRE-ORDEN (R,IZQ,DER)
function Ej9.mostrarPreOrden() : string;
begin
  Result := A.PreOrden;
end;

//Funcion que muestra el arbol en forma POST-ORDEN (IZQ,DER,R)
function Ej9.mostrarPostOrden;
begin
  Result := A.PostOrden;
end;

//Funcion que muestra la anchura del arbol
function Ej9.mostrarAnchura : string;
begin
  Result := A.Anchura;
end;

//Funcion que muestra la altura del arbol
function Ej9.altura: String;
begin
  Result := A.Altura.ToString;
end;

//Funcion que pasa de un arbol binario comun a un arbol AVL
function Ej9.crearArbolAVL():ArbolesBinariosAVL.ArbolAVL;
var
AVL: ArbolesBinariosAVL.ArbolAVL;
X: TipoElemento;

  //Procedimiento interno que crea el arbol
  procedure CrearAVL(P: ArbolesBinarios.PosicionArbol; var AVL: ArbolesBinariosAVL.ArbolAVL);
  begin
    if (not A.RamaNula(P)) then //Si no es una rama nula
    begin
      X.Clave := A.Recuperar(P).Clave;
      AVL.Insertar(X); //Inserto en el AVL la clave de el binario
      CrearAVL(P.HI,AVL); //Busco los hijos del binario
      CrearAVL(P.HD,AVL);
    end;
  end;

begin
  AVL.Crear(A.DatoDeLaClave,A.CantidadNodos);
  CrearAVL(A.Root,AVL);
  Result := AVL;
end;

//Funcion que muestra el contenido del arbol AVL
function Ej9.mostrarArbolAVL(AVL: ArbolAVL): String;
begin
  Result := 'Pre-Orden:' +  #13#10 + AVL.PreOrden() +
             #13#10 + 'In-Orden:' + #13#10 +   AVL.InOrden +
             #13#10 + 'Post-Orden:' +  #13#10 +  AVL.PostOrden;
end;

//Funcion que muestra la altura del arbol AVL
function Ej9.mostrarAlturaArbolAVL(AVL: ArbolAVL): String;
begin
  Result := AVL.Altura.ToString;
end;

end.
