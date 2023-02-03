unit CodigoEjercicio7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Tipos, PacManTAD;

//Constante para el maximo de la lista y el valor de los objetos
const
  Maximo = 100;
  Puntito = 1;
  Frutilla = 10;
  Banana = 30;
  Cereza = 50;
  Fantasma = 100;
type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Resultado: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    //Se define el TAD
    List: Pacman;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 8
Se necesita saber el puntaje que suma un pacman en su
recorrido hasta llegar a terminar el nivel.

En su recorrido se puede encontrar con frutas con distinto puntaje
y con el activador del bonus que duplica todos los puntos de las cosas que
coma durante 10 pasos y que habilita la posibilidad de comerse el fantasma.
Si se come el fantasma sin el bonus activado: Pierde.

Escribir un algoritmo que permita calcular el puntaje dada una
lista de objetos que se come el pacman. Para el cálculo tener en
cuenta el siguiente listado de objetos que se come el pacman:
(puntito: 1, frutilla: 10, banana: 30, cerezas: 50, fantasma: 100).

Por ejemplo:
(puntito, frutilla, puntito, puntito, banana, puntito, puntito,
fantasma, puntito, puntito, cerezas, puntito) -> Perdiste.

(puntito, puntito, puntito, banana, puntito, puntito, bonus,
puntito, puntito, fantasma, puntito, puntito, cerezas, puntito) -> 345.

}

//Los botones 1 al 6, realizar la carga en la lista de los objetos que
//se comio el pac-man
procedure TForm1.Button1Click(Sender: TObject);
var X: TipoElemento;
begin
  //Como clave paso el texto del boton
  X.Clave := Button1.Caption;
  //Como valor 1 el valor que tiene que ese boton
  X.Valor1 := Puntito;
  //Cargo en la lista con el procedimiento
  List.Cargar_Objeto(X);
end;

procedure TForm1.Button2Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button2.Caption;
  X.Valor1 := Frutilla;
  List.Cargar_Objeto(X);
end;

procedure TForm1.Button3Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button3.Caption;
  X.Valor1 := Banana;
  List.Cargar_Objeto(X);
end;

procedure TForm1.Button4Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button4.Caption;
  X.Valor1 := 0;
  List.Cargar_Objeto(X);
end;

procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button5.Caption;
  X.Valor1 := Cereza;
  List.Cargar_Objeto(X);
end;

procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button6.Caption;
  X.Valor1 := Fantasma;
  List.Cargar_Objeto(X);
end;

//---------------------------------------

//Funcion que devuelve el resultado
procedure TForm1.Button7Click(Sender: TObject);
var Total: String;
begin
  //Llamo a la funcion
  Total := List.Sumatoria;
  //Si devuelve -1 quiere decir que perdi
  if Total.ToInteger = -1 then
  begin
    Resultado.Text := 'Perdiste';
  end
  else
  //Sino, devuelve el puntaje correspondiente
  begin
    Resultado.Text := Total;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Creacion de la lista con un maximo determinado
  List.Inicializar(Maximo);
end;

end.
