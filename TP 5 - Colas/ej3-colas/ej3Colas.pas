unit ej3Colas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,ej3ColasTAD;

type
  TForm1 = class(TForm)
    btnCargar: TButton;
    btnPasarNoRepetidos: TButton;
    btnMostrar: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnPasarNoRepetidosClick(Sender: TObject);
  private
    { Private declarations }
    C: Ej3;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//Dada una cola de números enteros, ordenada, construir un algoritmo que permita
// pasar a otra cola todos los elementos que no se repiten en la primera, sin
//  destruir el contenido de la cola original y dejándola en su estado inicial.
//
//Determinar la complejidad algorítmica de la solución.
//
//    Ejemplo: si C contiene (5, 6, 8, 8, 12, 12) la cola resultado del proceso
//     sería (5, 6).

procedure TForm1.btnCargarClick(Sender: TObject);
begin
  C.cargarColas(cantElemCola,Min,Max);
  C := C.ordenarCola;
  memo1.Lines.Add('Cola 1: ');
  memo1.Lines.Add(C.mostrarCola());
end;

procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Cola: ');
  memo1.Lines.Add(C.mostrarCola);
end;

procedure TForm1.btnPasarNoRepetidosClick(Sender: TObject);
var E: Ej3;
begin
  E := C.pasarNoRepetidos;
  memo1.Lines.Add('Cola con los elementos no repetidos: ');
  memo1.Lines.Add(E.mostrarCola);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C.crearCola(tipoClave,cantElemCola);
  Memo1.Clear;
end;

end.
