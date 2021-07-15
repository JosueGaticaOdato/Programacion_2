unit Ej3Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej3ConjuntosTAD, Vcl.StdCtrls;

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

procedure TForm1.btnCargarClick(Sender: TObject);
begin
  C.cargarConjunto(tipoClave,cantElem);
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Conjunto: ');
  memo1.Lines.Add(C.mostrarConjunto(C));
end;

procedure TForm1.btnVocalesConsonantesClick(Sender: TObject);
var C1,C2:Ej3;
begin
  C1.crearConjunto(tipoClave,cantElem);
  C2.crearConjunto(tipoClave,cantElem);
  C.conjuntoVocalesConsonantes(C,C1,C2);
  memo1.Lines.Add('Conjunto vocales: ');
  memo1.Lines.Add(C1.mostrarConjunto(C1));
  memo1.Lines.Add('Conjunto consonantes: ');
  memo1.Lines.Add(C2.mostrarConjunto(C2));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C.cargarConjunto(tipoClave,cantElem);
  memo1.Clear;
end;

end.
