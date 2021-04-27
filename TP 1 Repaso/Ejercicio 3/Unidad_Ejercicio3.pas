unit Unidad_Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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

procedure TForm1.Button1Click(Sender: TObject);
Var T: TextFile;
  S: String;
  i: Integer;
begin
  AssignFile(T,'.\Texto.txt');

  if not FileExists('.\Texto.txt') then
  begin
    Rewrite(T);
    CloseFile(T);
  end;
  memo1.Lines.Add('Archivo creado!');
end;

procedure TForm1.Button2Click(Sender: TObject);
Var T: TextFile;
    S: String;
    i: Integer;
begin
  AssignFile(T,'.\Texto.txt');
  Append(T);

  for i := 1 to 10 do
  begin
    S := ('Estoy escribiendo en la linea numero° ' + i.ToString);
    WriteLn(T,S)
  end;
  Memo1.Lines.Add('Las lineas fueron creadas!');
  CloseFile(T);

end;

procedure TForm1.Button3Click(Sender: TObject);
Var T: TextFile;
  S: String;
  i: Integer;
begin
  AssignFile(T,'.\Texto.txt');

  if not FileExists('.\Texto.txt') then
  begin
    Rewrite(T);
    CloseFile(T);
  end;

  Reset(T);

  while NOT Eof(T) do
  begin
    Readln(T,S);
    memo1.Lines.Add(S);
  end;

  CloseFile(T);
end;

// Funcion Interna a la implementacion
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

procedure TForm1.Button4Click(Sender: TObject);
Var T: TextFile;
  S, Cadena: String;
  i: Integer;
  V: Vector;
begin
  AssignFile(T,'.\Texto.txt');

  if not FileExists('.\Texto.txt') then
  begin
    Rewrite(T);
    CloseFile(T);
  end;

  Reset(T);

  while NOT Eof(T) do
  begin
    Cadena := Readln(T,S);
    V := Parsing(S,' ');
    memo1.Lines.Add(S);
  end;

end;
end.
