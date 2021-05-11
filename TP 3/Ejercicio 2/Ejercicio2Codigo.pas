unit Ejercicio2Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Numero1: TEdit;
    btnMCD: TButton;
    Numero2: TEdit;
    Label1: TLabel;
    MCD: TEdit;
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

function MaximoComunDivisor(Numero1,Numero2: Integer): Integer;
begin
//Si los numeros son iguales tengo el MCD
 if Numero1 = Numero2 then
 begin
   Result := Numero1;
 end
 else
 begin
 //Sino, al mayor le resto el menor y vuelvo a consultar el MCD
  if Numero1 > Numero2 then
  begin
    Result := MaximoComunDivisor(Numero1 - Numero2,Numero2);
  end
  else if Numero1 < Numero2 then
  begin
    Result := MaximoComunDivisor(Numero1,Numero2 - Numero1);
  end;
 end;
end;

{$R *.dfm}

procedure TForm1.btnMCDClick(Sender: TObject);
var N1, N2: Integer;
begin
  N1 := strtoint(Numero1.Text);
  N2 := strtoint(Numero2.Text);
  MCD.Text := MaximoComunDivisor(N1,N2).ToString;
end;

end.
