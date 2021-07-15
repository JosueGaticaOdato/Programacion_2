unit Ej5Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Unit2, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    C1:Ej4;
    C2:Ej4;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  C1.crearConjunto(tipoClave,5);
  C2.crearConjunto(tipoClave,6);
  memo1.Clear;
  if (C1.cargarConjunto(5,Min,Max)) and (C2.cargarConjunto(6,Min,Max)) then
  memo1.Lines.Add('Se cargaron los conjuntos correctamente');

end;

end.
