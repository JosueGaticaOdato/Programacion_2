unit CodigoEJercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, Vcl.StdCtrls,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  cantElementos = 6;
  cantElementosSubLista = 3;
  minRandom = Ord('A');
  maxRandom = Ord('Z');

type
  TForm1 = class(TForm)
    Button4: TButton;
    Button2: TButton;
    Button3: TButton;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

{
Ejercicio 4
Generar un algoritmo que determine si una lista
es sublista de otra. Se considera que es una sublista si
todos los valores de la segunda se encuentran dentro de
la primera sin importar el orden o posición de cada elemento.
Se pide además determinar la complejidad algorítmica de la solución.

Ejemplo: si L1 contiene los elementos (A, Z, B, D, H, K)
y L2 contiene los elementos (D, K, A) se dice que L2 es sublista de L1.
}

//Funcion que me dice si L2 es sublista de L1
function SubLista(L1,L2: Lista): Boolean;
var Posicion1, Posicion2: PosicionLista;
  Valor1, Valor2: TipoElemento;
  Bandera1, Bandera2: Boolean;
begin
  Bandera2:= True;
  Posicion2 := L2.Comienzo;
  while (Posicion2 <> Nulo) and Bandera2 do //Recorro la lista2 primero
  begin
    Valor2 := L2.Recuperar(Posicion2);
    Posicion1 := L1.Comienzo;
    Bandera1 := True;
    while (Posicion1 <> Nulo) and Bandera1 do //Recorro la lista2
    begin
      Valor1 := L1.Recuperar(Posicion1);
      if Valor1.Clave = Valor2.Clave then //Comparo cada valor de L1 con el valor de L2
      begin
        Bandera1 := False; //Si son iguales quiere decir que esta el elemento L2 en L1
      end
      else
      begin
        Posicion1 := L1.Siguiente(Posicion1);
      end;
    end;

    if Posicion1 = Nulo then //Al final del bucle, consulto si estoy en nulo, ya que este
    //determina si llegue al final de la lista y no encontre el valor
    begin
      Bandera2 := False;
    end;
    Posicion2 := L2.Siguiente(Posicion2);
  end;
  Result := Bandera2; //Devuelvo la bandera 2
end;

//Procedure que carga las listas con los valores de ejemplo del ejercicio
procedure Ejemplo(var L1,L2: Lista);
var X:Tipoelemento;
begin
  L1.Crear(Cadena,6);
  L2.Crear(Cadena,3);
  X.Clave := 'A';
  L1.Agregar(X);
  X.Clave := 'Z';
  L1.Agregar(x);
  X.Clave := 'B';
  L1.Agregar(x);
  X.Clave := 'D';
  L1.Agregar(X);
  X.Clave := 'H';
  L1.Agregar(x);
  X.Clave := 'K';
  L1.Agregar(x);
  //-----
  X.Clave := 'D';
  L2.Agregar(x);
  X.Clave := 'H';
  L2.Agregar(x);
  X.Clave := 'A';
  L2.Agregar(x);
end;

//Boton que carga la lista de forma aleatoria (no encontre otra forma aparte de con ASCII)
procedure TForm1.Button1Click(Sender: TObject);
var I: Integer;
  Contenido: Integer;
  X: TipoElemento;
begin
  Randomize;
  Lista1.Crear(Cadena,cantElementos);
  Lista2.Crear(Cadena,cantElementosSubLista);
  for I := 1 to cantElementos do
    begin
      Contenido := minRandom + Random(maxRandom - minRandom);
      X.Clave := Chr(Contenido);
      Lista1.Agregar(X);
    end;
  for I := 1 to cantElementosSubLista do
    begin
      Contenido := minRandom + Random(maxRandom - minRandom);
      X.Clave := Chr(Contenido);
      Lista2.Agregar(X);
    end;
  memo1.Lines.Add('Listas cargadas de forma aleatoria satisfactoriamente');
end;

//Boton que muestra el contenido de las listas
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Contenido lista 1:');
  memo1.Lines.Add(Lista1.RetornarClaves);
  memo1.Lines.Add('Contenido lista 2:');
  memo1.Lines.Add(Lista2.RetornarClaves);
end;

//Boton que carga la lista con los valores de ejemplo
procedure TForm1.Button3Click(Sender: TObject);
begin
  Ejemplo(Lista1,Lista2);
  memo1.Lines.Add('Cargado con valores del ejemplo');
end;

//Boton que me dice si L2 es sublista de L1
procedure TForm1.Button4Click(Sender: TObject);
var Valor: Boolean;
begin
  Valor := SubLista(Lista1,Lista2);
 if Valor then
 begin
  memo1.Lines.Add('La lista 2 es SubLista de la 1!');
 end
 else
 begin
  memo1.Lines.Add('No es sublista');
 end;
end;

end.
