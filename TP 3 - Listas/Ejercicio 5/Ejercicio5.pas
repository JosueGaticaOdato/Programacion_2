unit Ejercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos,
  //ListArray;
  //ListCursor;
  ListPointer;

const
  cantElementos = 10;
  minRandom = 1;
  maxRandom = 10;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  L: Lista;

implementation

{$R *.dfm}

{
Ejercicio 5
Implementar un algoritmo recursivo genérico que reciba una lista
y la devuelva ordenada de manera decreciente utilizando burbujeo.
El método se define de la siguiente manera:

PROCEDURE Burbujeo(var L: Lista; P, Q: PosicionLista);
Donde P es la posición del primer elemento de la lista y Q la del segundo.
}

//Procedimiento que hace el swap entre dos elementos
procedure Swap(var L: Lista; P, Q: PosicionLista);
var
  t: TipoElemento;
begin
  t := L.Recuperar(P);
  L.Actualizar(L.Recuperar(Q),P);
  L.Actualizar(T,Q);
end;

//Algoritmo de burbujeo de forma recursiva
PROCEDURE Burbujeo(var L: Lista; n: Integer);
var I: PosicionLista;
begin
  if n = 1 then //Si la cantidad de elementos es 1, queire decir
  //que ya recorri toda la lista, entonces salgo
  begin
    exit
  end;
  //Pido el comienzo
  I := L.Comienzo;
  while I <> L.Fin do //Mientras no recorra hasta el final de la lista
  begin
    //Consulto si puedo hacer el swap (ordena de forma ascendente)
    if L.Recuperar(I).Clave > L.Recuperar(L.Siguiente(I)).Clave then
    begin
      Swap(L,I,L.Siguiente(I));
    end;
    I := L.Siguiente(I); //Pido el siguiente
  end;

  Burbujeo(L,n - 1); //Hago nuevamente el burbujeo pero esta vez con 1 elemento menos

  //N es equivalente a la cantidad de vueltas que tengo que darle a mi lista
  //para que esta este ordenado, que equivale a la cantidad de elementos
end;

//Boton que carga la lista de forma random
procedure TForm1.Button1Click(Sender: TObject);
begin
  L.LlenarClavesRandom(cantElementos, minRandom, maxRandom);
  memo1.Lines.Add('Lista cargada de forma aleatoria');
end;

//Boton que muestra el contenido de las lista
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Contenido lista:');
  memo1.Lines.Add(L.RetornarClaves);
end;

//Boton que realiza el burbujeo
procedure TForm1.Button3Click(Sender: TObject);
begin
  Burbujeo(L,L.CantidadElementos);
  memo1.Lines.Add('Burbujeo aplicado');
end;

end.
