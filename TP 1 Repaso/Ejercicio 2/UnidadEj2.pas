unit UnidadEj2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;
type
  Vector = Array [1..21] of Integer;
  Vector_Ascii = Array [65..122] of Integer;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    V_Consonantes: Vector;
    V_Contador: Vector_Ascii;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function Solo_Mayusculas(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
  Nueva_cadena1: string;
begin
  Nueva_cadena1 := '';
  for i := 1 to Tamaño do
    begin
      if (Ord(Cadena[i]) >= Ord('A')) and (Ord(Cadena[i]) <= Ord('Z')) then
      begin
        Nueva_cadena1 := Nueva_cadena1 + Cadena[i];
      end;
      if (Ord(Cadena[i]) = Ord(' '))then
      begin
        Nueva_cadena1 := Nueva_cadena1 + Cadena[i];
      end;
    end;
  Solo_Mayusculas := Nueva_cadena1;
end;

function Solo_Minusculas(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
  Nueva_cadena2: string;
begin
  Nueva_cadena2 := '';
  for i := 1 to Tamaño do
    begin
      if (Ord(Cadena[i]) >= Ord('a')) and (Ord(Cadena[i]) <= Ord('z')) then
      begin
        Nueva_cadena2 := Nueva_cadena2 + Cadena[i];
      end;
      if (Ord(Cadena[i]) = Ord(' '))then
      begin
        Nueva_cadena2 := Nueva_cadena2 + Cadena[i];
      end;
    end;
  Solo_Minusculas := Nueva_cadena2;
end;

function Sin_Espacios(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
Nueva_cadena1: string;
begin
  Nueva_cadena1 := '';
  for i := 1 to Tamaño do
    begin
      if Ord(Cadena[i]) <> Ord(' ') then
      begin
        Nueva_cadena1 := Nueva_cadena1 + Cadena[i];
      end;
    end;
  Sin_Espacios := Nueva_cadena1;
end;

function Sin_Espacios_y_al_revez(var Cadena: String; Tamaño: Integer): String;
var i: Integer;
Nueva_Cadena_Invertida: String;
begin
  Nueva_Cadena_Invertida := '';
  for i := Tamaño downto 1 do
  begin
    if Ord(Cadena[i]) <> Ord(' ') then
    begin
      Nueva_Cadena_Invertida := Nueva_Cadena_Invertida + Cadena[i];
    end;
  end;
  Sin_Espacios_y_al_revez := Nueva_Cadena_Invertida;
end;

function Consonantes(var Cadena: String; Tamaño: Integer; var bV: Vector_Ascii): String;
var x,i,j: Integer;
begin
  for i := 1 to Tamaño do
  begin
    for j := 65 to 122 do
    begin
      if Ord(Cadena[i]) = j then
        begin
          bV[j] := bV[j] + 1;
        end;
    end;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
  Nueva_cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Solo_Mayusculas(Cadena,Largo))
end;

procedure TForm1.Button2Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
  Nueva_cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Solo_Minusculas(Cadena,Largo));
end;

procedure TForm1.Button3Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
  Nueva_cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Sin_Espacios(Cadena,Largo));
end;

procedure TForm1.Button4Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
  Nueva_cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add(Sin_Espacios_y_al_revez(Cadena,Largo));
end;

procedure TForm1.Button5Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  memo1.Lines.Add('Tu frase tiene ' + Largo.ToString + ' Caracteres.');
end;

procedure TForm1.Button6Click(Sender: TObject);
var i, Largo : Integer;
  Cadena: String;
begin
  Cadena := edit1.Text;
  Largo := Length(Cadena);
  Consonantes(Cadena,Largo,V_Contador);
  for i := 65 to 90 do
    begin
      if V_Contador[i] <> 0 then
      begin
        memo1.lines.add(Chr(i) + '=' + V_Contador[i].ToString);
      end;
    end;
  for i := 97 to 122 do
    begin
      if V_Contador[i] <> 0 then
      begin
        memo1.lines.add(Chr(i) + '=' + V_Contador[i].ToString);
      end;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear
end;

end.
