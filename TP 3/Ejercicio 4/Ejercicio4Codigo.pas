unit Ejercicio4Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Numero: TEdit;
    Resultado: TEdit;
    Label3: TLabel;
    BtnGenerar: TButton;
    procedure BtnGenerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Fibonacci (Numero: Integer): Integer;
begin
  //Caso base
  if Numero < 2 then
  begin
    //Si el parametro es 1 o 0, el fibo es el mismo numero
    Result := Numero;
  end
  else
  begin
    //Realizo el fibo del numero -1 sumado al fibo del numero - 2.
    Result := Fibonacci(Numero - 1) + Fibonacci(Numero - 2);
  end;
end;

procedure TForm1.BtnGenerarClick(Sender: TObject);
var Number: Integer;
begin
  Number := strtoint(Numero.Text);
  Resultado.Text := Fibonacci(Number).ToString;
end;

end.
