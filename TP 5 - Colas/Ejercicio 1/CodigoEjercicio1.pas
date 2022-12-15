unit CodigoEjercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio1;

const
  Cantidad = 4;
  Maximo = 10;
  Minimo = 1;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Cola1: Ejercicio1;
    Cola2: Ejercicio1;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Cola1.Cargar_Aleatorio(Cantidad,Minimo,Maximo);
  Cola2.Cargar_Aleatorio(Cantidad,Minimo,Maximo);
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
begin
  Cola1.Concatenar(Cola2);
  memo1.Lines.Add('Colas concatenadas');
end;

procedure TForm1.Button4Click(Sender: TObject);
var X: TipoElemento;
  Existe: Boolean;
begin
  X.Inicializar(Numero,0);
  X.Clave := StrtoInt(Edit1.Text);
  Existe := Cola1.Chequear_Elemento(X);
  if Existe then
  begin
    memo1.Lines.Add('El elemento ' + Edit1.Text + ' esta en la cola');
  end
  else
  begin
    memo1.Lines.Add('El elemento no esta en la cola');
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := StrtoInt(Edit1.Text);
  Cola1.Eliminar(X);
  memo1.Lines.Add('Elemento eliminado');
end;

procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
  Posicion: Integer;
begin
  X.Clave := StrtoInt(Edit1.Text);
  Posicion := StrtoInt(Edit2.Text);
  Cola1.Agregar(X,Posicion);
  memo1.Lines.Add('Elemento agredado');
end;

procedure TForm1.Button7Click(Sender: TObject);
var CantidadElementos: Integer;
begin
  CantidadElementos := Cola1.Contar_Elementos;
  memo1.Lines.Add('La cantidad de elementos de la cola 1 es: ' + CantidadElementos.ToString);
end;

procedure TForm1.Button8Click(Sender: TObject);
var Copia: Ejercicio1;
begin
  Copia := Cola1.Copia;
  memo1.Lines.Add('Copia realizada!');
  memo1.Lines.Add('Contenido de la copia');
  memo1.Lines.Add(Copia.Mostrar_Cola);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cola1.Crear_Cola(Cadena,4);
  Cola2.Crear_Cola(Cadena,4);
end;

end.
