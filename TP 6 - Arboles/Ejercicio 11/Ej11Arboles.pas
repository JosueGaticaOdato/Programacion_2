unit Ej11Arboles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej11ArbolesTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    A:Ej11;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
begin
  A.balancearArbol();
  memo1.Lines.Add(A.mostrarArbol);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add(A.mostrarArbol);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  A.crearArbol(tipoClave,cantElem);
  memo1.Clear;
end;

end.
