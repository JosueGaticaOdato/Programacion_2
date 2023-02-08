unit CodigoEjercicio1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADEjercicio1Cola;

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
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
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

{

Ejercicio 1
Resolver los siguientes puntos:

  Concatenar dos colas dejando el resultado en la primera de ellas.
  Informar si un elemento dado se encuentra en la cola.
  Agregar un nuevo elemento en una posición dada (colarse).
  Dado un elemento sacarlo de la cola todas las veces que aparezca.
  Contar los elementos de la cola.
  Realizar una función que realice una copia de una cola.
  Invertir del contenido de una cola sin destruir la cola original.

}

//Boton que carga la cola de forma aleatoria
procedure TForm1.Button10Click(Sender: TObject);
begin
  memo1.Lines.Add('Cola 2:');
  memo1.Lines.Add(Cola2.mostrarCola);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Cola1.cargarAleatorio(Cantidad,Minimo,Maximo);
  Cola2.cargarAleatorio(Cantidad,Minimo,Maximo);
  memo1.Lines.Add('Colas cargadas');
end;

//Boton que muestra el contenido de la cola
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('Cola 1:');
  memo1.Lines.Add(Cola1.mostrarCola);
end;

//Boton que concatena el contenio de dos colas
procedure TForm1.Button3Click(Sender: TObject);
begin
  Cola1.Concatenar(Cola2);
  memo1.Lines.Add('Colas concatenadas');
end;

//Boton que busca si un elemento esta en la cola o no
procedure TForm1.Button4Click(Sender: TObject);
var X: TipoElemento;
  Existe: Boolean;
begin
  X.Inicializar(Numero,0);
  X.Clave := StrtoInt(Edit1.Text);
  Existe := Cola1.comprobarElemento(X);
  if Existe then
  begin
    memo1.Lines.Add('El elemento ' + Edit1.Text + ' esta en la cola');
  end
  else
  begin
    memo1.Lines.Add('El elemento no esta en la cola');
  end;
end;

//Boton que busca y elimina un elemento de la cola
procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := StrtoInt(Edit1.Text);
  Cola1.Eliminar(X);
  memo1.Lines.Add('Elemento eliminado');
end;

//Boton que agrega en una posicion un elemento a la cola
procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
  Posicion: Integer;
begin
  X.Clave := StrtoInt(Edit1.Text);
  Posicion := StrtoInt(Edit2.Text);
  Cola1.Agregar(X,Posicion);
  memo1.Lines.Add('Elemento agredado');
end;

//Boton que me dice la cantidad de elementos de la cola
procedure TForm1.Button7Click(Sender: TObject);
var CantidadElementos: Integer;
begin
  CantidadElementos := Cola1.contarElementos;
  memo1.Lines.Add('La cantidad de elementos de la cola 1 es: ' + CantidadElementos.ToString);
end;

//Boton que realiza una copia de la cola
procedure TForm1.Button8Click(Sender: TObject);
var Copia: Ejercicio1;
begin
  Copia := Cola1.Copia;
  memo1.Lines.Add('Copia realizada!');
  memo1.Lines.Add('Contenido de la copia');
  memo1.Lines.Add(Copia.mostrarCola);
end;

procedure TForm1.Button9Click(Sender: TObject);
var Invertida: Ejercicio1;
begin
  Invertida := Cola1.Invertir;
  memo1.Lines.Add('Cola invertida!');
  memo1.Lines.Add('Contenido:');
  memo1.Lines.Add(Invertida.mostrarCola);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Cola1.crearCola(Cadena,Cantidad);
  Cola2.crearCola(Cadena,Cantidad);
end;

end.
