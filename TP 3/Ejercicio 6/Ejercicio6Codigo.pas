unit Ejercicio6Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Resultado: TEdit;
    Label3: TLabel;
    BtnGenerar: TButton;
    Numero: TEdit;
    Label1: TLabel;
    Label2: TLabel;
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

(*
Colocar puntos a los numeros de mas de 3 cifras
*)
function Colocar_Puntos(Numero: String; Inicio, Fin: Integer): String;
Var i: Integer;
  Texto: String;
begin
  if Fin <= 3 then
  begin
  for i := Inicio to Fin do
    Texto := Texto + Numero[i];
  Result := Texto;
  end
  else
  begin
    Result := Colocar_Puntos(Numero, Inicio, Fin - 3) +  '.' + Numero[Fin - 2] + Numero[Fin - 1] + Numero[Fin];
  end;
end;

procedure TForm1.BtnGenerarClick(Sender: TObject);
var Number, Inicio, Fin: Integer;
begin
  Number := strtoint(Numero.Text);
  Inicio := 1;
  Fin := Length(Number.ToString);
  Resultado.Text := Colocar_Puntos(Number.ToString,Inicio,Fin);
end;

end.
