unit Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, Vcl.StdCtrls,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  cantElementos = 3;
  minRandom = 1;
  maxRandom = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Comparacion = (Menor,Mayor,Igual);

var
  Form1: TForm1;
  Lista1: Lista;
  Lista2: Lista;

implementation

{$R *.dfm}

{
Ejercicio 3
Dadas dos listas L1 y L2 se pide compararlas siempre en el sentido L1 -> L2.
Por lo tanto puede suceder que: L1 > L2; L1 = L2 o L1 < L2.
La forma de obtener la comparación es por la clave, posición a posición,
donde si L1 tiene más cantidad de claves mayores que L2 se considera que L1 > L2,
por el contrario se considera L1 < L2. Serán iguales si cada elemento de L1
está en L2 sin importar la posición, ni la cantidad de ocurrencias.
Por otro lado todos los elementos de L2 también deben estar en L1,
sin importar la posición, ni la cantidad de ocurrencias.

Determinar la complejidad algorítmica de la solución empleada.
}

//Funcion que me devuelve verdadero si las listas son iguales
function sonIguales(L1,L2: Lista): Boolean;
var
iguales, encontradoenL2: boolean;
PosL1,PosL2: PosicionLista;
X1,X2: TipoElemento;
begin
  iguales := true;
  PosL1 := L1.Comienzo;
  while (iguales) and (PosL1 <> Nulo) do //El primer bucle es para la lista principal
  begin
    X1 := L1.Recuperar(PosL1);
    PosL2 := L2.Comienzo;
    encontradoenL2 := false;
    while (not encontradoenL2) and (PosL2 <> Nulo) do //El segundo es para la lista a comparar
    begin
      X2 := L2.Recuperar(PosL2);
      if X1.Clave = x2.Clave then //Si coinciden los elementos, paro el bucle
      begin
        encontradoenL2 := true; //Quiere decir que existe el valor de L1 en L2
      end;
      PosL2 := L2.Siguiente(PosL2);
    end;
    //Consulto que paso despues del bucle
    if not encontradoenL2 then
    begin
      iguales := false; //Si da falso quiere decir que no estan los elementtos
      //de l1 en l2
    end;
    PosL1 := L1.Siguiente(PosL1);
  end;

  result := iguales;
end;

//Funcion que me dice si es mayor o menor L1 con respecto a L2
function mayorMenor(L1,L2:Lista): Comparacion;
var
cantL1,cantL2: Integer;
PosL1,PosL2: PosicionLista;
X1,X2: TipoElemento;
begin
  cantL1 := 0;
  cantL2 := 0;
  PosL1 := L1.Comienzo;
  PosL2 := L2.Comienzo;
  while (PosL2 <> Nulo) and (PosL1 <> Nulo) do //Mientras no termine de recorrer las listas
  begin
    X1 := L1.Recuperar(PosL1);
    X2 := L2.Recuperar(PosL2);
    if X1.Clave > X2.Clave then //Consulto si X1 supera a X2
    begin
      inc(cantL1); //Aumento el contador de L1
    end
    else
    begin
      inc(cantL2); //Sino, aumento el contador de L2
    end;
    //Pido la pos siguiente
    PosL1 := L1.Siguiente(PosL1);
    PosL2 := L2.Siguiente(PosL2);
  end;

  //Compruebo si es mayor o no
  //los contadores determinan la cantidad de veces que fue mayor
  //O menor L1 a L2
  if cantL1 > cantL2 then
  begin
    mayorMenor := Comparacion.Mayor;
  end
  else //Si las cantidades fueron iguales, se toma como que L2 es mayor
  begin
    mayorMenor := Comparacion.Menor;
  end;

end;

//Funcion comparar que me dice si es mayor, menor o igual
function comparar(L1,L2: Lista): Comparacion;
var
cantL1,cantL2: Integer;
Resultado : Comparacion;
begin
  if sonIguales(L1,L2) then
  begin
    comparar := Comparacion.Igual;
  end
  else
  begin
    comparar := mayorMenor(L1,L2);
  end;
end;

//Ejemplo donde las listas son iguales para probar
procedure EjemploIguales(var L1,L2: Lista);
var X:Tipoelemento;
begin
  L1.Crear(Numero,3);
  L2.Crear(Numero,3);
  X.Clave := 1;
  L1.Agregar(X);
  X.Clave := 2;
  L1.Agregar(x);
  X.Clave := 3;
  L1.Agregar(x);
  //-----
  X.Clave := 3;
  L2.Agregar(x);
  X.Clave := 2;
  L2.Agregar(x);
  X.Clave := 1;
  L2.Agregar(x);
end;

//Boton que cargas las listas de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  Lista1.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  Lista2.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  memo1.Lines.Add('Listas cargadas de forma aleatoria satisfactoriamente');
end;

//Boton que carga los vectores para que sean iguales
procedure TForm1.Button3Click(Sender: TObject);
begin
  EjemploIguales(Lista1,Lista2);
  memo1.Lines.Add('Cargado con valores del ejemplo para que sean iguales');
end;

//Boton que comparar las listas
procedure TForm1.Button4Click(Sender: TObject);
var
resultado: Comparacion;
begin
  resultado := comparar(Lista1,Lista2);
  case resultado of
    Menor: memo1.Lines.Add('La lista 1 es menor a la lista 2');
    Mayor: memo1.Lines.Add('La lista 1 es mayor a la lista 2');
    Igual: memo1.Lines.Add('Las listas son iguales');
  end;
end;

//Boton que muestra el contenido de las listas
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Contenido lista 1:');
  memo1.Lines.Add(Lista1.RetornarClaves);
  memo1.Lines.Add('Contenido lista 2:');
  memo1.Lines.Add(Lista2.RetornarClaves);
end;

end.
