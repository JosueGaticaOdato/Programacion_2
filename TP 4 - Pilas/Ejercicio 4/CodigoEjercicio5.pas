unit CodigoEjercicio5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio5, Tipos;

const
  CantidadMaxRandom = 3;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button4: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    Pila: MiPila;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{

Ejercicio 4

Dada una pila con valores al azar eliminar todas las ocurrencias de un determinado
ítem sin perder la pila original. Deberá retornar una nueva pila sin el ítem en
consideración. Resolver iterativamente y recursivamente.

Determinar la complejidad algorítmica de ambas soluciones.

Ejemplo: si P contiene (A, B, A, C, D, A, F) y el ítem
a eliminar es A entonces la pila resultante sería (B, C, D, F).

}

//Boton que carga la pila de forma aleatoria
procedure TForm1.Button1Click(Sender: TObject);
begin
  Pila.cargarPilaAleatoria(CantidadMaxRandom);
  memo1.Lines.Add('Pila cargada');
end;

//Boton que elimina todas las ocurrencias dentro de la pila (iterativo)
procedure TForm1.Button2Click(Sender: TObject);
var X: TipoElemento;
  PSinOcurrencias: MiPila;
begin
  //PSinOcurrencias.Definir_Tamaño_Pila(CantidadMaxRandom);
  X.Clave := StrToint(Edit1.Text);
  PSinOcurrencias := Pila.eliminarOcurrencias(X);
  memo1.Lines.Add('La pila sin las ocurrencias es');
  memo1.Lines.Add(PSinOcurrencias.mostrarPila);
end;

//Boton que elimina todas las ocurrencias dentro de la pila (recursivo)
procedure TForm1.Button3Click(Sender: TObject);
var X: TipoElemento;
  AUX1,AUX2,AUX3,sinOcurrencias: MiPila;
begin
  Aux1.crearPila(CantidadMaxRandom);
  Aux2.crearPila(CantidadMaxRandom);
  Aux3.crearPila(CantidadMaxRandom);
  sinOcurrencias.crearPila(CantidadMaxRandom);
  X.Clave := StrToint(Edit1.Text);
  sinOcurrencias := Pila.eliminarOcurrenciasRecursivo(X,AUX1,AUX2,AUX3);
  memo1.Lines.Add('La pila sin las ocurrencias es');
  memo1.Lines.Add(sinOcurrencias.mostrarPila);
end;

//Boton que muestra el contenido de la pila
procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('La pila es');
  memo1.Lines.Add(Pila.mostrarPila);
end;

end.
