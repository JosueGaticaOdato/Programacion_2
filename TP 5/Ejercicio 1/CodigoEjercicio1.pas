unit CodigoEjercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio1, Tipos;

const
  CantidadMaxRandom = 3;
  CantidadMax = 20;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
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
  X.TipoDatoClave(Numero);
  X.Clave := StrToInt(Edit1.Text);
  P.Colocar_en_el_fondo(X);
  memo1.Lines.Add('Se coloco en el fondo de la pila');
end;

procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X.TipoDatoClave(Numero);
  X.Clave := StrToInt(Edit1.Text);
  P.Eliminar_Ocurrencias(X);
  memo1.Lines.Add('Se eliminaron las ocurrencias');
end;

procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
begin
  X.TipoDatoClave(Numero);
  X.Clave := StrToInt(Edit1.Text);
  P.Cambiar_Tope_y_Fondo(X);
  memo1.Lines.Add('Se cambiaron el tope y el fondo de la pila');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  P.Duplicar;
  memo1.Lines.Add('Pila duplicada');
end;

procedure TForm1.Button8Click(Sender: TObject);
var Contador: Integer;
begin
  Contador := P.Contar;
  memo1.Lines.Add('La cantidad de elementos de la pila es de ' + Contador.ToString + ' elementos.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  P.Definir_Tamaño_Pila(CantidadMax);
end;

end.
