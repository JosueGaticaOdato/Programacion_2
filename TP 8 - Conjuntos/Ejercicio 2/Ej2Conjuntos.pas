unit Ej2Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej2ConjuntosTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnMostrar: TButton;
    Memo1: TMemo;
    btnUnion: TButton;
    btnInterseccion: TButton;
    btnCargar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnUnionClick(Sender: TObject);
    procedure btnInterseccionClick(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
  private
    { Private declarations }
    C1,C2,C3:Ej2;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 2
Desarrollar un algoritmo que dados tres conjuntos de elementos tipo carácter (char) realice las operaciones de Unión e Intersección.
}

//Boton que carga los tres conjuntos
procedure TForm1.btnCargarClick(Sender: TObject);
begin
  C1.cargarConjunto(tipoClave,cantElem);
  C2.cargarConjunto(tipoClave,cantElem);
  C3.cargarConjunto(tipoClave,cantElem);
end;

//Boton que muestra la interseccion entre los 3
procedure TForm1.btnInterseccionClick(Sender: TObject);
var C:Ej2;
begin
  C := C1.interseccion3Conjuntos(C1,C2,C3);
  memo1.Lines.Add(C.mostrarConjunto(C));
end;

//Boton que muestra el contenido de los 3 conjuntos
procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add(C1.mostrarConjunto(C1));
  memo1.Lines.Add(C1.mostrarConjunto(C2));
  memo1.Lines.Add(C1.mostrarConjunto(C3));
end;

//Boton que realiza la union entre los 3 conjuntos
procedure TForm1.btnUnionClick(Sender: TObject);
var C:Ej2;
begin
  C := C1.union3Conjuntos(C1,C2,C3);
  memo1.Lines.Add(C.mostrarConjunto(C));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C1.cargarConjunto(tipoClave,cantElem);
  C2.cargarConjunto(tipoClave,cantElem);
  C3.cargarConjunto(tipoClave,cantElem);
end;

end.
