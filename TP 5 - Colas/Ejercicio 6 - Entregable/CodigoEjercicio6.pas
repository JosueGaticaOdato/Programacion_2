unit CodigoEjercicio6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Tipos, TADEjercicio6, Vcl.StdCtrls;

//Tamaño de las colas y determinacion del rango de su contenido
const
  Tamaño1 = 3;
  Tamaño2 = 2;
  Maximo = 10;
  Minimo = 1;

type
  TForm1 = class(TForm)
    BtnCarga: TButton;
    BtnIguales: TButton;
    Memo1: TMemo;
    BtnMostrar: TButton;
    BtnCargaEjmplo: TButton;
    procedure BtnCargaClick(Sender: TObject);
    procedure BtnMostrarClick(Sender: TObject);
    procedure BtnIgualesClick(Sender: TObject);
    procedure BtnCargaEjmploClick(Sender: TObject);
  private
    Cola1: Ejercicio6;
    Cola2: Ejercicio6;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 6
Dadas 2 colas cargadas con valores alfanuméricos se pide determinar si ambas contienen los mismos elementos.
Se considera que contendrán los mismos elementos sin importar su posición o las repeticiones. No se deben perder las colas originales.

Determinar la complejidad algorítmica de la solución.

Ejemplo: Si C1 = (A, B, E, D, H, A, Z) y C2 = (B, A, D, H, Z, E) se
consideran que contienen los mismos elementos y deberá retornar verdadero.
}

//Boton que carga las colas aleatoriamente
procedure TForm1.BtnCargaClick(Sender: TObject);
begin
  Cola1.Cargar_Aleatorio(Tamaño1,Minimo,Maximo);
  Cola2.Cargar_Aleatorio(Tamaño2,Minimo,Maximo);
  memo1.Lines.Add('Colas cargadas');
end;

//Boton que muetra las colas en el memo
procedure TForm1.BtnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Cola 1:');
  memo1.Lines.Add(Cola1.Mostrar_Cola);
  memo1.Lines.Add('Cola 2:');
  memo1.Lines.Add(Cola2.Mostrar_Cola);
end;

//Boton que revisa si dos colas son iguales
procedure TForm1.BtnIgualesClick(Sender: TObject);
var Iguales: Boolean;
begin
  Iguales := Cola1.Son_Iguales(Cola1,Cola2);
  //Iguales devolvera true si las colas son iguales, sino, devolvera Falso
  if Iguales then
  begin
    memo1.Lines.Add('Las colas son iguales');
  end
  else
  begin
    memo1.Lines.Add('No son iguales');
  end;
end;

//Boton que carga las colas en base al ejemplo dado en la practica
procedure TForm1.BtnCargaEjmploClick(Sender: TObject);
begin
  Cola1.Cargar_Ejemplo1;
  Cola2.Cargar_Ejemplo2;
  memo1.Lines.Add('Colas cargadas');
end;

end.
