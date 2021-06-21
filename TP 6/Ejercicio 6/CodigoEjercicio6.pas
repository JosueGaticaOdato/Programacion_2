unit CodigoEjercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio6, Vcl.StdCtrls;

const
  Tamaño1 = 3;
  Tamaño2 = 2;
  Maximo = 10;
  Minimo = 1;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    Cola1: Ejercicio6;
    Cola2: Ejercicio6;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Cola1.Cargar_Aleatorio(Tamaño1,Minimo,Maximo);
  Cola2.Cargar_Aleatorio(Tamaño2,Minimo,Maximo);
  memo1.Lines.Add('Colas cargadas');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Cola 1:');
  memo1.Lines.Add(Cola1.Mostrar_Cola);
  memo1.Lines.Add('Cola 2:');
  memo1.Lines.Add(Cola2.Mostrar_Cola);
end;

procedure TForm1.Button3Click(Sender: TObject);
var Iguales: Boolean;
begin
  Iguales := Cola1.Son_Iguales(Cola1,Cola2);
  if Iguales then
  begin
    memo1.Lines.Add('Las colas son iguales');
  end
  else
  begin
    memo1.Lines.Add('No son iguales');
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Cola1.Cargar_Ejemplo1;
  Cola2.Cargar_Ejemplo2;
  memo1.Lines.Add('Colas cargadas');
end;

end.
