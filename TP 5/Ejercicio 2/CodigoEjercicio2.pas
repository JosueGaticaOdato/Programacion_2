unit CodigoEjercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio2, Tipos;

const
  CantidadMaxRandom = 3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Pila1: Ejercicio2;
    Pila2: Ejercicio2;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Pila1.Cargar_Pila_Aleatoria(CantidadMaxRandom);
  Pila2.Cargar_Pila_Aleatoria(CantidadMaxRandom);
  memo1.Lines.Add('Pilas cargadas aleatoriamente!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Pila1.Cargar_Iguales(Pila1,Pila2,CantidadMaxRandom);
  memo1.Lines.Add('Pilas cargadas iguales');
end;

procedure TForm1.Button3Click(Sender: TObject);
var Valor : Boolean;
begin
  Valor := Pila1.Son_Iguales(Pila1,Pila2);
  if Valor then
  begin
    memo1.Lines.Add('Las pilas son iguales');
  end
  else
  begin
    memo1.Lines.Add('Las pilas no son iguales');
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('Pila 1');
  memo1.Lines.Add(Pila1.Mostrar_Pila);
  memo1.Lines.Add('---------------------------------------------');
  memo1.Lines.Add('Pila 2');
  memo1.Lines.Add(Pila2.Mostrar_Pila);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Pila1.Definir_Tamaño_Pila(CantidadMaxRandom);
  Pila2.Definir_Tamaño_Pila(CantidadMaxRandom);
end;

end.
