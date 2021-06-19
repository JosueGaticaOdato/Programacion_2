unit Ejercicio2Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, McdTAD;

type
  TForm1 = class(TForm)
    Numero1: TEdit;
    btnMCD: TButton;
    Numero2: TEdit;
    Label1: TLabel;
    MCDEdit: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnMCDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMCDClick(Sender: TObject);
var
  N1, N2: Integer;
begin
  N1 := strtoint(Numero1.Text);
  N2 := strtoint(Numero2.Text);
  MCDEdit := Mcd.MaximoComunDivisor(N1, N2);
end;

end.
