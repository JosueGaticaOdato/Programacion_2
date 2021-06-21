unit CodigoEjercicio2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio2;

const
  Tamaño = 3;
  Maximo = 10;
  Minimo = 1;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    Cola1: Ejercicio2;
    Cola2: Ejercicio2;
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
  Cola1.Cargar_Aleatorio(Tamaño, Minimo, Maximo);
  Cola2.Cargar_Aleatorio(Tamaño, Minimo, Maximo);
  memo1.Lines.Add('Colas cargadas aleatoriamente');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Cola1.Cargar_Iguales(Cola2);
  memo1.Lines.Add('Colas cargadas iguales');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Cola 1:');
  memo1.Lines.Add(Cola1.Mostrar_Cola);
  memo1.Lines.Add('Cola 2:');
  memo1.Lines.Add(Cola2.Mostrar_Cola);
end;

procedure TForm1.Button4Click(Sender: TObject);
var iguales: Boolean;
begin
  Iguales := Cola1.Son_Iguales(Cola1,Cola2);
  if Iguales then
  begin
    memo1.Lines.Add('Son iguales');
  end
  else
  begin
    memo1.Lines.Add('No son iguales');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cola1.Crear_Cola(Numero,Tamaño);
  Cola2.Crear_Cola(Numero,Tamaño);
end;

end.
