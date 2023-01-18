unit Unit_Ejercicio3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit_Matriz,Unit_Vector;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  M: Matriz; //Defino la variable

implementation

{$R *.dfm}

{
Ejercicio 3
Crear un TAD Matriz que represente una matriz cuadrada de n x n.
El TAD debe disponer de las siguientes operaciones:

.Sumar.
.Multiplicar.
.DiagonalPrincipal y DiagonalOpuesta que retornan como vectores del punto 2.
.MaximaFila y MaximaColumna que retornan cuál es la fila y
 columna cuya sumatoria es la mayor.
.MultiplicarEscalar para multiplicar la matriz por un escalar.
 Por ej. n * MA[]. Cada posición de la matriz es multiplicada por n.
.Buscar que recibe el valor a buscar y retorna la fila y la columna
 de la primera ocurrencia.
 }

//BOTON MULTIPLICACION
procedure TForm1.Button10Click(Sender: TObject);
var multiM: Matriz;
begin
  multiM.cargarAleatorio;
  memo1.Lines.Add('Nueva matriz para multiplicar:');
  memo1.Lines.Add(multiM.mostrar);
  M.Multiplicar(multiM);
  memo1.Lines.Add('Resultado');
  memo1.Lines.Add(multiM.mostrar);
end;

//BOTON DIAGONAL PRINCIPAL
procedure TForm1.Button1Click(Sender: TObject);
var
V: Vector;
begin
  V := M.DiagonalPrincipal;
  memo1.Lines.Add('Diagonal principal:');
  memo1.Lines.Add(M.mostrarDiagonal(V));
end;

//BOTON MAXIMA FILA
procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Add('La maxima fila es ' + Inttostr(M.maximaFila));
  memo1.Lines.Add('Valor:' + Inttostr(M.valorMaximaFila));
end;

//BOTON DIAGONAL OPUESTA
procedure TForm1.Button3Click(Sender: TObject);
var
V: Vector;
begin
  V := M.DiagonalOpuesta;
  memo1.Lines.Add('Diagonal opuesta:');
  memo1.Lines.Add(M.mostrarDiagonal(V));
end;

//BOTON MAXIMA COLUMNA
procedure TForm1.Button4Click(Sender: TObject);
begin
  memo1.Lines.Add('La maxima columna es ' + Inttostr(M.maximaColumna));
  memo1.Lines.Add('Valor:' + Inttostr(M.valorMaximaColumna));
end;

//BOTON PRODUCTO ESCALAR
procedure TForm1.Button5Click(Sender: TObject);
begin
  M.multiplicarEscalar(Strtoint(Edit1.Text));
  memo1.Lines.Add('Escalar aplicado!');
end;

//BOTON BUSCAR
procedure TForm1.Button6Click(Sender: TObject);
begin
  memo1.Lines.Add(M.buscar(strtoint(edit1.Text)));
end;

//BOTON CARGA MATRIZ
procedure TForm1.Button7Click(Sender: TObject);
begin
  M.cargarAleatorio;
  memo1.Lines.Add('Matriz cargada');
end;

//BOTON MOSTRAR MATRIZ
procedure TForm1.Button8Click(Sender: TObject);
begin
  memo1.Lines.Add(M.mostrar);
end;

//BOTON SUMA MATRICES
procedure TForm1.Button9Click(Sender: TObject);
var sumaM: Matriz;
begin
  sumaM.cargarAleatorio;
  memo1.Lines.Add('Nueva matriz para sumar:');
  memo1.Lines.Add(sumaM.mostrar);
  M.sumar(sumaM);
  memo1.Lines.Add('Resultado');
  memo1.Lines.Add(sumaM.mostrar);
end;

end.
