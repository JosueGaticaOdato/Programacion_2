unit CodigoEjercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio1, Tipos;

const
  CantidadMaxRandom = 10;
  CantidadMax = 20;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    P: Ejercicio1;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  P.Cargar_Pila_Aleatoria(CantidadMaxRandom);
  memo1.Lines.Add('Pila cargada');
end;

procedure TForm1.Button2Click(Sender: TObject);
var X: TipoElemento;
  Buscar: Boolean;
begin
  X.Clave := Edit1.Text;
  Buscar := P.Buscar_Clave(X);
  if Buscar then
  begin
    memo1.Lines.Add('Se encontro su clave');
  end
  else
    memo1.Lines.Add('No se encontro su clave');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add(P.Mostrar_Pila);
end;

procedure TForm1.Button4Click(Sender: TObject);
var X: TipoElemento;
begin
  P.Colocar_en_el_fondo(X);
  memo1.Lines.Add('Se coloco en el fondo de la pila');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  P.Definir_Tamaño_Pila(CantidadMax);
end;

end.
