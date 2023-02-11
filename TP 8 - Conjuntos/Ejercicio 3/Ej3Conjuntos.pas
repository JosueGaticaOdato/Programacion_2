unit Ej3Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej3ConjuntosTAD, Vcl.StdCtrls,ConjuntosAVL;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnCargar: TButton;
    btnMostrar: TButton;
    btnVocalesConsonantes: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnVocalesConsonantesClick(Sender: TObject);
  private
    { Private declarations }
    C:Ej3;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 3

  Desarrollar un algoritmo que dado un conjunto de elementos tipo carácter (char)
  cree dos conjuntos, uno con las vocales y otro con las consonantes
}

//Boton que carga el conjunto de forma aleatoria
procedure TForm1.btnCargarClick(Sender: TObject);
begin
  C.cargarConjunto(tipoClave,cantElem);
  memo1.Lines.Add('Cargado.');
end;

//Boton que muestra el conjunto
procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Conjunto: ');
  memo1.Lines.Add(C.mostrarConjunto(C));
end;

//Boton que realiza la creacion de conjuntos (consonantes y vocales)
procedure TForm1.btnVocalesConsonantesClick(Sender: TObject);
var C1,C2:Conjunto;
begin
  C1 := C.vocales;
  C2 := C.Consonantes;
  memo1.Lines.Add('Conjunto vocales: ');
  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add('Conjunto consonantes: ');
  memo1.Lines.Add(C2.RetornarClaves);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C.cargarConjunto(tipoClave,cantElem);
  memo1.Clear;
end;

end.
