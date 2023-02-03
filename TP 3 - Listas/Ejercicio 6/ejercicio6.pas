unit Ejercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, TADPolinomio;

const
  Tamaño = 10;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    C: TEdit;
    G: TEdit;
    Memo1: TMemo;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  P: Polinomio;

implementation

{$R *.dfm}

{
Ejercicio 6
Generar un TAD Polinomio que implemente internamente una lista enlazada
los coeficientes de un polinomio y que provea las siguientes funcionalidades.

Ejemplo: P(x) = -x 3 + 2.x2 - 4 La lista sería: (-1, 2, 0, -4)

Evaluarlo en un punto
Realizar una función que dada un cierto valor de X nos devuelva
el valor del polinomio para ese punto. En el ejemplo:

Ejemplo: P(2) = -1.23 + 2.12 - 4 = 12

Valores característicos
Agregar al TAD funciones que devuelvan el “grado del polinomio”,
“el coeficiente principal” y la “ordenada al origen”.

Ejemplo: Grado: 3; CoeficientePrincipal: -2; OrdenadaAlOrigen: -4.

Evaluarlo en un rango
Dado un rango de valores de X y un valor de intervalo I,
retorne una lista con los valores de Y o P(x).

Ejemplo: Se pide retornar los valores de P(x) con -1 < x < 1 de a 0,5.
Es decir se deberían retornar los valores de P(-1), P(-0,5), P(0), P(0,5) y P(1).

Operar 2 polinomios
Resolver la “suma”, “resta” y “multiplicación” de polinomios.

Determinar la complejidad algorítmica de la solución empleada.
¿Existe una mejor forma de resolverlo de tal forma de reducir la complejidad algorítmica?
}

//Boton que carga el polinomio de ejemplo
procedure cargarEjemplo();
//P(x) = -x 3 + 2.x2 - 4
var
X: TipoElemento;
begin
  X.Clave := -1;
  P.cargarCoeficiente(X,3);
  X.Clave := 2;
  P.cargarCoeficiente(X,2);
  X.Clave := -4;
  P.cargarCoeficiente(X,0);
end;

//Boton que muestra el polinomio como funcion y como lista
procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add(P.mostrarPolinomio);
  memo1.Lines.Add(P.mostrarLista);
end;

//Boton que carga el polinomio pasado su coeficiente y grado
procedure TForm1.Button4Click(Sender: TObject);
var 
X: TipoElemento;
begin
  X.TipoDatoClave(Numero);
  X.Clave := strtoint(C.Text);
  P.cargarCoeficiente(X,strtoint(G.Text));
  Memo1.Lines.Add('Cargado');
end;

//Creacion de el polinomio y carga del ejemplo del ejercicio
procedure TForm1.FormCreate(Sender: TObject);
begin
  P.definirTamaño(Tamaño);
  cargarEjemplo();
end;

end.
