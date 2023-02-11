unit Ej4Conjuntos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Ej4ConjuntosTAD, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnCargar: TButton;
    btnMostrar: TButton;
    btnSubconjunto: TButton;
    Button1: TButton;
    procedure btnCargarClick(Sender: TObject);
    procedure btnMostrarClick(Sender: TObject);
    procedure btnSubconjuntoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    C1,C2:Ej4;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Ejercicio 4
  Dados dos conjuntos de números naturales se pide determinar si uno es subconjunto propio del otro.

  Determinar la complejidad algorítmica.

  Ejemplo: si A = (3, 4, 5) y B = (1, 2, 3, 4, 5, 6, 7, 8, 9)
  entonces a A es un subconjunto propio del conjunto B porque todos los elementos de A están en B pero A <> B.
}

//Boton que carga los conjuntos con valores aleatorios
procedure TForm1.btnCargarClick(Sender: TObject);
begin
  C1.cargarConjuntoSub;
  C2.cargarConjunto;
  memo1.Lines.Add('Se cargaron los conjuntos correctamente');
end;

//Boton que muestra el contenido de ls conjuntos
procedure TForm1.btnMostrarClick(Sender: TObject);
begin
  memo1.Lines.Add('Conjunto 1: ');
  memo1.Lines.Add(C1.mostrarConjunto(C1));
  memo1.Lines.Add('Conjunto 2: ');
  memo1.Lines.Add(C2.mostrarConjunto(C2));
end;

//Boton que revisa si C1 es subconjunto de C2
procedure TForm1.btnSubconjuntoClick(Sender: TObject);
begin
   if C1.esSubconjunto(C2) then
   begin
    memo1.Lines.Add('El conjunto 1 es subconjunto del conjunto 2');
   end
   else
   begin
    memo1.Lines.Add('El conjunto 1 no es subconjunto del conjunto 2');
   end;
end;

//Bontu qe carga los conjuntos como en el ejemplo
procedure TForm1.Button1Click(Sender: TObject);
begin
  C1.cargarEjemplo(C2);
  memo1.Lines.Add('Se cargaron los conjuntos correctamente');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  C1.crearConjunto(tipoClave,cantElem);
  C2.crearConjunto(tipoClave,cantElem2);
end;

end.
