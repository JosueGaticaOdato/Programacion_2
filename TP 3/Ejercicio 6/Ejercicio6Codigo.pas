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

//Analizar en clase
function Colocar_Puntos(Numero, Inicio, Fin: Integer): String;
begin
  if Fin < 3 then
  begin
    Result := Numero.ToString;
  end
  else
  begin
    Result := Colocar_Puntos(Numero, Inicio, Fin - 3) +  '.' +
     Numero.ToString[Fin] + Numero.ToString[Fin - 1] + Numero.ToString[Fin - 2];
  end;
end;

procedure TForm1.BtnGenerarClick(Sender: TObject);
var Number, Inicio, Fin: Integer;
begin
  Number := strtoint(Numero.Text);
  Inicio := 1;
  Fin := Length(Number.ToString);
  Resultado.Text := Colocar_Puntos(Number,Inicio,Fin);
end;

end.
