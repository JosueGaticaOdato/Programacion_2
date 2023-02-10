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
    function mostrarArbolDeExpresion(): String;
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

//Procedimiento que me dice si un nodo del arbol es hoja
function esHoja(aA: Arbol; P: PosicionArbol): boolean;
begin
  Result := ((aA.HijoIzquierdo(P) = Nulo) and (aA.HijoDerecho(P) = Nulo));
end;

//Funcion que verifica si el valor dentro de el nodo hoja es valido (entero)
function esHojaValida(aA: Arbol; P: PosicionArbol): boolean;
var esLetra, esNumero: boolean;
ordinal: integer;
begin
  ordinal := Ord(LowerCase(VarToStr(aA.Recuperar(P).Clave))[1]); //Obtengo el ordinal por si es string
  try
    esLetra :=(ordinal >= 97) and
      (ordinal <= 122) ; //Chequeo si es una letra valida
    esNumero := (VarType(Strtoint(aA.Recuperar(P).Clave)) = varInteger);//Consulto si es numero
    Result := esLetra or esNumero; //Devuelve si es letra o numero
  except //Entra en el except cuando no es un numero valido
    Result := esLetra; //Consulta si es letra
  end;
end;

//Funcion que revisa si es un operador aritmetico valido
function esOperadorValido(aA: Arbol; P: PosicionArbol): boolean;
var
i: integer;
valido: boolean;
begin
  valido := false;
  while (i < length(operadores)) and (not valido) do //Mientras no halla confirmado que sea un operador y no llegue al final
  begin
    if operadores[i] = VarToStr(aA.Recuperar(P).Clave) then //Comparo en mi arreglo de operadores si es valido
    begin
      valido := true;
    end;
    inc(i);
  end;

  Result := valido;
end;

//Funcion principal que me dice si es o no un arbol de expresion
function Ej6.esArbolDeExpresion: Boolean;
var
isAdeExpresion: boolean;

    //Procedimiento que opera con los nodos del arbol
    procedure arbolDeExpresion(aP: PosicionArbol);
    begin
      if (not A.RamaNula(aP)) and (isAdeExpresion) then
      begin
        if esHoja(A,aP) then //Consulto si es hoja
        begin
          if not esHojaValida(A,aP) then isAdeExpresion := false; //Consulto si es una hoja valida (osea, un numero o letra)
        end
        else //Si no es hoja es operador, tengo que comprobar que sea valido
        begin
          if not esOperadorValido(A,aP) then isAdeExpresion := false; //Consulto si es un operador aritmetico valido
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

//Faltan los parentesis
function Ej6.mostrarArbolDeExpresion(): String;
Var
  S: String;
  // Proceso que lee en preorden
     Procedure InOrdenExpresivo(aP: PosicionArbol);
      Begin
        If not A.RamaNula(aP) Then
        begin
          //S := S + '(';
          InOrdenExpresivo(A.HijoIzquierdo(aP)); //Primero Izquierda
          S := S + VarToStr(A.Recuperar(aP).Clave); //Despues raiz
          InOrdenExpresivo(a.HijoDerecho(aP)); //y sigue derecha
          //S := S + ')';
        end;
      End;



// Inicio de la funcion
Begin
  S := '';
  InOrdenExpresivo(A.Root);
  mostrarArbolDeExpresion := S;
End;



end.
