unit Ejercicio14Codigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Vector = Array of String;

var
  Form1: TForm1;

implementation

{$R *.dfm}
Function Parsing(aSS: String; aSep: String): Vector;
Var I: Integer;
    P: Integer;
    V: Vector;
Begin
  I := 0;
  // Controlo que el ultimo caracter sea el separador, sino lo agrega
  if aSS.Substring(aSS.Length,1) <> aSep then aSS := aSS + aSep;

  // Hacemos el split
  P := Pos(aSep, aSS);
  while P > 0 do Begin
    Inc(I);
    SetLength(V, I);  // Se redimensiona el array y no se pierden los datos
    V[I-1] := Copy(aSS, 1, P-1);
    aSS := Copy(aSS, P+1, Length(aSS));
    P := Pos(aSep, aSS);
  End;

  // Retorno el array
  Parsing := V;
End;


function ExplosionAux(Numero, Bomba: Integer): String;
begin
  if Numero <= Bomba then
  begin
    Result := Numero.ToString;
  end
  else
  begin
    Result := ExplosionAux(Numero DIV Bomba, Bomba) + ' ' +
      ExplosionAux(Numero - (Numero DIV Bomba), Bomba);
  end;
end;

function Explosion(Numero, Bomba: Integer): Vector;
begin
  Result := Parsing(ExplosionAux(Numero,Bomba),' ');
end;

procedure TForm1.Button1Click(Sender: TObject);
var Numeros: Vector;
  i: Integer;
  Jose: Vector;
  Mariano: Array [1..20] of string;
begin
  Numeros := Explosion(strtoint(Edit1.Text),strtoint(Edit2.Text));
  SetLength(Jose, 20);
  for i := 1 to Length(Numeros) - 1 do
  begin
    memo1.Lines.Add(Numeros[i]);
  end;
end;

end.