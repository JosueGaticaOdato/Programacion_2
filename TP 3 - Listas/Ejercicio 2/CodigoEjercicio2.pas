unit CodigoEjercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, Vcl.StdCtrls,
  //ListArray;
  ListCursor;
  //ListPointer;

const
  cantElementos = 5;
  minRandom = 1;
  maxRandom = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Lista1: Lista;
  Lista2: Lista;

implementation

{$R *.dfm}

(*
Dadas 2 listas (L1 y L2) determinar si L2 es múltiplo de L1.
Se considera múltiplo si cada elemento L2 se divide en forma
exacta por el valor L1 de la misma posición.

Por Ejemplo: si L1 = (2, 5, 7, 3) y L2 = (8, 20, 28, 12)
entonces L2 es divisible por L1 porque cada posición de L2
se divide por el valor de L1 de la misma posición en forma exacta.
Si el resultado de la división retorna el mismo valor para cada posición
se dice que L2 es múltiplo de L1 por un escalar.
Para este caso 4 es el escalar de L1.
El algoritmo debe contemplar esta situación.
*)

//Procedure que carga la lista siguiendo el ejemplo del ejercicio
procedure Ejemplo(var L1,L2: Lista);
var X:Tipoelemento;
begin
  L1.Crear(Numero,4);
  L2.Crear(Numero,4);
  X.Clave := 2;
  L1.Agregar(X);
  X.Clave := 5;
  L1.Agregar(x);
  X.Clave := 7;
  L1.Agregar(x);
  X.Clave := 3;
  L1.Agregar(x);
  X.Clave := 8;
  L2.Agregar(x);
  X.Clave := 20;
  L2.Agregar(x);
  X.Clave := 28;
  L2.Agregar(x);
  X.Clave := 12;
  L2.Agregar(x);
end;

//Funcion principal que me dice si L2 es divisible de L1
function esDivisible(L1,L2: Lista; var Escalar: Integer): Boolean;
var Posicion1, Posicion2: PosicionLista;
  Valor1, Valor2: TipoElemento;
  Resto, ComprobarEscalar: Integer;
  No_Divisible: Boolean;
begin
  //Obtengo las posiciones y los valores del inicio
  No_Divisible := True;
  //Saco la division exacta para el escalar
  Escalar := L2.Recuperar(L2.Comienzo).Clave / L1.Recuperar(L1.Comienzo).Clave;

  //Mientras no llegue a un valor nulo y no se halla comprobado que es divisible
  while (Posicion1 <> Nulo) and (Posicion2 <> Nulo) and (No_Divisible) do
  begin
    Posicion1 := L1.Comienzo;
    Posicion2 := L2.Comienzo;
    Valor1 := L1.Recuperar(Posicion1);
    Valor2 := L2.Recuperar(Posicion2);
    Resto := Valor2.Clave MOD Valor1.Clave; //Calculo el resto
    ComprobarEscalar := Valor2.Clave / Valor1.Clave; //Calculo el escalar
    if Resto <> 0 then //Si no es 0 no es divisible y ya da falso
    begin
      No_Divisible := False;
    end;
    if (No_Divisible) and (ComprobarEscalar <> Escalar) then //Compruebo si tiene escalar
    begin
      Escalar := 0;
    end;
  end;
  Result := No_Divisible;
end;

//Cargar las listas de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  Lista1.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  Lista2.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  memo1.Lines.Add('Listas cargadas de forma aleatoria satisfactoriamente');
end;

//Mostar las listas
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Contenido lista 1:');
  memo1.Lines.Add(Lista1.RetornarClaves);
  memo1.Lines.Add('Contenido lista 2:');
  memo1.Lines.Add(Lista2.RetornarClaves);
end;

//Cargar con los valores de ejemplo
procedure TForm1.Button3Click(Sender: TObject);
begin
  Ejemplo(Lista1,Lista2);
  memo1.Lines.Add('Cargado con valores del ejemplo');
end;

//Boton que me dice si es divisible o no
procedure TForm1.Button4Click(Sender: TObject);
var Divisible: Boolean;
  Valor: Integer;
begin
  Valor := 0;
  Divisible := esDivisible(Lista1,Lista2, Valor);//Llamo a la funcion
  if Divisible then //Si es disivible, tengo que calcular el escalar
  begin
    memo1.Lines.Add('Es divisible!');
    if Valor <> 0 then //Si es distinto de 0 el escalar, entonces existe
    begin
      memo1.Lines.Add('El escalar es ' + Valor.ToString); //Lo muestro
    end
    else
    begin
      memo1.Lines.Add('No tiene un escalar'); //Sino no tiene
    end;
  end
  else
  begin
    memo1.Lines.Add('No es divisible');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
