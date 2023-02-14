unit Parcial2021;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, ArbolesBinarios, StackPointer,QueuesPointer,
  ListArray;
  //ListPointer;
  //ListCursor;

const
  n = 3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//--------------------- Ejercicio 4 -------------------
{
a) Proponer una estructura de datos (puede ser una sola o una combinación de las
estructuras vistas en la materia) a utilizar para guardar los datos de manera que la
inserción sea rápida y las búsquedas sean lo más eficiente posibles y justificar.
  Arbol AVL teniendo como clave el numero de mesa, los demas campos son el distrito, provincia y los votos,
  que estaran en un record (X.valor2 pointer)
  Insercion mediante numero de mesa, garantizando una busqueda binaria para encontrar los votos de 1 messa.


b) Determinar la complejidad algorítmica de una inserción y justificar.

  Arbol AVL insercion:
    .Realizar la insecion dentro de un nodo hoja, buscando la posicion donde estara (busqueda binaria) log n
    .Inserta la clave y comprobar si no afecta el FE del arbol, si es asi se aplican las rotaciones y demas O(constante)

  O(log n)

c) Para la estructura definida, determinar la complejidad algorítmica de cada una de las
consultas solicitadas y justificar

• Listar cada candidato junto a su conteo de votos totales (entre todas las mesas del
país).
  .Realizar el recorrido del arbol de forma lineal (O(N))
  .Obtener los datos de cada candidado y almacenarlos (O(1))

  O(N)


• Dada una mesa, ver cuántos emitieron su voto en la misma.
  .Realizar la busqueda binaria de la mesa O(Log n)
  .Obtener la cantidad total de votos sumando todos los votoso emitidos O(constante)

  O(Log N)
}

//--------------------- Ejercicio 3 -------------------

function longitudMasLarga(Var C: Cola): Integer;
var
longitud,longitudMayor: integer;
x1,anterior: TipoElemento;
begin
  longitudMayor := 0;
  longitud := 0;
  anterior.clave := 0;
  while not C.EsVacia do
  begin
    X1 := C.Recuperar;
    if anterior.clave > x1.clave then
    begin
      if longitud > longitudMayor then
      begin
        longitudMayor := longitud;
      end;
      anterior := x1;
      longitud := 1;
    end
    else
    begin
      anterior := x1;
      inc(longitud);
    end;
    C.DesEncolar;
  end;

  Result := longitudMayor;
end;

//Cargar la lista como el ejemplo
procedure cargarCola(var C: Cola);
var X: TipoElemento;
begin
  // 3, 7, 1, 9, 22, 23, 6, 7, 12, 1, 2, 4, 2.
  X.Clave := 3;
  C.Encolar(X);
  X.Clave := 7;
  C.Encolar(X);
  X.Clave := 1;
  C.Encolar(X);
  X.Clave := 9;
  C.Encolar(X);
  X.Clave := 22;
  C.Encolar(X);
  X.Clave := 23;
  C.Encolar(X);
  X.Clave := 6;
  C.Encolar(X);
  X.Clave := 7;
  C.Encolar(X);
  X.Clave := 12;
  C.Encolar(X);
  X.Clave := 1;
  C.Encolar(X);
  X.Clave := 2;
  C.Encolar(X);
  X.Clave := 4;
  C.Encolar(X);
  X.Clave := 2;
  C.Encolar(X);
end;

//--------------------- Ejercicio 2 -------------------

Function recorridoArbolRecursivo(Var A:Arbol): Lista;
var
x: TipoElemento;
LA: Lista;

  procedure rARecursivo(P: PosicionArbol);
  begin
    if not A.RamaNula(P) then
    begin
      rARecursivo(A.HijoDerecho(P));
      rARecursivo(A.HijoIzquierdo(P));
      X := A.Recuperar(P);
      LA.Agregar(x);
    end;
  end;

begin
  LA.Crear(A.DatoDeLaClave,A.CantidadNodos);
  rARecursivo(A.Root);
  Result := LA;
end;

function recorridoArbolIterativo(Var A:Arbol): Lista;
var
x: TipoElemento;
LA: Lista;
Stack: Pila;
P: PosicionArbol;
begin
  Stack.Crear(A.DatoDeLaClave,A.CantidadNodos);
  LA.Crear(A.DatoDeLaClave,A.CantidadNodos);
  P := A.Root;
  X := A.Recuperar(P);
  Stack.Apilar(X);
  while not Stack.EsVacia do
  begin
    Stack.Apilar(A.Recuperar(A.HijoDerecho(P)));
    Stack.Apilar(A.Recuperar(A.HijoIzquierdo(P)));
    X := Stack.Recuperar;
    LA.Agregar(X);
    Stack.DesApilar;
  end;

  Result := LA;
end;


//--------------------- Ejercicio 1 -------------------

//función que dada una lista L, agrupa de a n elementos dejando su suma.
Function junta(L: Lista; n: integer): Lista;
var
i: PosicionLista;
sumador,agrupados: integer;
X: TipoELemento;
LJ: Lista;
begin
  LJ.Crear(L.DatoDeLaClave,L.SizeList);
  i := L.Comienzo;
  sumador := 0;
  while L.ValidarPosicion(i) do //Otra forma de recorrer la lista
  begin
    X := L.Recuperar(I);
    inc(agrupados);
    sumador := sumador + X.Clave;
    if agrupados = n then
    begin
      X.Clave := sumador;
      LJ.Agregar(x);
      sumador := 0;
      agrupados := 0;
    end;
    I := L.Siguiente(I);
  end;
  X.Clave := sumador;
  LJ.Agregar(x);

  Result := LJ;
end;

//Cargar la lista como el ejemplo
procedure cargarLista(var L: Lista);
var X: TipoElemento;
begin
  //[1, 3, 2, 4, 5, 2, 2, 3, 4, 7, 4, 3, 2, 2]
  X.Clave := 1;
  L.Agregar(X);
  X.Clave := 3;
  L.Agregar(X);
  X.Clave := 2;
  L.Agregar(X);
  X.Clave := 4;
  L.Agregar(X);
  X.Clave := 5;
  L.Agregar(X);
  X.Clave := 2;
  L.Agregar(X);
  X.Clave := 2;
  L.Agregar(X);
  X.Clave := 3;
  L.Agregar(X);
  X.Clave := 4;
  L.Agregar(X);
  X.Clave := 7;
  L.Agregar(X);
  X.Clave := 4;
  L.Agregar(X);
  X.Clave := 3;
  L.Agregar(X);
  X.Clave := 2;
  L.Agregar(X);
  X.Clave := 2;
  L.Agregar(X);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
L,LJ: Lista;
begin
  L.Crear(Numero,20);
  cargarLista(L);
  LJ := junta(L,n);
  MEMO1.Lines.Add(LJ.RetornarClaves);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
A: Arbol;
L1,L2: Lista;
begin
  A.Crear(Cadena,20);
  A.CargarArbol;
  L1 := recorridoArbolRecursivo(A);
  MEMO1.Lines.Add(L1.RetornarClaves);
  L2 := recorridoArbolRecursivo(A);
  MEMO1.Lines.Add(L1.RetornarClaves);
end;

procedure TForm1.Button3Click(Sender: TObject);
var C: Cola;
begin
  C.Crear(Numero,20);
  cargarCola(C);
  memo1.Lines.Add(LongitudMasLarga(C).ToString);
end;

end.
