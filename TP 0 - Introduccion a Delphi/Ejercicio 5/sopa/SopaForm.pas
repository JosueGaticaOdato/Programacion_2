unit SopaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Sopa;

const
 sopa: matrizSopa = (
  ('M', 'O', 'C', 'O', 'K', 'I', 'R', 'V', 'S', 'G'),
  ('O', 'K', 'O', 'V', 'E', 'J', 'A', 'L', 'D', 'A'),
  ('N', 'J', 'G', 'K', 'L', 'F', 'S', 'V', 'L', 'L'),
  ('O', 'P', 'V', 'A', 'C', 'A', 'T', 'B', 'E', 'L'),
  ('P', 'A', 'R', 'H', 'E', 'U', 'E', 'L', 'Ó', 'I'),
  ('G', 'T', 'I', 'G', 'R', 'E', 'G', 'O', 'N', 'N'),
  ('B', 'O', 'Ñ', 'T', 'S', 'V', 'Y', 'T', 'U', 'A'),
  ('K', 'J', 'I', 'R', 'A', 'F', 'A', 'E', 'N', 'M'),
  ('A', 'G', 'J', 'M', 'O', 'H', 'D', 'J', 'P', 'T')
 );

 palabras: arrayPalabras = (
    'MOCO',
   'VACA',
   'TIGRE',
   'GALLINA',
   'LEÓN',
   'OVEJA',
   'PATO',
   'MONO',
   'JIRAFA'
 );

{ palabras: arrayPalabras = (
   'LEÓN',
   'JIRAFA'
 );}

type
  TForm1 = class(TForm)
    bResolverSopa: TButton;
    Memo: TMemo;
    procedure bResolverSopaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 5
Generar un programa que resuelva sopas de letras.
Debe permitirle al usuario:
.Cargar la grilla de letras completa en una matriz y mostrarla.
.Cargar en un vector, una por una, las palabras a buscar y también mostrarla.
.Disponer la resolución de la sopa (una vez cargadas la grilla y las palabras).
La aplicación listará, para cada palabra las celdas de la grilla que ocupa.
}

procedure TForm1.bResolverSopaClick(Sender: TObject);
var
  resultado: RecordResultado;
begin
  resultado := resolverSopa(Sopa, palabras);
  Memo.Lines.Add(mostrarResultado(resultado));
end;

end.
