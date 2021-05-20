unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Poblacion;

type
  TForm1 = class(TForm)
    d1: TEdit;
    d2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  v: vector;
  i: integer;
  Corte: Boolean;
begin
  v := calcularcantidad(StrToInt(d1.Text), StrToInt(d2.Text));
  Corte := True;
  I := 1;
  while (i < 100) and (Corte) do
  begin
    if v[i] = 0 then
    begin
      Corte := False
    end
    else
    begin
      Memo1.Lines.Add('cantidad del dia[' + i.ToString + ']: ' + IntToStr(v[i]));
      i := i + 1;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
