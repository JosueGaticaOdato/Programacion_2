unit Ejercicio3Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TEjercicio3 = class(TForm)
    Numero1: TEdit;
    Label1: TLabel;
    Numero2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Resultado: TEdit;
    Label5: TLabel;
    BtnMultiplicar: TButton;
    procedure BtnMultiplicarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ejercicio3: TEjercicio3;

implementation

{$R *.dfm}

function Producto(Numero1,Numero2: Integer): Integer;
begin
  //Caso base en caso de restar con numero positivo y negativo
  if Numero2 = 1 then
  begin
    Result := Numero1;
  end
  else if (Numero2 = -1) then
  begin
    Result := - Numero1;
  end
  else
  //Si no se cumple el caso base, uso el condicional acorde al valor del divisor
  begin
    //Si es positivo sumo, y resto al divisor como parametro
    if Numero2 > 0 then
    begin
      Result := Numero1 + Producto(Numero1,Numero2 - 1);
    end
    //Si es negativo sumo pero numero 1 sera negativo, y sumo al divisor
    else if Numero2 < 0 then
    begin
      Result := - Numero1 + Producto(Numero1,Numero2 + 1);
    end
  end;

end;

procedure TEjercicio3.BtnMultiplicarClick(Sender: TObject);
var N1,N2, Result: Integer;
begin
  N1 := strtoint(Numero1.Text);
  N2 := strtoint(Numero2.Text);
  Result := Producto(N1,N2);
  Resultado.Text := Result.ToString;
end;

end.
