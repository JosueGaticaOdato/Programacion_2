unit CodigoEjercicio10;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, TADEjercicio10, Tipos, Vcl.StdCtrls;

const
  Tamaño = 100;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    P: Ejercicio10;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var Valor: String;
begin
  P.Convertir(StrtoInt(Edit1.Text),StrtoInt(Edit2.Text));
  Valor := P.Transformar;
  memo1.Lines.Add('El numero ' + Edit1.Text + ' en base ' + Edit2.Text + ' es ' + Valor);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  P.Definir_Tamaño_Pila(Tamaño);
end;

end.
