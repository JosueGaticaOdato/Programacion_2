unit CodigoEjercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  ListArray,
  //ListCursor,
  //LisPointer,
  StackArray,
  //StackPointer,
  //StackCursor,
  QueuesArrayNCMejorada;
  //QueuesCursor;
  //QueuesPointer;

const
  TamañoLista = 5;
  TamañoCola = 6;
  TamañoPila = 5;
  MaxRandom = 10;
  MinRandom = 1;

  ejemploPila: Array[0..5] of Integer = (2, 5, 8, 19, 3, 4);
  ejemploCola: Array[0..4] of Integer = (4, 18, 12, 5, 6);

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    C: Cola;
    P: Pila;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 5
Dada una pila y una cola generada con valores al azar retornar en una lista todos los valores comunes a ambas
y en qué posición ordinal se encontró cada uno en su estructura. No se deben destruir las estructuras originales.

Determinar la complejidad algorítmica de la solución empleada.

Ejemplo: si P = (2, 5, 8, 19, 3, 4) y C = (4, 18, 12, 5, 6) la lista tendría L = (4:1:1, 5:5:4).
}


//Funcion que busca una clave dentro de la pila. Si existe devuelve veradero (funcion sacada del
//ejercicio 1, pero modificada para este ejercicio)
function buscarClave(var P: Pila;X: TipoElemento; VAR Pos: Integer): Boolean;
var Y: TipoElemento;
  Encontrado: Boolean;
  PAuxiliar : Pila;
begin
  Encontrado := False;
  Pos := 1; //Ahora posicion me dira el lugar donde esta el lugar
  PAuxiliar.Crear(Numero,P.SizeStack); //Creo la pila auxilar para no perder la pila origen
  while not P.EsVacia and (not Encontrado) do //Mientras la pila no este vacia y no halla encontra mi clave
  begin
    Y := P.Recuperar; //Recupero la clave del tope
    if X.Clave = y.Clave then //Comparo si es la que busco
    begin
      Encontrado := True; //Si es devuelvo true
    end
    else
    begin //Sino, apilo en la auxiliar y desapilo en la origen
      PAuxiliar.Apilar(Y);
      P.DesApilar;
      Inc(Pos);
    end;
  end;
  P.InterCambiar(PAuxiliar,false); //Recupero la pila origen
  Result := Encontrado;
end;

//Procedimiento que agrega a la lista el valor en comun como string
procedure agregarALista(var L: Lista; Valor: TipoElemento; PP,PC: Integer);
var XL: TipoElemento;
begin
  XL.Clave := '(' + Vartostr(Valor.Clave) +  ':' + PP.ToString + ':' + PC.ToString + ')';
  L.Agregar(XL);
end;


{
Complejidad algoritmica lineal:
.Recupero el tope de la cola
.Busco en la pila y voy desapilando a medida que voy buscando
.Si esta el valor lo agrego a la lista como una cadena de string
}


//Funcion que busca los valores en comun entre una cola y una pila, y los guarda en una lista
function valoresEnComun(VAR C:Cola; VAR P: Pila): Lista;
var
Xc: TipoElemento;
CopiaC: Cola;
PosP,PosC: Integer;
L: Lista;
begin
  L.Crear(Cadena,C.SizeQueue); //Creo la lista, con el tamaño de cualquier de los dos elementos
  CopiaC := C; //CopiaC sera mi Cola a recorrer, es una Copia de mi cola origen
  PosC := 1; //Posicion dentro de la Cola
  while (not CopiaC.EsVacia) do //Recorro la cola
  begin
    Xc := CopiaC.Recuperar; //Recupero el tope
    if buscarClave(P,Xc,PosP) then //Busco en la pila para ver si esta ese elemento
    begin
      agregarALista(L,Xc,PosP,PosC); //Agrego a la lista si esta
    end;
    CopiaC.DesEncolar; //Desencolo y sigo buscando
    Inc(PosC); //Aumento la posicion
  end;
  Result := L; //Devuelvo la lista resultado con los valores en comun
end;

//Boton que carga aleatoria las listas
procedure TForm1.Button1Click(Sender: TObject);
begin
  C.LLenarClavesRandom(TamañoCola,MinRandom,MaxRandom);
  P.LLenarClavesRandom(TamañoCola,MinRandom,MaxRandom);
  memo1.Lines.Add('Cargadas aleatoriamente');
end;

//Procedimiento que carga como el ejemplo ambas estructuras lineales
procedure cargarPilayColaEjemplo(VAR C: Cola; VAR P: Pila);
var x: TipoElemento;
i: integer;
begin
  P.Crear(Numero,length(ejemploPila));
  C.Crear(Numero,length(ejemploCola));
  i := 0;
  while i < length(ejemploPila) do
  begin
    X.Clave := ejemploPila[i];
    P.Apilar(X);
    inc(i);
  end;
  i := 0;
  while i < length(ejemploCola) do
  begin
    X.Clave := ejemploCola[i];
    C.Encolar(X);
    inc(i);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  cargarPilayColaEjemplo(C,P);
  memo1.Lines.Add('Cargado como el ejemplo');
end;

//Boton que muestra el contenido de ambas estructuras
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.add('Pila');
  memo1.Lines.Add(P.RetornarClaves);
  memo1.Lines.add('Cola');
  memo1.Lines.Add(C.RetornarClaves);
end;

//Boton que me muestra los valores comunes entre ambas estructuras
procedure TForm1.Button4Click(Sender: TObject);
var L: Lista;
begin
  L := valoresEnComun(C,P);
  memo1.Lines.Add('Valores en comun');
  memo1.Lines.Add(L.RetornarClaves);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C.Crear(Numero,TamañoCola);
  P.Crear(Numero,TamañoPila);
end;

end.
