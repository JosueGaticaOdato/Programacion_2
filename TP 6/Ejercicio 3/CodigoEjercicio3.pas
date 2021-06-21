unit CodigoEjercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio3, Vcl.StdCtrls;

const
  Tamaño = 3;
  Maximo = 10;
  Minimo = 1;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Memo1: TMemo;
    c: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure cClick(Sender: TObject);
  private
    Cola: Ejercicio3;
    Sin_Repeticiones: Ejercicio3;
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
  Cola.Cargar_Aleatorio(Tamaño,Minimo,Maximo);
  memo1.Lines.Add('Cola cargada');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add('Cola:');
  memo1.Lines.Add(Cola.Mostrar_Cola);
end;

procedure TForm1.cClick(Sender: TObject);
begin
  Sin_Repeticiones := Cola.Eliminar_Repeticiones(Tamaño);
  memo1.Lines.Add('La pila sin repeticiones es la siguiente');
  memo1.Lines.Add(Sin_Repeticiones.Mostrar_Cola);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cola.Crear_Cola(Numero,Tamaño);
end;

end.
