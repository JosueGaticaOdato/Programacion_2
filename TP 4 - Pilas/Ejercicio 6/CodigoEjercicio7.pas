unit CodigoEjercicio7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio7, Vcl.StdCtrls;

const
  TamañoPila1 = 1;
  TamañoPila2 = 5;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
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

Ejercicio 6

Dada dos pilas realizar una operación que permite determinar
si poseen los mismos elementos sin importar sus posiciones,
ni sus repeticiones.
El proceso recibe ambas Pilas y retornar verdadero o falso.
No se deben perder las 2 pilas originales.

Determinar la complejidad algorítmica de la solución.

Ejemplo: si P1 contiene (A, B, C, D, F) y P2 contiene
(B, A, C, A, D, C, F) deberá retornar True porque tienen los mismos elementos.

}

//Boton que crea ambas pilas de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  Pila1.cargarPilaAleatoria(TamañoPila1);
  Pila2.cargarPilaAleatoria(TamañoPila2);
  memo1.Lines.Add('Pilas cargadas');
end;

//Boton que compara el contenido de dos pilas y me dice si son iguales
procedure TForm1.Button3Click(Sender: TObject);
var Iguales: Boolean;
begin
  Iguales := Pila1.Son_Iguales(Pila1,Pila2);
  if Iguales then
  begin
    memo1.Lines.Add('Poseen los mismos elementos');
  end
  else
  begin
    memo1.Lines.Add('No poseen los mismos elementos');
  end;
end;

//Boton que muestra el contenido de las pilas
procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('Pila 1:');
  memo1.Lines.Add(Pila1.mostrarPila);
  memo1.Lines.Add('----------------------------------------');
  memo1.Lines.Add('Pila 2:');
  memo1.Lines.Add(Pila2.mostrarPila);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
