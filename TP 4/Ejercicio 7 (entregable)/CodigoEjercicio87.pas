unit CodigoEjercicio87;

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
