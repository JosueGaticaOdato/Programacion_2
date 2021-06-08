unit CodigoEjercicio87;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Tipos,
  ListArray;
  //ListCursor;
  //ListPointer;

//Constante para el maximo de la lista y el valor de los objetos
const
  Maximo = 100;
  Puntito = 1;
  Frutilla = 10;
  Banana = 30;
  Cereza = 50;
  Fantasma = 100;
  Perdiste = -1;

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
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //Pongo la lista como variable
  L: Lista;

implementation

{$R *.dfm}

//Complejida algoritmica: Lineal (Recuperar elemento de la lista, condicionales para
//saber de que elemento se trata, Sumar un contador)
//Funcion que realiza la suma de puntos
function Sumatoria (L1:Lista): String;
var P: PosicionLista;
  Sumador: Integer;
  Contador_de_Bonus: Integer;
  Bandera: Boolean;
begin
  //Paso la primera posicion, inicializo el sumador, el contador de bonus y la bandera
  P := L1.Comienzo;
  Sumador := 0;
  Bandera := True;
  Contador_de_Bonus := 0;
  //Mientras no llegue al final y no me halla topado con un fantasma sin bonus
  while (P <> Nulo) and (Bandera) do
  begin
    //Si comio un bonus, inicializa el bonus
    if L1.Recuperar(P).Clave = 'Bonus' then
    begin
        Contador_de_Bonus := 1;
    end
    //Si el pac-man come mientras esta el bonus activo, se multiplica el puntaje
    else if (Contador_de_Bonus >= 1) and (Contador_de_Bonus <= 10) then
    begin
      Sumador := Sumador + (L1.Recuperar(P).Valor1 * 2);
      Contador_de_bonus := Contador_de_bonus + 1;
    end
    //En caso de que se haya comido el fantasma sin el bonus, pierde el juego
    else if (L1.Recuperar(P).Clave = 'Fantasma') and ((Contador_de_Bonus = 0) or (Contador_de_Bonus > 10)) then
    begin
      Bandera := False;
      Sumador := Perdiste;
    end
    else
    begin
      //Carga de puntos sin el bonus
      Sumador := Sumador + L1.Recuperar(P).Valor1;
    end;
    //Siempre sube la posicion por cada paso
    P := L1.Siguiente(P);
  end;
  Result := Sumador.ToString;
end;

//Complejidad Algoritimica: Lineal (Aumentar el final, Agregar elemento en ese final)
//Procedimiento que realiza la carga de objetos en la lista
procedure Cargar_Objeto(var L1:Lista; Objeto: TipoElemento);
var P: PosicionLista;
begin
  L1.Agregar(Objeto);
end;

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
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button2Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button2.Caption;
  X.Valor1 := Frutilla;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button3Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button3.Caption;
  X.Valor1 := Banana;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button4Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button4.Caption;
  X.Valor1 := 0;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button5Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button5.Caption;
  X.Valor1 := Cereza;
  Cargar_Objeto(L,X);
end;

procedure TForm1.Button6Click(Sender: TObject);
var X: TipoElemento;
begin
  X.Clave := Button6.Caption;
  X.Valor1 := Fantasma;
  Cargar_Objeto(L,X);
end;

//---------------------------------------

//Funcion que devuelve el resultado
procedure TForm1.Button7Click(Sender: TObject);
var Total: String;
begin
  //Llamo a la funcion
  Total := Sumatoria(L);
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
  L.Crear(Cadena,Maximo);
end;

end.
