unit CodigoEjercicio7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio7, Vcl.StdCtrls;

const
  TamañoPila1 = 1;
  TamañoPila2 = 5;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Button3: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Pila1: Ejercicio7;
    Pila2: Ejercicio7;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Pila1.Cargar_Pila_Aleatoria(TamañoPila1);
  Pila2.Cargar_Pila_Aleatoria(TamañoPila2);
  memo1.Lines.Add('Pilas cargadas');
end;

procedure TForm1.Button3Click(Sender: TObject);
var Iguales: Boolean;
begin
  Iguales := Pila1.Son_Iguales(Pila1,Pila2);
  if Iguales then
  begin
    memo1.Lines.Add('Poseen los mismos elementos');
  end
  else
  begin
    memo1.Lines.Add('No poseen los mismos elementos');
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('Pila 1:');
  memo1.Lines.Add(Pila1.Mostrar_Pila);
  memo1.Lines.Add('----------------------------------------');
  memo1.Lines.Add('Pila 2:');
  memo1.Lines.Add(Pila2.Mostrar_Pila);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.Clear;
end;

end.
