unit Ej4Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej4ConjuntosTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnCargar: TButton;
    btnMostrar: TButton;
    btnSubconjunto: TButton;
    radioBtnC1: TRadioButton;
    radioBtnC2: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnSubconjuntoClick(Sender: TObject);
  private
    { Private declarations }
    C1,C2:Ej4;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnCargarClick(Sender: TObject);
begin
  if (C1.cargarConjunto(cantElem,Min,Max)) and (C2.cargarConjunto(cantElem,Min,Max)) then
  memo1.Lines.Add('Se cargaron los conjuntos correctamente');
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Conjunto 1: ');
  memo1.Lines.Add(C1.mostrarConjunto(C1));
  memo1.Lines.Add('Conjunto 2: ');
  memo1.Lines.Add(C2.mostrarConjunto(C2));
end;


procedure TForm1.btnSubconjuntoClick(Sender: TObject);
begin
  if radioBtnC1.Checked then begin

    if C1.esSubconjunto(C1,C2) then memo1.Lines.Add('El conjunto 1 es subconjunto propio del conjunto 2')
    else memo1.Lines.Add('El conjunto 1 no es subconjunto del conjunto 2');
  end
  else if radioBtnC2.Checked then begin
    if C2.esSubconjunto(C2,C1) then memo1.Lines.Add('El conjunto 2 es subconjunto propio del conjunto 1')
    else memo1.Lines.Add('El conjunto 2 no es subconjunto del conjunto 1');
  end
  else memo1.Lines.Add('Debe seleccionar un conjunto');

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C1.crearConjunto(tipoClave,cantElem);
  C2.crearConjunto(tipoClave,cantElem2);
  memo1.Clear;
  if (C1.cargarConjunto(cantElem,Min,Max)) and (C2.cargarConjunto(cantElem2,Min,Max)) then
  memo1.Lines.Add('Se cargaron los conjuntos correctamente');

end;

end.
