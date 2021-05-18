unit Ejercicio7Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Nivel_Reunion: TEdit;
    BtnGenerar: TButton;
    Memo1: TMemo;
    procedure BtnGenerarClick(Sender: TObject);
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


//Funcion recursiva que recibe el nivel
function Mafia (Nivel: Integer): String;
begin
  //El caso base es si el nivel es 1, por lo tanto devuelvo el string
  if Nivel = 1 then
  begin
    Result := '(-.-)';
  end
  else
  begin
    //Si no es 1, pongo los string alrededor y llamo devuelta a la funcion,
    //restando un nivel
    Result := '(-.' + Mafia(Nivel-1) + '.-)';
  end;
end;

procedure TForm1.BtnGenerarClick(Sender: TObject);
var Valor: String;
begin
  //LLamo a la funcion y muestro en pantalla
  Valor := Mafia(strtoint(Nivel_Reunion.Text));
  memo1.Lines.Add(Valor);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear
end;

end.
