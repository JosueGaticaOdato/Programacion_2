unit CodigoEjercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio2, Tipos;

const
  CantidadMaxRandom = 3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    //Definicion de la pila 1 y pila 2
    Pila1: MiPila;
    Pila2: MiPila;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{

Ejercicio 2
Dadas dos pilas, determinar si sus contenidos son exactamente
iguales, sin destruirlas. Utilizar para la resolución del problema
una única pila auxiliar.

Determinar la complejidad algorítmica de la solución.

}

//Boton que carga ambas pilas de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  Pila1.cargarPilasAleatoria(CantidadMaxRandom);
  Pila2.cargarPilasAleatoria(CantidadMaxRandom);
  memo1.Lines.Add('Pilas cargadas aleatoriamente!');
end;

//Boton que carga ambas pilas con el mismo contenido
procedure TForm1.Button2Click(Sender: TObject);
begin
  Pila1.cargarIguales(Pila1,Pila2,CantidadMaxRandom);
  memo1.Lines.Add('Pilas cargadas iguales');
end;

//Boton que compara si las pilas son o no iguales
procedure TForm1.Button3Click(Sender: TObject);
var Valor : Boolean;
begin
  Valor := Pila1.sonIguales(Pila1,Pila2);
  if Valor then
  begin
    memo1.Lines.Add('Las pilas son iguales');
  end
  else
  begin
    memo1.Lines.Add('Las pilas no son iguales');
  end;

end;

//Boton que muestra el contenido de las pilas
procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('Pila 1');
  memo1.Lines.Add(Pila1.mostrarPila);
  memo1.Lines.Add('---------------------------------------------');
  memo1.Lines.Add('Pila 2');
  memo1.Lines.Add(Pila2.mostrarPila);
end;

//Creacion de las pilas junto con el formulario
procedure TForm1.FormCreate(Sender: TObject);
begin
  Pila1.crearPila(CantidadMaxRandom);
  Pila2.crearPila(CantidadMaxRandom);
end;

end.
