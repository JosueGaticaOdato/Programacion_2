unit Ejercicio5Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Numero1: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Numero2: TEdit;
    Label5: TLabel;
    Resultado: TEdit;
    Label4: TLabel;
    BtnDividir: TButton;
    procedure BtnDividirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//FALTA REALIZAR EL RESTO CON DECIMAL
function Division(Numero1, Numero2: Integer): Double;
begin
  //Caso base: en caso de que la resta sea menor a cero, el resultado de la division es 0
  if Numero1 - Numero2 < 0 then
  begin
    Result := 0;
  end
  else
  begin
    //El resultado sera 1 (porque quiere decir que se puede dividir)
    //y hago el llamado teniendo como parametro el N1-N2 y el divisor que no cambia
    Result := 1 + Division(Numero1 - Numero2, Numero2)
  end;
end;

procedure TForm1.BtnDividirClick(Sender: TObject);
var N1,N2: Integer;
    Result: Double;
begin
  N1 := strtoint(Numero1.Text);
  N2 := strtoint(Numero2.Text);
  Result := Division(N1,N2);
  Resultado.Text := Result.ToString;
end;

end.
