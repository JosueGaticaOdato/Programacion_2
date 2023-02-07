unit CodigoEjercicio11;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, TADEjercicio11, Tipos;

const
  CantidadMaxima = 50;

type
  TForm1 = class(TForm)
    Label4: TLabel;
    Numero1: TEdit;
    Numero2: TEdit;
    Label3: TLabel;
    btnMCD: TButton;
    Label2: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnMCDClick(Sender: TObject);
  private
    { Private declarations }
    Pila: Stack;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 10
Construir un algoritmo recursivo que permita determinar el máximo común divisor.
Utilizar una pila para guardar la signatura de la llamada a la función
cada vez que se hace una llamada recursiva. Al finalizar y hallar
el resultado mostrar en pantalla la pila de llamadas.

Ejemplo

Al calcular el máximo común divisor entre 20 y 12.
mcd(20, 12) ==> mcd(12, 8) ==> mcd(8, 4) ==> mcd(4, 4) ==> 4
Resultado a imprimir:
mcd(4, 4)
mcd(8, 4)
mcd(12, 8)
mcd(20, 12)
}


//Boton que me devuelve el MCD y la llamada recursiva correspondiente
procedure TForm1.btnMCDClick(Sender: TObject);
var MCD: Integer;
begin
  MCD := Pila.MaximoComunDivisor(StrtoInt(Numero1.Text),StrToint(Numero2.Text));
  memo1.Lines.Add('El maximo comun divisor entre esos dos numeros es ' + MCD.ToString);
  memo1.Lines.Add('Llamado recursivo');
  memo1.Lines.Add(Pila.mostarPila);
end;

//Creacion de la pila
procedure TForm1.FormCreate(Sender: TObject);
begin
  Pila.crearPila(CantidadMaxima);
  memo1.Clear;
end;

end.
