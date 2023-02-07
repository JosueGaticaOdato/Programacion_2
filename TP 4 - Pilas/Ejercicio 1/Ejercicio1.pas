unit Ejercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio1,
  //StackArray;
  //StackCursor;
  StackPointer;

const
  CantidadMaxRandom = 5;
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
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  P: MiPila;


implementation

{$R *.dfm}

{

Ejercicio 1
Dada una pila cargada con valores al azar realizar los siguientes ejercicios:

.Buscar una clave y determinar si existe en la Pila.
.Colocar en el fondo de una pila un nuevo elemento.
.Eliminar de una pila todas las ocurrencias de un elemento dado.
.Intercambiar los valores del tope y el fondo de una pila.
.Duplicar el contenido de una pila.
.Contar los elementos de la pila.

}

//Boton que carga la pila de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  P.cargarAleatorio(CantidadMaxRandom);
  memo1.Lines.Add('Pila cargada');
end;

//Boton que busca una clave dada por el usuario
procedure TForm1.Button2Click(Sender: TObject);
var X: TipoElemento;
  Buscar: Boolean;
begin
  X.Clave := Edit1.Text;
  Buscar := P.buscarClave(X);
  if Buscar then
  begin
    memo1.Lines.Add('Se encontro su clave');
  end
  else
    memo1.Lines.Add('No se encontro su clave');
end;

//Boton que muestra el contenido de la pila
procedure TForm1.Button3Click(Sender: TObject);
begin
  memo1.Lines.Add(P.mostrarPila);
end;

//Boton que coloca en el fondo de la pila un TipoElemento
procedure TForm1.Button4Click(Sender: TObject);
var X: TipoElemento;
begin
  X.TipoDatoClave(Numero);
  X.Clave := StrToInt(Edit1.Text);
  P.colocarFondo(X);
  memo1.Lines.Add('Se coloco en el fondo de la pila');
end;

//Boton que elimina todas las ocurrencais de una pila
procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := StrToInt(Edit1.Text);
  P.eliminarOcurrencias(X);
  memo1.Lines.Add('Se eliminaron las ocurrencias');
end;

//Boton que intercambia el tope y el fondo de la pila
procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
begin
  P.cambiarTopeYFondo();
  memo1.Lines.Add('Se cambiaron el tope y el fondo de la pila');
end;

//Boton que duplica la pia
procedure TForm1.Button7Click(Sender: TObject);
begin
  P.duplicar;
  memo1.Lines.Add('Pila duplicada');
end;

//Boton que me dice la cantidad de elementos de la pila
procedure TForm1.Button8Click(Sender: TObject);
var Contador: Integer;
begin
  Contador := P.Contar;
  memo1.Lines.Add('La cantidad de elementos de la pila es de ' + Contador.ToString + ' elementos.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  P.definirTamaño(CantidadMax);
end;

end.
